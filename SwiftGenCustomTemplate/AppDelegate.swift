//
//  AppDelegate.swift
//  SwiftGenCustomTemplate
//
//  Created by Serhan Khan on 27/09/2024.
//


import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        // Your custom code for app launch
        print("AppDelegate: didFinishLaunchingWithOptions")
        LocalizationManager.shared.loadEnglishLocalization()
        return true
    }

    // Add other AppDelegate methods as needed
}
