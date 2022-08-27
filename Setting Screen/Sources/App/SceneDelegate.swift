//
//  SceneDelegate.swift
//  Setting Screen
//
//  Created by Serhii  on 28/08/2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowsScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowsScene)
        window?.rootViewController = ViewController()
        window?.makeKeyAndVisible()
    }
}

