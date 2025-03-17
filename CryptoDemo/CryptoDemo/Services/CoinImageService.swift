//
//  CoinImageService.swift
//  CryptoDemo
//
//  Created by ma23001 on 3/6/25.
//

import Combine
import SwiftUI

final class CoinImageService {
    
    @Published var image: UIImage? = nil
        
    private var cancellables = Set<AnyCancellable>()
    private let fileManager = LocalFileManager.instance
    private let folderName = "coin_images"
    
    init(coin: CoinModel) {
        loadCoinImage(coin: coin)
    }
    
    private func loadCoinImage(coin: CoinModel) {
        if let savedImage = fileManager.loadImage(name: coin.id, folderName: folderName) {
            image = savedImage
            print("Retrieving image from cache")
        } else {
            downloadCoinImage(coin: coin)
            print("Downloading image")
        }
    }
    
    private func downloadCoinImage(coin: CoinModel) {
        guard let url = URL(string: coin.image)
        else {
            return
        }
        
        let imageName = coin.id
        
        return NetworkManager.download(url: url)
            .mapError { error -> NetworkError in
                if let networkError = error as? NetworkError {
                    return networkError
                }
                
                return NetworkError.unknown(error)
            }
            .sink(receiveCompletion: NetworkManager.handleCompletion) { [weak self] data in
                guard let self,
                      let image = UIImage(data: data)
                else { return }
                
                self.image = image
                self.fileManager.saveImage(image, imageName: imageName, folderName: self.folderName)
            }
            .store(in: &cancellables)
    }
}
