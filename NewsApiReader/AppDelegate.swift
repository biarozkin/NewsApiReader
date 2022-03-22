//
//  AppDelegate.swift
//  NewsApiReader
//
//  Created by Igor Biarozkin on 3/20/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        ServiceLocatorBuilder.build()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        ApplicationCoordinator(window: window!).start()
    
        return true
    }
}

