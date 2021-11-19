//
//  HapticsManager.swift
//  iBeteApp
//
//  Created by Igor Samoel da Silva on 20/10/21.
//

import Foundation
import UIKit


final class HapticsManager {
    
    static let shared = HapticsManager()
    
    private init() {}
    
    ///Haptic for select actions
    public func selectionVibrate() {
        DispatchQueue.main.async {
            let selectionFeeback = UISelectionFeedbackGenerator()
            selectionFeeback.prepare()
            selectionFeeback.selectionChanged()
        }
    }
    ///Haptics for create,save,delete,change and others actions
    public func haptic(type: UINotificationFeedbackGenerator.FeedbackType) {
        DispatchQueue.main.async {
            let notificationGenerator = UINotificationFeedbackGenerator()
            notificationGenerator.prepare()
            notificationGenerator.notificationOccurred(type)
        }
    }
    
    
    
    
    
    
}
