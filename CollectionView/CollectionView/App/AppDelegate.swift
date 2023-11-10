//
//  AppDelegate.swift
//  CollectionView
//
//  Created by Davit Natenadze on 03.11.23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        
        let vc = MovieController()
        let navVC = UINavigationController(rootViewController: vc)
        window?.rootViewController = navVC
        
        return true
    }
    
}
