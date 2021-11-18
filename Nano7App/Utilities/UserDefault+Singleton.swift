//
//  UserDefault+Singleton.swift
//  Nano7App
//
//  Created by Luiz Araujo on 18/11/21.
//

import Foundation


class UserDefaultSingleton: ToggleHapticsDelegate {
    
    //TODO: Implement UseDefault sigleton
//    static let shared = UserDefaultSingleton()
    static var hapticsIsOn = true
    private let configurationVC = ConfiguracaoViewController()
    
    func toggleHapticsClicked() {
        
        print("func toggleHapticsClicked() {")
        configurationVC.delegate = self
        UserDefaultSingleton.hapticsIsOn.toggle()
        if UserDefaultSingleton.hapticsIsOn {
            print("Haptics is ON")
        } else {
            print("Haptics is OFF")
        }
        configurationVC.tableConfiguracao.reloadData()
    }
}
