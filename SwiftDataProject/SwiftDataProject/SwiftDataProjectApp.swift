//
//  SwiftDataProjectApp.swift
//  SwiftDataProject
//
//  Created by thoonk on 1/17/25.
//

import SwiftUI

@main
struct SwiftDataProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
