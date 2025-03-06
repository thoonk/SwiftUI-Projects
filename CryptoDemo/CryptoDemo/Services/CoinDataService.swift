//
//  CoinDataService.swift
//  CryptoDemo
//
//  Created by ma23001 on 3/5/25.
//

import Combine
import Foundation

protocol CoinDataServiceProtocol {
    var allCoinsPublisher: AnyPublisher<[CoinModal], Never> { get }
    func fetchCoins() -> AnyPublisher<[CoinModal], NetworkError>
    func refresh()
}

final class CoinDataService {
    
    private let allCoinsSubject = CurrentValueSubject<[CoinModal], Never>([])
    var allCoinsPublisher: AnyPublisher<[CoinModal], Never> {
        return allCoinsSubject.eraseToAnyPublisher()
    }
    
    private var cancellables = Set<AnyCancellable>()
    private let apiKey: String
    private let baseURL: String
    
    init(
        apiKey: String = "CG-UZMsJZw1cyEpY2LHvY2KdyMy",
        baseURL: String = "https://api.coingecko.com/api/v3"
    ) {
        self.apiKey = apiKey
        self.baseURL = baseURL
        
        refresh()
    }
    
    func refresh() {
        fetchCoins()
            .sink(receiveCompletion: NetworkManager.handleCompletion, receiveValue: { [weak self] returnedCoins in
                self?.allCoinsSubject.send(returnedCoins)
            })
            .store(in: &cancellables)
    }
    
    private func fetchCoins() -> AnyPublisher<[CoinModal], NetworkError> {
        guard let url = makeCoinsURL() else {
            return Fail(error: NetworkError.invalidURL).eraseToAnyPublisher()
        }
        
        return NetworkManager.download(url: url)
            .decode(type: [CoinModal].self, decoder: JSONDecoder())
            .mapError { error -> NetworkError in
                if let networkError = error as? NetworkError {
                    return networkError
                }
                
                return NetworkError.unknown(error)
            }
            .eraseToAnyPublisher()
    }
    
    private func makeCoinsURL() -> URL? {
        let endpoint = "/coins/markets"
        let queryItems = [
            "vs_currency": "usd",
            "per_page": "250",
            "page": "1",
            "sparkline": "true",
            "price_change_percentage": "24h",
            "x_cg_demo_api_key": apiKey
        ]
        
        var urlComponents = URLComponents(string: baseURL + endpoint)
        urlComponents?.queryItems = queryItems.map { URLQueryItem(name: $0.key, value: $0.value) }
        
        return urlComponents?.url
    }
}

