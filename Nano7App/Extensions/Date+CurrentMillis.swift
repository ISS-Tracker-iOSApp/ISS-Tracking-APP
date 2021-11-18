//
//  Date+CurrentMillis.swift
//  Nano7App
//
//  Created by Igor Samoel da Silva on 18/11/21.
//

import Foundation

extension Date {
    func currentTimeMillis() -> Int64 {
           return Int64(self.timeIntervalSince1970)
       }
}
