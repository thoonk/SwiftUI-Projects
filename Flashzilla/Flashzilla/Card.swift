//
//  Card.swift
//  Flashzilla
//
//  Created by thoonk on 2/3/25.
//

import Foundation

struct Card: Codable {
    var prompt: String
    var answer: String
    
    static let example = Card(prompt: "Who played the 13th Doctor in Doctor Who?", answer: "Jodie Whittaker")
}
