//
//  LandmarkList.swift
//  SwiftUI_Landmarks
//
//  Created by 김태훈 on 2021/06/16.
//

import SwiftUI

struct LandmarkList: View {
    // modelData의 프로퍼티의 값을 자동으로 가져옴
    @EnvironmentObject var modelData: ModelData
    // 뷰와 하위 뷰의 특정 정보가 있으므로 private으로 설정
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
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
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites Only")
                }
                
                ForEach(filteredLandmarks) { landmark in
                    // 다른 뷰로 전환
                    NavigationLink(
                        destination: LandmarkDetail(landmark: landmark)
                    ) {
                        LandmarkRow(landmark: landmark)
                    }
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
                .environmentObject(ModelData())
        }
        
        //        LandmarkList()
        //            .previewDevice(
        //                PreviewDevice(rawValue: "iPhone SE (2nd generation)")
        //            )
    }
}
