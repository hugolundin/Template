//
//  MainViewController.swift
//  Template
//
//  Created by Hugo Lundin on 2017-08-10.
//  Copyright © 2017 Hugo Lundin. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITextViewDelegate {
    
    typealias Dependencies = HasSettingsProvider & HasTodoistProvider & HasCSVProvider
    var dependencies: Dependencies?
    
    // MARK: - Outlets
    @IBOutlet weak var shareButton: UIBarButtonItem!
    @IBOutlet weak var settingsButton: UIBarButtonItem!
    @IBOutlet weak var textView: UITextView! {
        didSet {
            textView.delegate = self
            textView.becomeFirstResponder()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print(dependencies?.settings?.apiKey ?? "No apiKey")
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? SettingsViewController {
            controller.dependencies = dependencies
        }
    }
}
