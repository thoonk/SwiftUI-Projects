//
//  LandmarkRow.swift
//  SwiftUI_Landmarks
//
//  Created by 김태훈 on 2021/06/16.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            
            Text(landmark.name)
            
            Spacer()
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        // landmarks의 첫번째 요소로 landmark 초기화
        // previewLayout()을 통해 row의 사이즈 설정
        Group {
            LandmarkRow(landmark: landmarks[0])
            LandmarkRow(landmark: landmarks[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
