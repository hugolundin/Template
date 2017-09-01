//
//  TodoistProjectViewController.swift
//  Template
//
//  Created by Hugo Lundin on 2017-09-01.
//  Copyright © 2017 Hugo Lundin. All rights reserved.
//

import UIKit

class TodoistViewController: UIViewController {
    
    typealias Dependencies = HasTodoistProvider & HasSettingsProvider
    var dependencies: Dependencies?
    
    private var projects = [String]()

    @IBOutlet weak var projectPicker: UIPickerView! {
        didSet {
            projectPicker.dataSource = self
            projectPicker.delegate = self
        }
    }
    
    @IBOutlet weak var sendButton: UIBarButtonItem!
    
    @IBAction func send(_ sender: UIBarButtonItem) {
        // Replace share button with activity indicator
        let loading = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        loading.hidesWhenStopped = true
        loading.startAnimating()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: loading)
        
        dependencies?.todoist?.upload(URL(string: "https://www.google.se")!) { error in
            guard error == nil else {
                return
            }
            
            loading.stopAnimating()
            self.navigationItem.rightBarButtonItem = self.sendButton
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        print("cancel")
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let apiKey = dependencies?.settings?.apiToken else {
            return
        }
        
        dependencies?.todoist?.projects(for: apiKey) { projects in
            self.projects.append(contentsOf: projects)
            self.projectPicker.reloadAllComponents()
        }
    }
}

extension TodoistViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return projects.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return projects[row]
    }
}
