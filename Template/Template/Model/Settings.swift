//
//  Settings.swift
//  Template
//
//  Created by Hugo Lundin on 2017-08-11.
//  Copyright © 2017 Hugo Lundin. All rights reserved.
//

import Foundation

protocol Settings: class {
    var apiKey: String { get set }
}

protocol SettingsDelegate {
    var settings: Settings? { get set }
}

class Local: Settings {
    var apiKey = "123"
}
