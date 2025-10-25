//
//  TTSceneDelegate.swift
//  Trebiltrack
//
//  Created by Seb Vidal on 25/10/2025.
//

import UIKit

class TTSceneDelegate: UIResponder, UIWindowSceneDelegate {
    // MARK: - Public Properties
    var window: UIWindow?

    // MARK: - UIWindowSceneDelegate
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        
        let mapViewController = TTMapViewController()
        
        let navigationController = UINavigationController()
        navigationController.viewControllers = [mapViewController]
        
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        self.window = window
    }
}
