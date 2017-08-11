//
//  ProblemViewController.swift
//  Template
//
//  Created by Hugo Lundin on 2017-08-11.
//  Copyright © 2017 Hugo Lundin. All rights reserved.
//

import UIKit

class ProblemViewController: UIViewController {
    
    var problem: String?
    
    @IBOutlet weak var problemLabel: UILabel! {
        didSet {
            problemLabel.text = problem ?? ""
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
