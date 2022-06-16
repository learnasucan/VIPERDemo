//
//  AppDelegate.swift
//  VIPERDemo
//
//  Created by Prachit on 2022-06-16.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let vc = ViewController(nibName: kIdentifier, bundle: nil)
        let nav = UINavigationController(rootViewController: vc)
        window?.makeKeyAndVisible()
        window?.rootViewController = nav
        
        return true
    }
    
}

