//
//  CoffeeMenu.swift
//  StarCafe
//
//  Created by thoonk on 2023/03/28.
//

import SwiftUI

struct CoffeeMenu: Identifiable {
    var id = UUID()
    let image: Image
    let name: String
    
    static let sample: [CoffeeMenu] = [
        CoffeeMenu(image: Image("coffee"), name: "아메리카노"),
        CoffeeMenu(image: Image("coffee"), name: "아이스 아메리카노"),
        CoffeeMenu(image: Image("coffee"), name: "카페라떼"),
        CoffeeMenu(image: Image("coffee"), name: "드립커피"),
        CoffeeMenu(image: Image("coffee"), name: "콜드브루"),
        CoffeeMenu(image: Image("coffee"), name: "바닐라크림 콜드브루")
    ]
}
