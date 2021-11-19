//
//  UserDefault+Singleton.swift
//  Nano7App
//
//  Created by Luiz Araujo on 18/11/21.
//

import Foundation

class UserDefaultsManager: ConfigurationDelegate {
    //FIXME: Removed most of the implementation for clarity
    
    func toggleHapticsClicked() {
        var userDefaultValue: Bool = UserDefaults.standard.bool(forKey: "isHapticsEnabled")
        UserDefaults.standard.set(userDefaultValue.toggle(), forKey: "sound")

        print("Severino: Opa, patrão, já terminei!")
    }
}
