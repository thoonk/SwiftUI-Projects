//
//  WebService.swift
//  CoffeeOrderingApp
//
//  Created by thoonk on 2023/07/03.
//

import Foundation

final class WebService {
    func getAllOrders() async throws -> [Order]? {
        guard let url = URL(string: "https://island-bramble.glitch.me/orders")
        else { return nil }
        
        let request = URLRequest(url: url)
        let (data, _) = try await URLSession.shared.data(for: request)
        let model = try JSONDecoder().decode([Order].self, from: data)
        return model
    }
    
    func createCoffee(order: Order) async throws -> CreateOrderResponse? {
        guard let url = URL(string: "https://island-bramble.glitch.me/orders")
        else { fatalError("Invalid URL") }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(order)
        
        let (data, _) = try await URLSession.shared.data(for: request)
        return  try? JSONDecoder().decode(CreateOrderResponse.self, from: data)
    }
}
