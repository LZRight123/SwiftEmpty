//
//  AppDelegate.swift
//  TuiMo
//
//  Created by 梁泽 on 2019/1/14.
//  Copyright © 2019 梁泽. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window?.rootViewController = LZTabBarController()
        window?.makeKeyAndVisible()
        
        return true
    }

}

