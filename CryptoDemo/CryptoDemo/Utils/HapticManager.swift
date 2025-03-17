//
//  HapticManager.swift
//  CryptoDemo
//
//  Created by ma23001 on 3/17/25.
//

import Foundation
import SwiftUI

final class HapticManager {
    
    static private let generator = UINotificationFeedbackGenerator()
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
}
