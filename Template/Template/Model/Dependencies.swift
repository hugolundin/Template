//
//  Dependencies.swift
//  Template
//
//  Created by Hugo Lundin on 2017-08-24.
//  Copyright © 2017 Hugo Lundin. All rights reserved.
//

import Foundation

class AppDependencies: HasSettingsProvider, HasTodoistProvider, HasCSVProvider {
    var settings: SettingsProvider?
    var todoist: TodoistProvider?
    var csv: CSVProvider?
}
