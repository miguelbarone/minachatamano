//
//  AppDelegate.swift
//  Exemplo1
//
//  Created by Miguel Barone - MBA on 29/01/20.
//  Copyright © 2020 Miguel Barone - MBA. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var appCoordinator: AppCoordinator!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow()
        appCoordinator = AppCoordinator(window: window!)
        appCoordinator.start()
        
        
        
        return true
    }

    // MARK: UISceneSession Lifecycle


}

