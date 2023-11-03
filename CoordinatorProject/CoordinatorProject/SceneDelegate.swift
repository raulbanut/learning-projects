//
//  SceneDelegate.swift
//  CoordinatorProject
//
//  Created by Banut Raul on 18.10.2023.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var rootCoordinator: RootCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            let rootCoordinator = RootCoordinator(window: window)
            rootCoordinator.start()
            self.rootCoordinator = rootCoordinator 
            window.makeKeyAndVisible()
        }
    }
}
