//
//  AppDelegate.swift
//  Renetik Layout Demo
//
//  Created by Renetik on 06/06/22.
//

import UIKit
import Renetik

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    public var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        Renetik.initialize()
        window = UIWindow.construct(ViewController())
        return true
    }
}

