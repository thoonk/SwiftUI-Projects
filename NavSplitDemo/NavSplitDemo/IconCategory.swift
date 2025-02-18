//
//  IconCategory.swift
//  NavSplitDemo
//
//  Created by ma23001 on 2/18/25.
//

import Foundation

struct IconCategory: Identifiable, Hashable {
    let id: UUID = .init()
    var categoryName: String
    var images: [String]
}
