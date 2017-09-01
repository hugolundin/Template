//
//  ShareViewController.swift
//  Template
//
//  Created by Hugo Lundin on 2017-08-27.
//  Copyright © 2017 Hugo Lundin. All rights reserved.
//

import UIKit

class ShareViewController: UIActivityViewController {
    
    let favorite = FavoriteActivity()
    
    init(with file: URL) {
        super.init(activityItems: [file], applicationActivities: [favorite])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        excludedActivityTypes?.append(contentsOf: [.assignToContact, .saveToCameraRoll, .postToFlickr, .postToVimeo, .postToTencentWeibo, .postToTwitter, .postToFacebook, .openInIBooks])
    }
}

class FavoriteActivity: UIActivity {
    
    override var activityTitle: String? {
        return "Favorite"
    }
    
    override var activityType: UIActivityType? {
        return UIActivityType.init("123")
    }
    
    
    
    func canPerformWithActivityItems(activityItems: [AnyObject]) -> Bool {
        NSLog("%@", #function)
        return true
    }
    
    func prepareWithActivityItems(activityItems: [AnyObject]) {
        NSLog("%@", #function)
    }
    
    func activityViewController() -> UIViewController? {
        NSLog("%@", #function)
        return nil
    }
    
    override func perform() {
        // Todo: handle action:
        NSLog("%@", #function)
        
        self.activityDidFinish(true)
    }
    
    func activityImage() -> UIImage? {
        return UIImage(named: "favorites_action")
    }
}
