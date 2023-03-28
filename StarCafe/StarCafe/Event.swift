//
//  Event.swift
//  StarCafe
//
//  Created by thoonk on 2023/03/28.
//

import SwiftUI

struct Event: Identifiable {
    let id = UUID()
    let image: Image
    let title: String
    let description: String
    
    static let sample: [Event] = [
        Event(image: Image("coffee"), title: "제주도 한정 메뉴", description: "제주도 한정 음료가 출시되었습니다."),
        Event(image: Image("coffee"), title: "여름 한정 메뉴", description: "여름 한정 음료가 출시되었습니다.")
    ]
}
