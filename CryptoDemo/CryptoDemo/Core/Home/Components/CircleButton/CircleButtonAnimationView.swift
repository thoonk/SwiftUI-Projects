//
//  CircleButtonAnimationView.swift
//  CryptoDemo
//
//  Created by ma23001 on 3/4/25.
//

import SwiftUI

struct CircleButtonAnimationView: View {
    
    @Binding var animate: Bool
    
    var body: some View {
        Circle()
            .stroke(lineWidth: 0.5)
            .scale(animate ? 1.0 : 0.0)
            .opacity(animate ? 0.0 : 1.0)
//            .animation(animate ? .easeOut(duration: 1.0) : .none)
            .animation(.easeOut(duration: 1.0), value: animate)
            .onAppear {
                animate.toggle()
            }
    }
}

#Preview {
    CircleButtonAnimationView(animate: .constant(false))
        .foregroundColor(.red)
        .frame(width: 100, height: 100)
}
