//
//  SettingView.swift
//  StarCafe
//
//  Created by thoonk on 2023/03/28.
//

import SwiftUI

struct SettingView: View {
    var body: some View {
        List {
            Section {
                SettingUserInfoSectionView()
            }
            
            Button("회원 정보 수정") {}
                .tint(.black)
            Button("회원 탈퇴") {}
                .tint(.black)
        }
            .navigationTitle("설정")
            .listStyle(.grouped)
            .scrollContentBackground(.hidden)
            .background(.background)
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct SettingUserInfoSectionView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4.0) {
                Text(User.shared.name)
                    .font(.title)
                Text(User.shared.account)
                    .font(.caption)
            }
            
            Spacer()
            
            Button(action: {}) {
                Text("로그아웃")
                    .tint(.green)
                    .font(.system(size: 14.0, weight: .bold, design: .default))
            }
            .padding(8.0)
            .overlay(Capsule().stroke(.green))
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
