//
//  HapticFeedbackService.swift
//  UIFeedbackGeneratorDemo
//
//  Created by thoonk on 2023/06/14.
//

import UIKit

enum HapticFeedback {
    case selection
    case impact(feedbackStyle: UIImpactFeedbackGenerator.FeedbackStyle)
    case notification(feedbackType: UINotificationFeedbackGenerator.FeedbackType)
}

final class HapticFeedbackServcie {
    static let shared = HapticFeedbackServcie()
    
    private init() {}
    
    func generate(hapticFeedback: HapticFeedback) {
        
        switch hapticFeedback {
        case .selection:
            let generator = UISelectionFeedbackGenerator()
            generator.prepare()
            generator.selectionChanged()
        case .impact(let feedbackStyle):
            let generator = UIImpactFeedbackGenerator(style: feedbackStyle)
            generator.prepare()
            generator.impactOccurred()
        case .notification(let feedbackType):
            let generator = UINotificationFeedbackGenerator()
            generator.prepare()
            generator.notificationOccurred(feedbackType)
        }
    }
}
