//
//  CoinDetailDataService.swift
//  CryptoDemo
//
//  Created by ma23001 on 3/19/25.
//

import Combine
import Foundation

protocol CoinDetailDataServiceProtocol {
    var coinDetails: CoinDetailModel? { get set }
    func fetchCoinDetails()
}

final class CoinDetailDataService: CoinDetailDataServiceProtocol {
    
    @Published var coinDetails: CoinDetailModel? = nil
    let coin: CoinModel
    private let baseURL: String
    private var cancellables = Set<AnyCancellable>()
    
    init(
        coin: CoinModel,
        baseURL: String = "https://api.coingecko.com/api/v3"
    ) {
        self.coin = coin
        self.baseURL = baseURL
        
        fetchCoinDetails()
    }
    
    func fetchCoinDetails() {
        guard let url = makeCoinsURL(coinId: coin.id) else {
            return
        }
        
        return NetworkManager.download(url: url)
            .decode(type: CoinDetailModel.self, decoder: JSONDecoder())
            .mapError { error -> NetworkError in
                if let networkError = error as? NetworkError {
                    return networkError
                }
                
                return NetworkError.unknown(error)
            }
            .sink(receiveCompletion: NetworkManager.handleCompletion) { [weak self] coinDetails in
                self?.coinDetails = coinDetails
            }
            .store(in: &cancellables)
    }
    
    private func makeCoinsURL(coinId: String) -> URL? {
        let endpoint = "/coins/\(coinId)"
        let queryItems = [
            "tickers": "false",
            "market_data": "false",
            "community_data": "false",
            "developer_data": "false",
            "sparkline": "false"
        ]
        
        var urlComponents = URLComponents(string: baseURL + endpoint)
        urlComponents?.queryItems = queryItems.map { URLQueryItem(name: $0.key, value: $0.value) }
        
        return urlComponents?.url
    }
}

