//
//  SceneDelegate.swift
//  IBAN-Saver-App
//
//  Created by Salome Lapiashvili on 10.01.24.
//

import UIKit
import Firebase



final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let someScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: someScene)
        
        if Auth.auth().currentUser == nil {
            let view = LogInView(holder: NavigationStackHolder())
            window?.rootViewController = UINavigationController(rootViewController: view.viewController)
        }else {
            let holder = NavigationStackHolder()
            
            ApiManager.fetchUserData { user in
                let view = IBANListViewController(
                    holder: holder,
                    navigationCoordinator: NavigationCoordinator(holder: holder),
                    user: user
                )
                self.window?.rootViewController = UINavigationController(rootViewController: view.viewController)
            }
        }
        
        window?.makeKeyAndVisible()
    }
}


