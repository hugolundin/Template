//
//  Todoist.swift
//  Template
//
//  Created by Hugo Lundin on 2017-08-20.
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
    
    private let limit: Int = 100
    
    /**
     Return projects coupled with current `apiKey`. If the key isn't valid, function will return `nil` and `completionHandler` will return an `error`.
     */
    public func projects(for apiKey: String, completion: ((Error?) -> ())?) -> [String]? {
        if let completion = completion {
            completion(nil)
        }
        
        return ["Personal", "School", "Lists", "Developer"]
    }
    
    public func verify(apiKey: String, completion: ((Error?) -> ())?) -> Bool {
        if let completion = completion {
            completion(nil)
        }
        
        return apiKey == "123" || apiKey == "456"
    }
    
    public func post(csv: String) {
        
    }
}
