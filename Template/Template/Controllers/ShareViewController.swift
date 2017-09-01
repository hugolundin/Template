//
//  ShareViewController.swift
//  Template
//
//  Created by Hugo Lundin on 2017-08-27.
//  Copyright © 2017 Hugo Lundin. All rights reserved.
//

import UIKit

class ShareViewController: UIActivityViewController {

    typealias Dependencies = HasTodoistProvider & HasSettingsProvider
    var dependencies: Dependencies?
    
    init(with file: URL, dependencies: Dependencies? = nil) {
        self.dependencies = dependencies
        super.init(activityItems: [file], applicationActivities: [TodoistActivity(dependencies: dependencies)])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        excludedActivityTypes?.append(contentsOf: [.assignToContact, .saveToCameraRoll, .postToFlickr, .postToVimeo, .postToTencentWeibo, .postToTwitter, .postToFacebook, .openInIBooks])
    }
}
