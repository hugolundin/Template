//
//  SettingsViewController.swift
//  Template
//
//  Created by Hugo Lundin on 2017-08-20.
//  Copyright © 2017 Hugo Lundin. All rights reserved.
//

import UIKit

class SettingsViewController: UITableViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var apiKeyTextField: UITextField! {
        didSet {
            apiKeyTextField?.text = settingsDelegate?.settings?.apiKey ?? String.empty
        }
    }
    
    // MARK: - Delegates
    var todoistDelegate: TodoistDelegate?
    var settingsDelegate: SettingsDelegate?
    
    // MARK: - Row Identifiers
    private struct Rows {
        static let apiKey: Int = 0
        static let verify: Int = 1
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == Rows.apiKey {
            apiKeyTextField.becomeFirstResponder()
        }
        
        guard let todoist = todoistDelegate?.todoist else {
            return
        }
        
        guard let settings = settingsDelegate?.settings else {
            return
        }
        
        if indexPath.row == Rows.verify {
            let apiKey = apiKeyTextField.text ?? ""
            if todoist.verify(apiKey: apiKey, completion: nil) {
                settings.apiKey = apiKey
                self.apiKeyTextField.textColor = UIColor.black
                self.apiKeyTextField.resignFirstResponder()
            } else {
                self.apiKeyTextField.textColor = UIColor.red
            }
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
