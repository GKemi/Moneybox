//
//  AppDelegate.swift
//  MoneyboxTest
//
//  Created by Gil Hakemi on 11/08/2020.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = LoginViewController(nibName: "LoginViewController", bundle: nil)
        window?.makeKeyAndVisible()
        
        
        return true
    }

}

