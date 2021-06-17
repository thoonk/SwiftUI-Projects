//
//  SwiftUI_LandmarksApp.swift
//  SwiftUI_Landmarks
//
//  Created by 김태훈 on 2021/06/15.
//

import SwiftUI

@main
struct SwiftUI_LandmarksApp: App {
    // @StateObject를 사용하여 앱의 생애주기동안 한 번만 모델 객체를 초기화
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}

