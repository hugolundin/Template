//
//  Todoist.swift
//  Template
//
//  Created by Hugo Lundin on 2017-08-20.
//  Copyright © 2017 Hugo Lundin. All rights reserved.
//

import Foundation

protocol TodoistProvider {
    func projects(for apiToken: String, completion: @escaping (([String]) -> ()))
    func verify(apiToken: String, completion: @escaping (Bool, Error?) -> ())
    func upload(_ file: URL, completion: @escaping (Error?) -> ())
}

protocol HasTodoistProvider {
    var todoist: TodoistProvider? { get set }
}

/**
 Struct for Communicating with the Todoist API.
 */
public struct Todoist: TodoistProvider {
    internal struct URLs {
        static let base = "https://beta.todoist.com/API/v8"
    }
    
    private let limit: Int = 100
    
    /**
     Return projects coupled with current `apiKey`. If the key isn't valid, function will return `nil` and `completionHandler` will return an `error`.
     */
    func projects(for apiToken: String, completion: @escaping (([String]) -> ())) {
        completion(["Personal", "School", "Lists", "Developer"])
    }
    
    public func verify(apiToken: String, completion: @escaping (Bool, Error?) -> ()) {
        
        let session = URLSession(configuration: .ephemeral, delegate: nil, delegateQueue: OperationQueue.main)
        print("\(URLs.base)/projects?token=\(apiToken)")
        let url = URL(string: "\(URLs.base)/projects?token=\(apiToken)")!
        let task = session.dataTask(with: url) { (data, response, error) -> Void in
            guard error == nil else {
                completion(false, error)
                return
            }
            
            guard let data = data else {
                completion(false, error)
                return
            }
            
            guard let _ = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) else {
                completion(false, error)
                return
            }
            
            completion(true, nil)
        }
        
        task.resume()
    }
    
    public func upload(_ file: URL, completion: @escaping (Error?) -> ()) {
        completion(nil)
    }
}
