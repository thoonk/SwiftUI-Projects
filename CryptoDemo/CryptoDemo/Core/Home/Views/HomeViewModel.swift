//
//  HomeViewModel.swift
//  CryptoDemo
//
//  Created by ma23001 on 3/5/25.
//

import Combine
import Foundation

final class HomeViewModel: ObservableObject {
    
    @Published var allCoins: [CoinModal] = []
    @Published var portfolioCoins: [CoinModal] = []
    
    @Published private(set) var isLoading = false
    @Published private(set) var errorMessage: String?
    
    private let coinDataService: CoinDataService
    private var cacnellables = Set<AnyCancellable>()
    
    init (coinDataService: CoinDataService = .init()) {
        self.coinDataService = coinDataService
        
        bindServices()
    }
    
    func refresh() {
        isLoading = true
        errorMessage = nil
        coinDataService.refresh()
    }
    
    private func bindServices() {
        coinDataService.allCoinsPublisher
            .sink { [weak self] coins in
                self?.allCoins = coins
                self?.isLoading = false
            }
            .store(in: &cacnellables)
    }
}
