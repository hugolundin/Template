//
//  String+trimmed.swift
//  Template
//
//  Created by Hugo Lundin on 2017-08-10.
//  Copyright © 2017 Hugo Lundin. All rights reserved.
//

import Foundation

extension String {
    
    /**
     Return `self` Without Trailing Whitespace.
     */
    var trimmed: String {
        return self.trimmingCharacters(in: NSCharacterSet.whitespaces)
    }
}
