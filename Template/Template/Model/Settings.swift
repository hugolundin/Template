//
//  Settings.swift
//  Template
//
//  Created by Hugo Lundin on 2017-08-11.
//  Copyright © 2017 Hugo Lundin. All rights reserved.
//

import Foundation

protocol SettingsProvider: class {
    var apiToken: String { get set }
}

protocol HasSettingsProvider {
    var settings: SettingsProvider? { get set }
}

final class Local: SettingsProvider {
    private let defaults: UserDefaults
    
    init(defaults: UserDefaults = UserDefaults.standard) {
        self.defaults = defaults
    }
    
    var apiToken: String {
        get {
            return defaults.string(forKey: #function) ?? ""
        }
        
        set {
            if newValue == "" {
                defaults.removeObject(forKey: #function)
            } else {
                defaults.set(newValue, forKey: #function)
            }
        }
    }
}
