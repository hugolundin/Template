//
//  UIViewController+Alertable.swift
//  Template
//
//  Created by Hugo Lundin on 2017-08-24.
//  Copyright © 2017 Hugo Lundin. All rights reserved.
//

import Foundation
import UIKit

protocol Alertable {
    func alert(title: String, message: String)
}

extension Alertable where Self: UIViewController {
    func alert(title: String, message: String = "") {
        let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OK = UIAlertAction(title: "OK", style: .default)
        controller.addAction(OK)
        self.present(controller, animated: true, completion: nil)
    }
}
