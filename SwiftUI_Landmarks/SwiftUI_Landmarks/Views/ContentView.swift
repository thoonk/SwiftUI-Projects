//
//  ContentView.swift
//  SwiftUI_Landmarks
//
//  Created by 김태훈 on 2021/06/15.
//

import SwiftUI

/// 뷰의 content와 layout
struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

/// 뷰의 preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
