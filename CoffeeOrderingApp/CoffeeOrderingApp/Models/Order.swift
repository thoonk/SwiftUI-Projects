//
//  Order.swift
//  CoffeeOrderingApp
//
//  Created by thoonk on 2023/07/03.
//

import Foundation

struct Order: Codable {
    let name: String
    let size: String
    let coffeeName: String
    let total: Double
}
