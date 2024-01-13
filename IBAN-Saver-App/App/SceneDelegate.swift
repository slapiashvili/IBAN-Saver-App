//
//  SceneDelegate.swift
//  IBAN-Saver-App
//
//  Created by Salome Lapiashvili on 10.01.24.
//

import UIKit
final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let someScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: someScene)

        let view = LogInView(holder: NavigationStackHolder())

        window?.rootViewController = UINavigationController(rootViewController: view.viewController)
        window?.makeKeyAndVisible()
    }
}


