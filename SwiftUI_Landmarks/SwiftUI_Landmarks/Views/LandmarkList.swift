//
//  LandmarkList.swift
//  SwiftUI_Landmarks
//
//  Created by 김태훈 on 2021/06/16.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        //        List {
        //            // static Row
        //            LandmarkRow(landmark: landmarks[0])
        //            LandmarkRow(landmark: landmarks[1])
        //        }
        /*
         List는 identifiable data와 동작함
         data를 identifiable하게 만드는 방법으로는 데이터와 함께 각 요소를
         고유하게 식별하는 속성의 키 경로를 전달하거나 data type을 Identifiable protocol을
         따르는 방법이 있음.
         */
        
        // Navigation 생성 및 title 설정
        NavigationView {
            List(landmarks, id: \.id) { landmark in
                // 다른 뷰로 전환
                NavigationLink(
                    destination: LandmarkDetail(landmark: landmark)
                ) {
                    LandmarkRow(landmark: landmark)
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(
            ["iPhone SE (2nd generation)", "iPhone XS Max"],
            id: \.self
        ) { deviceName in
            LandmarkList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
        
//        LandmarkList()
//            .previewDevice(
//                PreviewDevice(rawValue: "iPhone SE (2nd generation)")
//            )
    }
}
