//
//  FavoriteButton.swift
//  SwiftUI_Landmarks
//
//  Created by 김태훈 on 2021/06/17.
//

import SwiftUI

struct FavoriteButton: View {
    
    /// button의 현재 상태, preview를 위한 contant 제공
    /// - 변경한 내용이 Binding을 통해 다른 뷰에 전달할 수 있음
    @Binding var isSet: Bool
    
    var body: some View {
        Button(action: {
            isSet.toggle()
        }) {
            Image(systemName: isSet ? "star.fill" : "star")
                .foregroundColor(isSet ? Color.yellow : Color.gray)
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
