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

        let rootViewController = TTRootViewController()
        
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = rootViewController
        window.overrideUserInterfaceStyle = .dark
        window.makeKeyAndVisible()
        
        self.window = window
    }
}
