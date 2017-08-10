//
//  Todoist.swift
//  Template
//
//  Created by Hugo Lundin on 2017-08-11.
//  Copyright © 2017 Hugo Lundin. All rights reserved.
//

import Foundation

public class Todoist {
    internal struct URLs {
        static let sync: URL = URL(string: "https://todoist.com/API/v7/sync")!
        static let `import`: URL = URL(string: "https://todoist.com/API/v7/templates/import_into_project")!
    }
    
    public let limit: Int
    public let apiKey: String
    
    public init?(apiKey: String) {
        self.limit = 100
        self.apiKey = apiKey
        
        guard Todoist.validate(self.apiKey) else {
            return nil
        }
    }
    
    private static func validate(_ apiKey: String) -> Bool {
        return true
    }
}
