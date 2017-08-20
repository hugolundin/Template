//
//  MainViewController.swift
//  Template
//
//  Created by Hugo Lundin on 2017-08-10.
//  Copyright © 2017 Hugo Lundin. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITextViewDelegate, SettingsDelegate, TodoistDelegate {
    
    var settings: [Settings] = []
    var todoist: Todoist?
    var csv: CSV? 
    
    /**
     Text View Were Lists Are Written.
     */
    @IBOutlet weak var textView: UITextView! {
        didSet {            
            textView.delegate = self
            textView.becomeFirstResponder()
        }
    }
    
    @IBOutlet weak var shareButton: UIBarButtonItem!
    @IBOutlet weak var settingsButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print(settings[0].apiKey)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? SettingsViewController {
            controller.delegate = self
        }
    }
}
