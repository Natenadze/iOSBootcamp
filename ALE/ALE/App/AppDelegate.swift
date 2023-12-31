//
//  AppDelegate.swift
//  ALE
//
//  Created by Davit Natenadze on 25.10.23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        
        let product = Coffee.initial
        window?.rootViewController = ViewController(product: product)
        
        return true
    }
    
}

