//
//  MainViewController.swift
//  Template
//
//  Created by Hugo Lundin on 2017-08-10.
//  Copyright © 2017 Hugo Lundin. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITextViewDelegate {
    
    let settings = [Settings]()
    var todoist: Todoist?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    /**
     Main Text View Were Lists Are Supposed to Be Written.
     */
    @IBOutlet weak var textView: UITextView! {
        didSet {            
            textView.delegate = self
            textView.becomeFirstResponder()
        }
    }
    
    @IBOutlet weak var shareButton: UIBarButtonItem!
    @IBOutlet weak var settingsButton: UIBarButtonItem!
    
    
    /**
     Boolean Representing Whether Text View Editing Is Allowed or Not.
     */
    var allowed: Bool {
        return textView.text.numberOfLines < 5
    }
    
    /**
     ´shouldChangeTextIn´ React on Changes in the Main `UITextView`, and Uses `allowed` to Decide
     Whether Editing Is Allowed or Not.
     
     If editing is not allowed, present a warning and allow the user to fix the problems. The action
     button also is disabled while editing is not allowed.
     */
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if !allowed {
          
        }
        
        return true
    }
}
