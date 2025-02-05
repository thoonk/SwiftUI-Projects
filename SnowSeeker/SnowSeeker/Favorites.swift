//
//  Favorites.swift
//  SnowSeeker
//
//  Created by thoonk on 2/5/25.
//

import Foundation

@Observable
final class Favorites {
    private var resorts: Set<String>
    
    private let key = "Favorites"
    
    init() {
        let savedResorts = UserDefaults.standard.stringArray(forKey: key) ?? []
        resorts = Set(savedResorts)
    }
    
    func contains(_ resort: Resort) -> Bool {
        resorts.contains(resort.id)
    }
    
    func add(_ resort: Resort) {
        resorts.insert(resort.id)
        save()
    }
    
    func remove(_ resort: Resort) {
        resorts.remove(resort.id)
        save()
    }
    
    func save() {
        UserDefaults.standard.set(Array(resorts), forKey: key)
    }
}
