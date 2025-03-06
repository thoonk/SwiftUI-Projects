//
//  CryptoDemoApp.swift
//  CryptoDemo
//
//  Created by ma23001 on 3/4/25.
//

import SwiftUI

@main
struct CryptoDemoApp: App {
    
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
            .environmentObject(viewModel)
        }
    }
}
