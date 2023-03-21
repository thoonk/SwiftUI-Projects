//
//  SelectRegionItem.swift
//  FindCoronaCenter
//
//  Created by thoonk on 2023/03/21.
//

import SwiftUI

struct SelectRegionItem: View {
    var region: Center.Sido
    var count: Int
    
    var body: some View {
        ZStack {
            Color(white: 0.9)
            VStack {
                Text(region.rawValue)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.purple)
                Text("(\(count)")
                    .font(.callout)
                    .fontWeight(.light)
                    .foregroundColor(.gray)
            }
            .padding()
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct SelectRegionItem_Previews: PreviewProvider {
    static var previews: some View {
        let region0 = Center.Sido.경기도
        SelectRegionItem(region: region0, count: 2)
    }
}
