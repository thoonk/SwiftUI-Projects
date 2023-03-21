//
//  CenterRow.swift
//  FindCoronaCenter
//
//  Created by thoonk on 2023/03/21.
//

import SwiftUI

struct CenterRow: View {
    var center: Center
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(center.facilityName)
                    .font(.headline)
                Text(center.centerType.rawValue)
                    .font(.caption)
                    .foregroundColor(.gray)
                Spacer()
            }
            
            Text(center.address)
                .font(.footnote)
            
            if let url = URL(string: "tel:" + center.phoneNumber) {
                Link(center.phoneNumber, destination: url)
            }
        }
        .padding()
    }
}

struct CenterRow_Previews: PreviewProvider {
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
        CenterRow(center: center0)
    }
}
