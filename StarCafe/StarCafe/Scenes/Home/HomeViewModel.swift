//
//  HomeViewModel.swift
//  StarCafe
//
//  Created by thoonk on 2023/03/30.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var isNeedToReload: Bool = false {
        didSet {
            reload()
        }
    }
    
    @Published var coffeeMenu: [CoffeeMenu] = [
        CoffeeMenu(image: Image("coffee"), name: "아메리카노"),
        CoffeeMenu(image: Image("coffee"), name: "아이스 아메리카노"),
        CoffeeMenu(image: Image("coffee"), name: "카페라떼"),
        CoffeeMenu(image: Image("coffee"), name: "드립커피"),
        CoffeeMenu(image: Image("coffee"), name: "콜드브루"),
        CoffeeMenu(image: Image("coffee"), name: "바닐라크림 콜드브루")
    ]
    
    @Published var events: [Event] = [
        Event(image: Image("coffee"), title: "제주도 한정 메뉴", description: "제주도 한정 음료가 출시되었습니다."),
        Event(image: Image("coffee"), title: "여름 한정 메뉴", description: "여름 한정 음료가 출시되었습니다.")
    ]
    
    func reload() {
        guard isNeedToReload == true else { return }
        
        coffeeMenu.shuffle()
        events.shuffle()
        isNeedToReload = false
    }
}
