//
//  ContentView.swift
//  StarCafe
//
//  Created by thoonk on 2023/03/24.
//

import SwiftUI

struct MainTabView: View {
    let numbers: [Int] = (0...100).map { $0 }
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Tab.home.imageItem
                    Tab.home.textItem
                }
            OtherView()
                .tabItem {
                    Tab.other.imageItem
                    Tab.other.textItem
                }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
