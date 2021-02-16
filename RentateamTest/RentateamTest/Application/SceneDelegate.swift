//
//  SceneDelegate.swift
//  RentateamTest
//
//  Created by Дарья on 16.02.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        let nv = UINavigationController(rootViewController: PhotoFeedViewController())
        window?.rootViewController = nv
        window?.makeKeyAndVisible()
    }
}

