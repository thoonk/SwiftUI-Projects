//
//  HomeHeaderView.swift
//  StarCafe
//
//  Created by thoonk on 2023/03/28.
//

import SwiftUI

struct HomeHeaderView: View {
    var body: some View {
        VStack(spacing: 16.0) {
            HStack(alignment: .top) {
                Text("""
                \(User.shared.name)님~
                반갑습니다! ☕️
                """)
                .font(.largeTitle)
                .frame(maxWidth: .infinity, alignment: .leading)
                .fixedSize(horizontal: false, vertical: true)
                
                Button(action: { print("Tapped") }) {
                    Image(systemName: "arrow.2.circlepath")
                }
            }
            
            HStack {
                Button(action: { print("Tapped") }) {
                    Image(systemName: "mail")
                        .foregroundColor(.secondary)
                    Text("What's New")
                        .foregroundColor(.primary)
                        .font(.system(size: 16.0, weight: .semibold, design: .default))
                }
                
                Button(action: { print("Tapped") }) {
                    Image(systemName: "ticket")
                        .foregroundColor(.secondary)
                    Text("Coupon")
                        .foregroundColor(.primary)
                        .font(.system(size: 16.0, weight: .semibold, design: .default))
                }
                Spacer()
                
                Button(action: { print("Tapped") }) {
                    Image(systemName: "bell")
                        .foregroundColor(.secondary)
                }
            }
        }
        .padding(16.0)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HomeHeaderView()
    }
}
