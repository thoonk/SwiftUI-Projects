//
//  ContentView.swift
//  UIFeedbackGeneratorDemo
//
//  Created by thoonk on 2023/06/14.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List {
            Section(header: Text("Selection")) {
                Button(action: {
                    HapticFeedbackServcie.shared.generate(hapticFeedback: .selection)
                }) {
                    Text("Selection")
                }
                .tint(.black)
            }
            
            Section(header: Text("IMPACT")) {
                Button(action: {
                    HapticFeedbackServcie.shared.generate(hapticFeedback: .impact(feedbackStyle: .light))
                }) {
                    Text("light")
                }
                .tint(.black)
                
                Button(action: {
                    HapticFeedbackServcie.shared.generate(hapticFeedback: .impact(feedbackStyle: .medium))
                }) {
                    Text("medium")
                }
                .tint(.black)
                
                Button(action: {
                    HapticFeedbackServcie.shared.generate(hapticFeedback: .impact(feedbackStyle: .heavy))
                }) {
                    Text("heavy")
                }
                .tint(.black)
                
                Button(action: {
                    HapticFeedbackServcie.shared.generate(hapticFeedback: .impact(feedbackStyle: .soft))
                }) {
                    Text("soft")
                }
                .tint(.black)
                
                Button(action: {
                    HapticFeedbackServcie.shared.generate(hapticFeedback: .impact(feedbackStyle: .rigid))
                }) {
                    Text("rigid")
                }
                .tint(.black)
            }
            
            Section(header: Text("NOTIFICATION")) {
                Button(action: {
                    HapticFeedbackServcie.shared.generate(hapticFeedback: .notification(feedbackType: .success))
                }) {
                    Text("success")
                }
                .tint(.black)
                
                Button(action: {
                    HapticFeedbackServcie.shared.generate(hapticFeedback: .notification(feedbackType: .warning))
                }) {
                    Text("warning")
                }
                .tint(.black)
                
                Button(action: {
                    HapticFeedbackServcie.shared.generate(hapticFeedback: .notification(feedbackType: .error))
                }) {
                    Text("error")
                }
                .tint(.black)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
