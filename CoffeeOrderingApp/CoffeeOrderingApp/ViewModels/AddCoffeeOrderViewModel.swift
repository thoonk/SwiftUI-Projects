//
//  AddCoffeeOrderViewModel.swift
//  CoffeeOrderingApp
//
//  Created by thoonk on 2023/07/03.
//

import Foundation

final class AddCoffeeOrderViewModel: ObservableObject {
    
    var name: String = ""
    @Published var size: String = "Medium"
    @Published var coffeeName: String = ""
    
    private var webService: WebService
    var coffeeList: [CoffeeViewModel] {
        return Coffee.all().map(CoffeeViewModel.init)
    }
    
    var total: Double {
        return calculateTotalPrice()
    }
    
    init() {
        self.webService = WebService()
    }
    
    func placeOrder() {
        let order = Order(name: name, size: size, coffeeName: coffeeName, total: total)
        
        Task {
            let response = try? await webService.createCoffee(order: order)
            debugPrint(response?.success)
        }
    }
}

private extension AddCoffeeOrderViewModel {
    func calculateTotalPrice() -> Double {
        let coffeeViewModel = coffeeList.first { $0.name == coffeeName }
        if let coffeeViewModel = coffeeViewModel {
            return coffeeViewModel.price * priceForSize()
        } else {
            return 0.0
        }
    }
    
    func priceForSize() -> Double {
        let prices = ["Small": 2.0, "Medium": 3.0, "Large": 4.0]
        return prices[size]!
    }
}
