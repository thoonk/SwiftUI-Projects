//
//  SelectRegionViewModel.swift
//  FindCoronaCenter
//
//  Created by thoonk on 2023/03/21.
//

import Foundation
import Combine

class SelectRegionViewModel: ObservableObject {
    @Published var centers = [Center.Sido: [Center]]()
    private var cancellable = Set<AnyCancellable>()
    
    init(centerNetwork: CenterNetwork = CenterNetwork()) {
        centerNetwork.getCurrentList()
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] in
                    guard case .failure(let error) = $0 else { return }
                    print(error.localizedDescription)
                    self?.centers = [Center.Sido: [Center]]()
                },
                receiveValue: { [weak self] centers in
                    self?.centers = Dictionary(grouping: centers) { $0.sido }
                })
            .store(in: &cancellable)
    }
}
