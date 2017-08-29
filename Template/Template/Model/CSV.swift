//
//  CSV.swift
//  Template
//
//  Created by Hugo Lundin on 2017-08-20.
//  Copyright © 2017 Hugo Lundin. All rights reserved.
//

import Foundation

protocol CSVProvider {
    func file(from text: String) throws -> URL?
    func verify(text: String) -> Bool
}

protocol HasCSVProvider {
    var csv: CSVProvider? { get set }
}

extension CSV {
    struct Constants {
        static let filename = "template"
    }
}

struct CSV: CSVProvider {
    
    /**
     Generates CSV File for Given Text.
     
     - Parameters:
         - text: Text that should be included in generated file.
     
     - Returns: URL Representing Generated File.
     */
    public func file(from text: String) throws -> URL? {
        
        guard let file =
            NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("\(Constants.filename).csv") else {
            return nil
        }

        do {
            try generate(from: text).write(to: file, atomically: true, encoding: .utf8)
        }
        
        // Rethrow Error and Make Viewcontroller Responsible for Error Handling
        catch {
            throw error
        }
        
        return file
    }
    
    public func verify(text: String) -> Bool {
        return true
    }
    
    private func generate(from text: String) -> String {
        
        // Add Todoist Template Headers
        var output = "TYPE,CONTENT,PRIORITY,INDENT,AUTHOR,RESPONSIBLE,DATE,DATE_LANG\n"
        
        // Append Lines to Output with Correct Formatting
        text.lines.map { $0.trimmed } .forEach { output += "task,\($0),4,1,,,,en\n,,,,,,,\n" }
        
        return output
    }
}
