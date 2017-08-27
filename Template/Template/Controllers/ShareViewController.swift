//
//  ShareViewController.swift
//  Template
//
//  Created by Hugo Lundin on 2017-08-27.
//  Copyright © 2017 Hugo Lundin. All rights reserved.
//

import UIKit

class ShareViewController: UIActivityViewController {
    
    init(with file: URL) {
        super.init(activityItems: [file], applicationActivities: [])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        excludedActivityTypes?.append(contentsOf: [.assignToContact, .saveToCameraRoll, .postToFlickr, .postToVimeo, .postToTencentWeibo, .postToTwitter, .postToFacebook, .openInIBooks])
    }
}
