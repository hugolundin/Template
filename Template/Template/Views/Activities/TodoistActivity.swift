//
//  TodoistActivity.swift
//  Template
//
//  Created by Hugo Lundin on 2017-09-01.
//  Copyright © 2017 Hugo Lundin. All rights reserved.
//

import Foundation
import UIKit

class TodoistActivity: UIActivity {
    
    typealias Dependencies = HasTodoistProvider & HasSettingsProvider
    var dependencies: Dependencies?
    
    init(dependencies: Dependencies? = nil) {
        super.init()
        self.dependencies = dependencies
    }
    
    override var activityTitle: String? {
        return "Add Into Todoist Project"
    }
    
    override var activityType: UIActivityType? {
        return UIActivityType.init("AddIntoTodoistProject")
    }
    
    override var activityImage: UIImage? {
        return UIImage(named: "up-arrow") ?? nil
    }
    
    override func canPerform(withActivityItems activityItems: [Any]) -> Bool {
        // TODO: - Handle Verification
        return true
    }
    
    override func prepare(withActivityItems activityItems: [Any]) {
        // TODO: - Handle Preparation
    }
    
    override var activityViewController: UIViewController? {
        guard let controller = UIStoryboard(name: "Todoist", bundle: nil)
            .instantiateInitialViewController() as? UINavigationController else {
                return nil
        }
        
        for child in controller.childViewControllers {
            if let destination = child as? TodoistViewController {
                destination.dependencies = self.dependencies
            }
        }
        
        controller.modalPresentationStyle = .formSheet
        
        return controller
    }
    
    override func perform() {
        // TODO: - Handle Action
        
        self.activityDidFinish(true)
    }
}
