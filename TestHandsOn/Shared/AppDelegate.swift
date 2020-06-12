//
//  AppDelegate.swift
//  TestHandsOn
//
//  Created by Yuri on 11/06/20.
//  Copyright © 2020 academy.ifce. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        configureForTests()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    private func configureForTests() {
        if CommandLine.arguments.contains("-reset") {
            let defaultsName = Bundle.main.bundleIdentifier!
            UserDefaults.standard.removePersistentDomain(forName: defaultsName)
        }
        if CommandLine.arguments.contains("-noAnimations") {
            UIView.setAnimationsEnabled(false)
        }
        if CommandLine.arguments.contains("-skipOnboarding") {
            UserDefaults.standard.set(1, forKey: "hasSeenOnboard")
        }
    }
}

