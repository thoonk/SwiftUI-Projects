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
}
