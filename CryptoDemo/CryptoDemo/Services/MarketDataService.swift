//
//  MarketDataService.swift
//  CryptoDemo
//
//  Created by ma23001 on 3/12/25.
//

import Combine
import Foundation

final class MarketDataService {
    
    @Published var marketData: MarketDataModel? = nil
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        getData()
    }
    
    func getData() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/global") else { return }
        
        NetworkManager.download(url: url)
            .decode(type: GlobalData.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkManager.handleCompletion) { [weak self] globalData in
                self?.marketData = globalData.data
            }
            .store(in: &cancellables)
    }
}
