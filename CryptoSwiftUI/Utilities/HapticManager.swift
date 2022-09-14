//
//  HapticManager.swift
//  CryptoSwiftUI
//
//  Created by Achref Ben Tekaya on 12/9/2022.
//

import Foundation
import SwiftUI

class HapticManager {
    
    static private let generator = UINotificationFeedbackGenerator()
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
}
