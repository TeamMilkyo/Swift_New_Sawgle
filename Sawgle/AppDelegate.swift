//
//  AppDelegate.swift
//  Sawgle
//
//  Created by Meo MacBook Pro on 02/05/2019.
//  Copyright © 2019 Meo MacBook Pro. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
//        let startViewController = StartViewController()
//        window?.rootViewController = startViewController
        let customTabBarController = CustomTabBarController()
        window?.rootViewController = customTabBarController
        self.window?.makeKeyAndVisible()
        return true
    }
}
