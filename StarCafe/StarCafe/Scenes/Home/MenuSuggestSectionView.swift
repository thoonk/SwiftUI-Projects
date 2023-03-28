//
//  MenuSuggestSectionView.swift
//  StarCafe
//
//  Created by thoonk on 2023/03/28.
//

import SwiftUI

struct MenuSuggestSectionView: View {
    var body: some View {
        VStack {
            Text("\(User.shared.name)님을 위한 추천 메뉴")
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 16.0)

            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(CoffeeMenu.sample) { menu in
                        MenuSeggestionItemView(coffeeMenu: menu)
                    }
                }
                .padding(.horizontal, 16.0)
            }
        }
    }
}

struct MenuSeggestionItemView: View {
    let coffeeMenu: CoffeeMenu
    
    var body: some View {
        VStack {
            coffeeMenu.image
                .resizable()
                .frame(width: 100.0, height: 100.0)
                .clipShape(Circle())
            Text(coffeeMenu.name)
                .font(.caption)
        }
    }
}

struct MenuSuggestSectionView_Previews: PreviewProvider {
    static var previews: some View {
        MenuSuggestSectionView()
    }
}
