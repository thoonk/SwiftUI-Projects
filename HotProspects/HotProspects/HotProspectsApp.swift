//
//  HotProspectsApp.swift
//  HotProspects
//
//  Created by thoonk on 1/24/25.
//

import SwiftData
import SwiftUI

@main
struct HotProspectsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Prospect.self)
    }
}
