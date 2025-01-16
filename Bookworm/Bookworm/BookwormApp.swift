//
//  BookwormApp.swift
//  Bookworm
//
//  Created by thoonk on 1/15/25.
//

import SwiftData
import SwiftUI

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
