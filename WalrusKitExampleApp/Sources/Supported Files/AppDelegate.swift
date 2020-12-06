//
//  AppDelegate.swift
//  WalrusKitExampleApp
//
//  Created by Aleksei Smirnov on 29.10.2020.
//

import UIKit
import WalrusKit

@main
final class AppDelegate: UIResponder {

}

extension AppDelegate: UIApplicationDelegate {

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        Fonts.registerCustomFonts()
        return true
    }

    func application(
        _ application: UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
        options: UIScene.ConnectionOptions) -> UISceneConfiguration {

        UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
}
