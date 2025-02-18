//
//  ContentView.swift
//  NavSplitDemo
//
//  Created by ma23001 on 2/18/25.
//

import SwiftUI

struct ContentView: View {
    @State private var categories: [IconCategory] = [
        IconCategory(categoryName: "Folders", images: [
            "questionmark.folder.ar",
            "questionmark.folder",
            "questionmark.folder.fill.ar",
            "folder.fill.badge.gear",
            "questionmark.folder.fill"
        ]),
        IconCategory(categoryName: "Circles", images: [
            "book.circle",
            "books.vertical.circle",
            "books.vertical.circle.fill",
            "book.circle",
            "book.closed.circle"
        ]),
        IconCategory(categoryName: "Clouds", images: [
            "cloud",
            "cloud.drizzle.fill",
            "cloud.fill",
            "cloud.drizzle"
        ])
    ]
    @State private var selectedCategory: IconCategory?
    @State private var selectedImage: String?
    @State private var columnVisibility: NavigationSplitViewVisibility = .all
    
    var body: some View {
        NavigationSplitView(columnVisibility: $columnVisibility) {
            List(categories, selection: $selectedCategory) { category in
                Text(category.categoryName).tag(category)
            }
        } content: {
            if let selectedCategory {
                List(selectedCategory.images, id: \.self, selection: $selectedImage) { image in
                    HStack {
                        Image(systemName: image)
                        Text(image)
                    }.tag(image)
                }
            } else {
                Text("Select a Category")
            }
        } detail: {
            if let selectedImage {
                Image(systemName: selectedImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
            } else {
                Text("Select an image")
            }
        }
        .navigationSplitViewStyle(.balanced)
    }
}

#Preview {
    ContentView()
}
