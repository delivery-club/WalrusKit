//
//  SceneDelegate.swift
//  DeliveryClubUIApp
//
//  Created by Aleksei Smirnov on 29.10.2020.
//

import SwiftUI

final class SceneDelegate: UIResponder {

    var window: UIWindow?
}

extension SceneDelegate: UIWindowSceneDelegate {

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScence = scene as? UIWindowScene else { return }
        window = UIWindow(frame: windowScence.coordinateSpace.bounds)
        window?.windowScene = windowScence
        let navController = UINavigationController(rootViewController: MenuViewController())
        navController.navigationBar.prefersLargeTitles = true
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
    }
}
