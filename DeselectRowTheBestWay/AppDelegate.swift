//
//  AppDelegate.swift
//  DeselectRowTheBestWay
//
//  Created by kemchenj on 2018/12/24.
//  Copyright © 2018 kemchenj. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow()
        defer { window?.makeKeyAndVisible() }

        let vc = ViewController()
        let navigationController = UINavigationController(rootViewController: vc)
        navigationController.navigationBar.isTranslucent = false

        window?.rootViewController = navigationController

        return true
    }
}
