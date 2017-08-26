//
//  SettingsViewController.swift
//  Template
//
//  Created by Hugo Lundin on 2017-08-20.
//  Copyright © 2017 Hugo Lundin. All rights reserved.
//

import UIKit

extension SettingsViewController {
    
    // MARK: - Constants
    private struct Constants {
        struct Rows {
            static let add: Int = 0
            static let token: Int = 1
        }
        
        struct Sections {
            static let apiToken: Int = 0
        }
        
        struct Colors {
            static let regular = UIColor.black
            static let button  = UIColor(red: 0.21, green: 0.58, blue: 0.98, alpha: 1.00)
            static let warning = UIColor.red
        }
    }
}

class SettingsViewController: UITableViewController, Alertable {
    
    // MARK: - Dependencies
    typealias Dependencies = HasSettingsProvider & HasTodoistProvider
    var dependencies: Dependencies?
    
    override func viewDidAppear(_ animated: Bool) {
        configureAPICell()
    }
    
    
    // TODO: Refactor Table View Configuration In Order to Avoid Lag
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let todoist = dependencies?.todoist else {
            return
        }
        
        guard let settings = dependencies?.settings else {
            return
        }
        
        if indexPath.row == Constants.Rows.add {
            
            guard settings.apiToken == "" else {
                settings.apiToken = ""
                configureAPICell()
                tableView.deselectRow(at: indexPath, animated: true)
                return
            }
                        
            let alert = UIAlertController(title: "Add API Key", message: "Enter your API key in the text field below", preferredStyle: .alert)
            
            alert.addTextField(configurationHandler: { (_ textField: UITextField) -> Void in
                textField.placeholder = "API Key"
            })
            
            let confirm = UIAlertAction(title: "OK", style: .default, handler: {(_ action: UIAlertAction) -> Void in
                guard let apiKey = alert.textFields?[0].text else {
                    self.alert(title: "Invalid API Key")
                    return
                }
                
                if let verify = try? todoist.verify(apiKey: apiKey), verify {
                    settings.apiToken = apiKey
                    self.configureAPICell()
                } else {
                    self.alert(title: "Error", message: "Your API Key was invalid. Please try again.")
                }
            })
            
            let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: {(_ action: UIAlertAction) -> Void in
                print("Cancelled")
            })
            
            alert.addAction(confirm)
            alert.addAction(cancel)
            
            present(alert, animated: true, completion: nil)
            
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    /**
     Configure API Cell in Settings Screen.
     */
    private func configureAPICell() {
        guard let settings = dependencies?.settings else {
            return
        }
        
        guard let field = tableView.cellForRow(at: IndexPath(row: Constants.Rows.add, section: 0)) else {
            return
        }
        
        // If API Token already has been set, show a remove button
        guard settings.apiToken == "" else {
            field.textLabel?.text = "Remove"
            field.textLabel?.textColor = Constants.Colors.warning
            field.detailTextLabel?.text = settings.apiToken
            return
        }
        
        // If API Token has not been set, show an add button
        field.textLabel?.text = "Add"
        field.textLabel?.textColor = Constants.Colors.button
        field.detailTextLabel?.text = ""
    }
}
