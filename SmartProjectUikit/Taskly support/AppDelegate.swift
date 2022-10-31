//
//  AppDelegate.swift
//  SmartProjectUikit
//
//  Created by Poonam Pandey on 30/10/22.
//

import UIKit

// Entry Point of Project
// Important Files

extension UINavigationController {
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        
        return.lightContent
    }
}

class AppDelegate: UIResponder, UIApplicationDelegate {
    var window : UIWindow?
    
    let taskStore = TaskStore()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
       // let tasksController = window?.rootviewController?.childViewControllers.first as? TasksController
        
       // tasksController?.taskStore = taskStore
        
        return true
        
    func applicationWillResignedActive( application: UIApplication){
    }
        
        func applicationDidEnterBackground( application: UIApplication){
}
        // Override point for customization after application launch.
        
        // MARK: UISceneSession Lifecycle
        
        func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
            // Called when a new scene session is being created.
            // Use this method to select a configuration to create the new scene with.
            return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
        }
        
        func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
            // Called when the user discards a scene session.
            // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
            // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
        }
        
        
    }
    
}
