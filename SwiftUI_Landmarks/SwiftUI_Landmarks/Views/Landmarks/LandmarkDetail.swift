//
//  LandmarkDetail.swift
//  SwiftUI_Landmarks
//
//  Created by 김태훈 on 2021/06/16.
//

import SwiftUI

struct LandmarkDetail: View {
    /// 상위에 적용된 environmentObject가 자동으로 할당된 프로퍼티
    @EnvironmentObject var modelData: ModelData
    var landmark: Landmark
    
    /// 입력된 landmark의 인덱스를 landmarks 배열에서의 인덱스
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            
            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                        .foregroundColor(.primary)
                    FavoriteButton(
                        isSet: $modelData
                            .landmarks[landmarkIndex]
                            .isFavorite
                    )
                }
                
                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            .padding()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        LandmarkDetail(landmark: ModelData().landmarks[0])
            .environmentObject(modelData)
    }
}
