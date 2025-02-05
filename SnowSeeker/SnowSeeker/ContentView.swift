//
//  ContentView.swift
//  SnowSeeker
//
//  Created by thoonk on 2/5/25.
//

import SwiftUI

enum SortType {
    case `default`
    case alphabetical
    case country
}

struct ContentView: View {
    @State private var searchText = ""
    @State private var favorites = Favorites()
    @State private var sortType: SortType = .default
    let resorts: [Resort] = Bundle.main.decode("resorts.json")
    var filteredResorts: [Resort] {
        searchText.isEmpty
        ? resorts
        : resorts.filter { $0.name.localizedStandardContains(searchText) }
    }
    
    var sortedResults: [Resort] {
        switch sortType {
        case .default:
            return filteredResorts
        case .alphabetical:
            return filteredResorts.sorted { $0.name < $1.name }
        case .country:
            return filteredResorts.sorted { $0.country < $1.country }
        }
    }
    
    var body: some View {
        NavigationSplitView {
            List(sortedResults) { resort in
                NavigationLink(value: resort) {
                    HStack {
                        Image(resort.country)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 25)
                            .clipShape(
                                .rect(cornerRadius: 5)
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.black, lineWidth: 1)
                            )
                        
                        VStack(alignment: .leading) {
                            Text(resort.name)
                                .font(.headline)
                            Text("\(resort.runs) runs")
                                .foregroundStyle(.secondary)
                        }
                        
                        if favorites.contains(resort) {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .foregroundStyle(.red)
                                .accessibilityLabel("This is a favorite resort")
                        }
                    }
                }
            }
            .navigationTitle("Resorts")
            .navigationDestination(for: Resort.self) { resort in
                ResortView(resort: resort)
            }
            .searchable(text: $searchText, prompt: "Search for a resort")
            .toolbar {
                Menu("Sort") {
                    Button("Default") {
                        sortType = .default
                    }
                    Button("Alphabetical") {
                        sortType = .alphabetical
                    }
                    Button("Country") {
                        sortType = .country
                    }
                }
            }
        } detail : {
            WelcomeView()
        }
        .environment(favorites)
    }
}

#Preview {
    ContentView()
}
