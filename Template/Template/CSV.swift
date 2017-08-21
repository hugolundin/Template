//
//  CSV.swift
//  Template
//
//  Created by Hugo Lundin on 2017-08-20.
//  Copyright © 2017 Hugo Lundin. All rights reserved.
//

import Foundation

protocol CSV {
    
}

protocol CSVDelegate {
    var csv: CSV? { get set }
}

struct DefaultCSV: CSV {
    
}
