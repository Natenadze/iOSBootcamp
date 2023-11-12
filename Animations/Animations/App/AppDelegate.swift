//
//  AppDelegate.swift
//  Animations
//
//  Created by Davit Natenadze on 12.11.23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        let vc = ViewController()
        let navController = UINavigationController(rootViewController: vc)
        window?.rootViewController = navController
        
        return true
    }
    
}
