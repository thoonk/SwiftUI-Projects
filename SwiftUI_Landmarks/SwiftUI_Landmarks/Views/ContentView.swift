//
//  ContentView.swift
//  SwiftUI_Landmarks
//
//  Created by 김태훈 on 2021/06/15.
//

import SwiftUI

/// 뷰의 content와 layout
/// - Landmark App의 루트 뷰
struct ContentView: View {
    @State private var selection: Tab = .featured
    
    enum Tab {
        case featured
        case list
    }
    
    var body: some View {
        TabView(selection: $selection) {
            CategoryHome()
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.featured)
            
            LandmarkList()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
    }
}

/// 뷰의 preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        // 모든 하위 뷰에서 ModelData 객체를 사용할 수 있도록 설정
        ContentView()
            .environmentObject(ModelData())
    }
}
