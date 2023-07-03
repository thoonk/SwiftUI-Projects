//
//  ObservableObjectExampleApp.swift
//  ObservableObjectExample
//
//  Created by thoonk on 2023/07/03.
//

import SwiftUI

@main
struct ObservableObjectExampleApp: App {
    var body: some Scene {
        WindowGroup {
            let userSettings = UserSettings()
            ContentView().environmentObject(userSettings)
        }
    }
}
