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
    
    @IBAction func share(_ sender: UIBarButtonItem) {
        
        guard let text = textView?.text else {
            return
        }
        
        guard let file = try? dependencies?.csv?.file(from: text) else {
            return
        }
        
        guard let fileURL = file else {
            return
        }
        
        let controller = ShareViewController(with: fileURL)
        present(controller, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? SettingsViewController {
            controller.dependencies = dependencies
        }
    }
}
