//
//  AppDelegate.swift
//  Template
//
//  Created by Hugo Lundin on 2017-08-10.
//  Copyright © 2017 Hugo Lundin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // Instantiate Dependencies
        let settings: Settings = Local()
        let todoist: Todoist = DefaultTodoist()
        let csv: CSV = DefaultCSV()
        
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
        
        // Perform Dependency Injection.
        // Since they are wrapped in `UINavigationController`,
        // we need to iterate and look for the correct delegates.
        typealias dependencies = TodoistDelegate & SettingsDelegate & CSVDelegate
        for child in controller?.childViewControllers ?? [] {
            if var destination = child as? dependencies {
                destination.todoist = todoist
                destination.settings = settings
                destination.csv = csv
            }
        }
        
        // UIViewController & Delegate, with Delegate, return destination that is UIViewController and Delegate
        /*
        inject(to: controller, with: TodoistDelegate) { destination in
            destination.todoist = todoist
        }
         */
        
        show(controller)
        
        return true
    }
    
    private func show(_ controller: UIViewController?) {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = controller
    }
    
    /*
    private func inject<P, T: UIViewController & P>(to controller: T?, with: P.Type, completion: (UIViewController & P) -> ()) {
        for child in controller?.childViewControllers ?? [] {
            if let destination = child as? P {
                completion(destination as! UIViewController)
            }
        }
    }
     */
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
}
