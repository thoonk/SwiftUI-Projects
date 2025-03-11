//
//  Order.swift
//  CupcakeCorner
//
//  Created by thoonk on 1/14/25.
//

import Foundation

@Observable
final class Order: Codable, Equatable {
    enum CodingKeys: String, CodingKey {
        case _type = "type"
        case _quantity = "quantity"
        case _specialRequestEnabled = "specialRequestEnabled"
        case _extraFrosting = "extraFrosting"
        case _addSprinkles = "addSprinkles"
        case _name = "name"
        case _city = "city"
        case _streetAddress = "streetAddress"
        case _zip = "zip"
    }
    
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    var type = 0
    var quantity = 3
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
    
    var hasValidAddress: Bool {
        if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty {
            return false
        }
        
        return true
    }

    var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    var extraFrosting = false
    var addSprinkles = false
    
    var cost: Decimal {
        var cost = Decimal(quantity) * 2
        cost += Decimal(type) / 2
        
        if extraFrosting {
            cost += Decimal(quantity)
        }
        
        if addSprinkles {
            cost += Decimal(quantity) / 2
        }
        
        return cost
    }
    
    static func == (lhs: Order, rhs: Order) -> Bool {
        return lhs.type == rhs.type &&
        lhs.quantity == rhs.quantity &&
        lhs.name == rhs.name &&
        lhs.streetAddress == rhs.streetAddress &&
        lhs.city == rhs.city &&
        lhs.zip == rhs.zip
    }
}

extension Order {
    private static let orderKey = "Order"
    
    func saveToUserDefaults() {
        if let encoded = try? JSONEncoder().encode(self) {
            UserDefaults.standard.set(encoded, forKey: Order.orderKey)
        } else {
            print("Failed to encode order")
        }
    }
    
    static func loadFromUserDefaults() -> Order {
        if let savedData = UserDefaults.standard.data(forKey: Order.orderKey),
           let decoded = try? JSONDecoder().decode(Order.self, from: savedData) {
            return decoded
        } else {
            print("Failed to decode order")
            return Order()
        }
    }
}
