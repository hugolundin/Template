//
//  Settings.swift
//  Template
//
//  Created by Hugo Lundin on 2017-08-11.
//  Copyright © 2017 Hugo Lundin. All rights reserved.
//

import Foundation

protocol Settings {
    var apiKey: String { get set }
}

struct Local: Settings {
    var apiKey = "123"
}

struct Cloud: Settings {
    var apiKey = "123"
}
