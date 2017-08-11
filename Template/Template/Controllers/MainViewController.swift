//
//  MainViewController.swift
//  Template
//
//  Created by Hugo Lundin on 2017-08-10.
//  Copyright © 2017 Hugo Lundin. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var textView: UITextView! {
        didSet {            
            textView.delegate = self
            textView.becomeFirstResponder()
        }
    }
    
    @IBOutlet weak var settings: UIBarButtonItem!
    @IBOutlet weak var action: UIBarButtonItem!
    
    var allowed: Bool {
        return textView.text.numberOfLines < 5
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        if !allowed {
            // let controller = UIAlertController(title: "Error", message: "Blablabla", preferredStyle: .alert)
            // let action = UIAlertAction(title: "OK", style: .destructive)
            // controller.addAction(action)
            
            // self.present(controller, animated: true) {
            //   textView.resignFirstResponder()
            //   action.isEnabled = false
            // }
        }
        
        // action.isEnabled = true
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
