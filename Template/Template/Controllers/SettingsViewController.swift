//
//  SettingsViewController.swift
//  Template
//
//  Created by Hugo Lundin on 2017-08-20.
//  Copyright © 2017 Hugo Lundin. All rights reserved.
//

import UIKit

class SettingsViewController: UITableViewController, SettingsClient {
    
    private struct Rows {
        static let apiKey: Int = 0
        static let verify: Int = 1
    }
    
    @IBOutlet weak var apiKeyTextField: UITextField!
    
    var delegate: SettingsDelegate?
    private var todoist = Todoist()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == Rows.apiKey {
            apiKeyTextField.becomeFirstResponder()
        }
        
        if indexPath.row == Rows.verify {
            let apiKey = apiKeyTextField.text ?? ""
            
            if todoist.verify(apiKey: apiKey, completion: nil) {
                delegate?.settings[0].apiKey = apiKey
                
                self.apiKeyTextField.textColor = UIColor.black
                apiKeyTextField.resignFirstResponder()
            } else {
                self.apiKeyTextField.textColor = UIColor.red
            }
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
