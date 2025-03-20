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
    @State private var showLaunchView: Bool = true
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]
    }
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                NavigationView {
                    HomeView()
                        .navigationBarHidden(true)
                }
                .navigationViewStyle(StackNavigationViewStyle())
                .environmentObject(viewModel)
                
                ZStack {
                    if showLaunchView {
                        LaunchView(showLaunchView: $showLaunchView)
                            .transition(.opacity)
                            .animation(.easeOut(duration: 1.0), value: showLaunchView)
                    }
                }
                .zIndex(2.0)
            }
        }
    }
}
