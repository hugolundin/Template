//
//  Settings.swift
//  Template
//
//  Created by Hugo Lundin on 2017-08-11.
//  Copyright © 2017 Hugo Lundin. All rights reserved.
//

import Foundation

protocol SettingsProvider: class {
    var apiKey: String { get set }
}

protocol HasSettingsProvider {
    var settings: SettingsProvider? { get set }
}

class Local: SettingsProvider {
    private let defaults = UserDefaults.standard
    
    var apiKey: String {
        get {
            return defaults.string(forKey: #function) ?? ""
        }
        
        set {
            defaults.set(newValue, forKey: #function)
        }
    }
}
