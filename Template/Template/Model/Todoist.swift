//
//  Todoist.swift
//  Template
//
//  Created by Hugo Lundin on 2017-08-20.
//  Copyright © 2017 Hugo Lundin. All rights reserved.
//

import Foundation

protocol TodoistProvider {
    func projects(for apiToken: String) throws -> [String]
    func verify(apiToken: String) throws -> Bool
    func upload(_ file: URL) throws
}

protocol HasTodoistProvider {
    var todoist: TodoistProvider? { get set }
}

/**
 Struct for Communicating with the Todoist API.
 */
public struct Todoist: TodoistProvider {
    internal struct URLs {
        static let sync: URL = URL(string: "https://todoist.com/API/v7/sync")!
        static let `import`: URL = URL(string: "https://todoist.com/API/v7/templates/import_into_project")!
    }
    
    private let limit: Int = 100
    
    /**
     Return projects coupled with current `apiKey`. If the key isn't valid, function will return `nil` and `completionHandler` will return an `error`.
     */
    public func projects(for apiToken: String) throws -> [String] {
        return ["Personal", "School", "Lists", "Developer"]
    }
    
    public func verify(apiToken: String) throws -> Bool {
        return ["123", "456", "789", "1337", "47641cbcb5807c3aa1759c350464f5c3a7afb49f"].contains(apiToken)
    }
    
    public func upload(_ file: URL) throws {
        
    }
}
