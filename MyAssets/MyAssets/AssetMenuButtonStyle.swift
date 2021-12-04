//
//  AssetMenuButtonStyle.swift
//  MyAssets
//
//  Created by thoonk on 2021/12/04.
//

import SwiftUI

struct AssetMenuButtonStyle: ButtonStyle {
    let menu: AssetMenu
    
    func makeBody(configuration: Configuration) -> some View {
        return VStack {
            Image(systemName: menu.systemImageName)
                .resizable()
                .frame(width: 30, height: 30)
                .padding([.leading, .trailing], 10)
            Text(menu.title)
                .font(.system(size: 12, weight: .bold))
        }
//        .padding()
        .foregroundColor(.blue)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct AssetMenuButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        HStack(spacing: 24) {
            Button("") {
                debugPrint("")
            }
            .buttonStyle(AssetMenuButtonStyle(menu: .creditScore))
            Button("") {
                debugPrint("")
            }
            .buttonStyle(AssetMenuButtonStyle(menu: .bankAccount))
            Button("") {
                debugPrint("")
            }
            .buttonStyle(AssetMenuButtonStyle(menu: .investment))
            Button("") {
                debugPrint("")
            }
            .buttonStyle(AssetMenuButtonStyle(menu: .realEstate))
        }
        .background(Color.gray.opacity(0.2))
    }
}
