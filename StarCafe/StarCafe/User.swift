//
//  User.swift
//  StarCafe
//
//  Created by thoonk on 2023/03/28.
//

import Foundation

struct User {
    let name: String
    let account: String
    
    static let shared = User(name: "끝비", account: "thoonk.com")
}
