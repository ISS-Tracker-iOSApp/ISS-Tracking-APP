//
//  Toggleble.swift
//  Nano7App
//
//  Created by Igor Samoel da Silva on 19/11/21.
//

import Foundation
import UIKit
protocol Toggleble {
    var toggle: UISwitch? { get set }
    //    mutating func setTarget(buttonTarget: Any?, buttonAction: Selector, buttonEvent: UIControl.Event)
}

extension Toggleble {
    mutating func setTarget(buttonTarget: Any?, buttonAction: Selector, buttonEvent: UIControl.Event) {
        self.toggle?.addTarget(buttonTarget, action: buttonAction, for: buttonEvent)
    }
}
