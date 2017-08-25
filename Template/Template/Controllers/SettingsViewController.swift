//
//  SettingsViewController.swift
//  Template
//
//  Created by Hugo Lundin on 2017-08-20.
//  Copyright © 2017 Hugo Lundin. All rights reserved.
//

import UIKit

class SettingsViewController: UITableViewController, Alertable {
    
    typealias Dependencies = HasSettingsProvider & HasTodoistProvider
    var dependencies: Dependencies?
    
    // MARK: - Constants
    private struct Constants {
        struct Rows {
            static let add: Int = 0
        }
        
        struct Sections {
            static let apiKey: Int = 0
        }
        
        struct Colors {
            static let regular = UIColor.black
            static let warning = UIColor.red
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let todoist = dependencies?.todoist else {
            return
        }
        
        guard let _ = dependencies?.settings else {
            return
        }
        
        if indexPath.row == Constants.Rows.add {
            
            let alert = UIAlertController(title: "Add API Key", message: "Enter your API key in the text field below", preferredStyle: .alert)
            
            alert.addTextField(configurationHandler: { (_ textField: UITextField) -> Void in
                textField.placeholder = "API Key"
            })
            
            let confirm = UIAlertAction(title: "OK", style: .default, handler: {(_ action: UIAlertAction) -> Void in
                if let apiKey = alert.textFields?[0].text {
                    if let verify = try? todoist.verify(apiKey: apiKey), verify {
                        tableView.cellForRow(at: IndexPath(row: Constants.Rows.add, section: 0))?.textLabel?.text = "Change"
                        self.alert(title: "Success", message: "Your API key is valid.")
                    } else {
                        self.alert(title: "Failure", message: "Your API key was invalid. Please try again.")
                    }
                } else {
                    self.alert(title: "Invalid API Key")
                }
            })
            
            let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: {(_ action: UIAlertAction) -> Void in
                print("Canelled")
            })
            
            alert.addAction(confirm)
            alert.addAction(cancel)
            
            present(alert, animated: true, completion: nil)
            
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
}
