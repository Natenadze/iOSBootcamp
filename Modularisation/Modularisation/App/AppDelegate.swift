//
//  AppDelegate.swift
//  Modularisation
//
//  Created by Davit Natenadze on 19.11.23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        
        let viewModel = FactListControllerViewModel()
        let controller = FactListController(viewModel: viewModel)
        let navController = UINavigationController(rootViewController: controller)
        window?.rootViewController = navController
        
        return true
    }
    
}
