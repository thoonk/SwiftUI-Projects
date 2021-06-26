//
//  CategoryRow.swift
//  SwiftUI_Landmarks
//
//  Created by 김태훈 on 2021/06/26.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [Landmark]
    
    var body: some View {
        VStack {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
        }
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 0) {
                ForEach(items) { landmark in
                    // LandmarkDetail로 전환 설정
                    NavigationLink(
                        destination: LandmarkDetail(landmark: landmark)
                    ) {
                        CategoryItem(landmark: landmark)
                    }
                }
            }
        }
        .frame(height: 185)
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks
    
    static var previews: some View {
        CategoryRow(
            categoryName: landmarks[0].category.rawValue,
            items: Array(landmarks.prefix(4))
        )
    }
}
