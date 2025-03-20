//
//  NetworkManager.swift
//  CryptoDemo
//
//  Created by ma23001 on 3/5/25.
//

import Combine
import Foundation

enum NetworkError: Error {
    case invalidURL
    case badServerResponse(statusCode: Int)
    case decodingError
    case unknown(Error)
    
    var errorDescription: String {
        switch self {
        case .invalidURL:
            return "유효하지 않은 URL입니다."
        case .badServerResponse(let statusCode):
            return "서버 응답이 올바르지 않습니다. 상태 코드: \(statusCode)"
        case .decodingError:
            return "데이터 디코딩 중 오류가 발생했습니다."
        case .unknown(let error):
            return "알 수 없는 오류: \(error.localizedDescription)"
        }
    }
}

final class NetworkManager {
    
    static func download(url: URL) -> AnyPublisher<Data, Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap({ try handleURLResponse(output: $0) })
            .retry(3)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    static func handleURLResponse(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard let response = output.response as? HTTPURLResponse else {
            throw NetworkError.badServerResponse(statusCode: 0)
        }
        
        guard response.statusCode >= 200 && response.statusCode < 300 else {
            throw NetworkError.badServerResponse(statusCode: response.statusCode)
        }
        
        return output.data
    }
    
    static func handleCompletion<E: Error>(completion: Subscribers.Completion<E>) {
        switch completion {
        case .finished:
            break
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
}
