//
//  AppDelegate.swift
//  ContentDetail
//
//  Created by 宗丽娜 on 2021/7/10.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
     var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let vc = DetailViewController()
        let navi = UINavigationController(rootViewController: vc)
        window?.rootViewController = navi
        window?.makeKeyAndVisible()
        return true
    }

    


}

