//
//  CenterList.swift
//  FindCoronaCenter
//
//  Created by thoonk on 2023/03/21.
//

import SwiftUI

struct CenterList: View {
    var centers = [Center]()
    
    var body: some View {
        List(centers, id: \.id) { center in
            NavigationLink(destination: CenterDetailView(center: center)) {
                CenterRow(center: center)
            }
            .navigationTitle(center.sido.rawValue)
        }
    }
}

struct CenterList_Previews: PreviewProvider {
    static var previews: some View {
        let centers = [
            Center(
               id: 1,
               sido: .서울특별시,
               facilityName: "국립중앙의료원 D동",
               address: "서울특별시 중구 을지로 39길 29",
               lat: "37.567817",
               lng: "127.004501",
               centerType: .central,
               phoneNumber: "02-2260-7114"
           ),
            
            Center(
               id: 1,
               sido: .서울특별시,
               facilityName: "국립중앙의료원 D동",
               address: "서울특별시 중구 을지로 39길 29",
               lat: "37.567817",
               lng: "127.004501",
               centerType: .central,
               phoneNumber: "02-2260-7114"
           )
        ]
        
        CenterList(centers: centers)
    }
}
