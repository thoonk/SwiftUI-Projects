//
//  ContentView.swift
//  ObservableObjectExample
//
//  Created by thoonk on 2023/07/03.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var userSettings: UserSettings
    // @ObservedObject
    
    var body: some View {
        VStack {
            Text("\(self.userSettings.score)")
                .font(.largeTitle)
            Button("Increment Score") {
                userSettings.score += 1
            }
            
//            FancyScoreView(score: $userSettings.score)
            FancyScoreView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(UserSettings())
    }
}
