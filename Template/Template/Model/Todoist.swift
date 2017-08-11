//
//  Todoist.swift
//  Template
//
//  Created by Hugo Lundin on 2017-08-11.
//  Copyright © 2017 Hugo Lundin. All rights reserved.
//

import Foundation

/**
 Struct for Communicating with the Todoist API.
 */
public struct Todoist {
    internal struct URLs {
        static let sync: URL = URL(string: "https://todoist.com/API/v7/sync")!
        static let `import`: URL = URL(string: "https://todoist.com/API/v7/templates/import_into_project")!
    }
    
    /**
     Represents the Todoist API Command Limit per Request.
     */
    public let limit: Int = 100
    
    /**
     API Key Required to Communicate with Todoist.
     */
    public let apiKey: String
    
    /**
     Optional Initalizer That Returns `nil` If  `apikey` Is Invalid.

     - Parameters:
         - apiKey: API Key retrieved from Todoist.com.
     
     - Returns:
         Either an authenticated `Todoist` struct or `nil`.
     */
    public init?(apiKey: String) {
        self.apiKey = apiKey
        
        guard Todoist.validate(self.apiKey) else {
            return nil
        }
    }
    
    public func sync() {
        
    }
    
    public func add(to template: String) {
        
    }
    
    private static func validate(_ apiKey: String) -> Bool {
        return true
    }
}
