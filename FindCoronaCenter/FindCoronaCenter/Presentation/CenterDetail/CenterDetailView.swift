//
//  CenterDetailView.swift
//  FindCoronaCenter
//
//  Created by thoonk on 2023/03/23.
//

import SwiftUI
import MapKit

struct CenterDetailView: View {
    var center: Center
    
    var body: some View {
        VStack {
            MapView(coordination: center.coordinate)
                .ignoresSafeArea(edges: .all)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            CenterRow(center: center)
        }
        .navigationTitle(center.facilityName)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CenterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let center0 = Center(
            id: 1,
            sido: .서울특별시,
            facilityName: "국립중앙의료원 D동",
            address: "서울특별시 중구 을지로 39길 29",
            lat: "37.567817",
            lng: "127.004501",
            centerType: .central,
            phoneNumber: "02-2260-7114"
        )
        CenterDetailView(center: center0)
    }
}
