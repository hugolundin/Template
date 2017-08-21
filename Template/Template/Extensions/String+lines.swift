//
//  String+lines.swift
//  Template
//
//  Created by Hugo Lundin on 2017-08-10.
//  Copyright © 2017 Hugo Lundin. All rights reserved.
//

import Foundation

extension String {
    
    /**
     Return an Array Containing the Elements of the Input String Split by Newlines.
     */
    var lines: [String] {
        var result = [String]()
        enumerateLines { line, _ in result.append(line) }
        return result
    }
    
    /**
     Return an Integer Representing Number of Lines in a String.
     */
    var numberOfLines: Int {
        return lines.count
    }
}
