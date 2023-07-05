//
//  CoffeeOrderingAppApp.swift
//  CoffeeOrderingApp
//
//  Created by thoonk on 2023/07/03.
//

import SwiftUI

@main
struct CoffeeOrderingAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    init() {
        UINavigationBar.appearance().backgroundColor = UIColor(
            displayP3Red: 165/255,
            green: 94/255,
            blue: 234/255,
            alpha: 1.0
        )
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
        UINavigationBar.appearance().titleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
    }
}
