//
//  OtherView.swift
//  StarCafe
//
//  Created by thoonk on 2023/03/28.
//

import SwiftUI

struct OtherView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(SettingMenu.allCases) { section in
                    Section(header: Text(section.title)) {
                        ForEach(section.menu, id: \.hashValue) { raw in
                            NavigationLink(raw, destination: SettingView())
                        }
                    }
                }
            }
            .listStyle(.grouped)
            .scrollContentBackground(.hidden)
            .background(.background)
            .navigationTitle("Other")
            .toolbar {
                NavigationLink(destination: Text("Destination")) {
                    Image(systemName: "gear")
                }
            }
        }
    }
}

struct OtherView_Previews: PreviewProvider {
    static var previews: some View {
        OtherView()
    }
}
