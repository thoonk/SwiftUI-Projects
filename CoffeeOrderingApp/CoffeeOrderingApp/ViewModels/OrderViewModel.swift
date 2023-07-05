//
//  OrderViewModel.swift
//  CoffeeOrderingApp
//
//  Created by thoonk on 2023/07/03.
//

import Foundation

final class OrderViewModel {
    let id = UUID()
    var order: Order
    
    init(order: Order) {
        self.order = order
    }
    
    var name: String {
        return order.name
    }
    
    var size: String {
        return order.size
    }
    
    var coffeeName: String {
        return order.coffeeName
    }
    
    var total: Double {
        return order.total
    }
}
