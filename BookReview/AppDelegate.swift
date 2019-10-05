//
//  AppDelegate.swift
//  BookReview
//
//  Copyright © 2019 <ASi. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        UINavigationBar.appearance().tintColor = #colorLiteral(red: 0.7139567137, green: 0.1102785543, blue: 0, alpha: 1)
        
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor :#colorLiteral(red: 0.7139567137, green: 0.1102785543, blue: 0, alpha: 1), NSAttributedString.Key.font: UIFont(name: "Arial Rounded MT Bold", size: 20)!]
        
        UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Arial Rounded MT Bold", size: 20)!], for: UIControl.State.normal)
        
//        UIBarButtonItem.appearance().
        return true
    }
}

