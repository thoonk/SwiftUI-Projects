//
//  OrderListViewModel.swift
//  CoffeeOrderingApp
//
//  Created by thoonk on 2023/07/03.
//

import Foundation

final class OrderListViewModel: ObservableObject {
    @Published var orders = [OrderViewModel]()
    
    init() {
        fetchOrders()
    }
    
    func fetchOrders() {
        Task {
            let orders = try? await WebService().getAllOrders()
            if let orders = orders {
                self.orders = orders.map(OrderViewModel.init)
            }
        }
    }
}
