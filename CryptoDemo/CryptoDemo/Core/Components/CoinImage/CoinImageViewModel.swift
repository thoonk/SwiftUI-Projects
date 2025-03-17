//
//  CoinImageViewModel.swift
//  CryptoDemo
//
//  Created by ma23001 on 3/6/25.
//

import Combine
import Foundation
import SwiftUI

final class CoinImageViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    
    private var cancellables = Set<AnyCancellable>()
    private let coin: CoinModel
    private let coinImageService: CoinImageService
    
    init(
        coin: CoinModel
    ) {
        self.coin = coin
        self.coinImageService = .init(coin: coin)
        self.isLoading = true
        
        fetchImage()
    }
    
    private func fetchImage() {
        coinImageService.$image
            .sink { [weak self] _ in
                self?.isLoading = false
            } receiveValue: { [weak self] image in
                self?.image = image
            }
            .store(in: &cancellables)
    }
}
