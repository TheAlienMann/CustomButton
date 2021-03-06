//
//  AppDelegate.swift
//  Example
//
//  Created by Mohamad Rahmani on 16.06.22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  lazy var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.

    window?.rootViewController = ViewController()
    guard let vc = window?.rootViewController as? ViewController else {
      return true
    }
    window?.rootViewController = UINavigationController(rootViewController: vc)
    window?.makeKeyAndVisible()
    return true
  }
}
