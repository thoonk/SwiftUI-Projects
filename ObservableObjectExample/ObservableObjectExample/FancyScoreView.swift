//
//  FancyScoreView.swift
//  ObservableObjectExample
//
//  Created by thoonk on 2023/07/03.
//

import SwiftUI

struct FancyScoreView: View {
    
    //@Binding
    @EnvironmentObject var userSettings: UserSettings
    
    var body: some View {
        VStack {
            Text("\(userSettings.score)")
                .font(.largeTitle)
            Button("Increment Score") {
                userSettings.score += 1
            }.padding()
                .background(Color.green )
        }
        .padding()
        .background(Color.orange)
    }
}

struct FancyScoreView_Previews: PreviewProvider {
    static var previews: some View {
//        FancyScoreView(score: .constant(0))
        FancyScoreView()
    }
}
