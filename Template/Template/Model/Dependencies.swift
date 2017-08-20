//
//  Clients.swift
//  Template
//
//  Created by Hugo Lundin on 2017-08-12.
//  Copyright © 2017 Hugo Lundin. All rights reserved.
//

import Foundation
import UIKit

protocol SettingsDelegate {
    var settings: [Settings] { get set }
}

protocol SettingsClient {
    var delegate: SettingsDelegate? { get set }
}

protocol TodoistDelegate {
    var todoist: Todoist? { get set }
}

protocol TodoistClient {
    var delegate: TodoistDelegate? { get set }
}
