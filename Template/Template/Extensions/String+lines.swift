//
//  String+lines.swift
//  Template
//
//  Created by Hugo Lundin on 2017-08-26.
//  Copyright © 2017 Hugo Lundin. All rights reserved.
//

import Foundation

extension String {
    var lines: [String] {
        var result = [String]()
        enumerateLines { line, _ in result.append(line) }
        return result
    }
}
