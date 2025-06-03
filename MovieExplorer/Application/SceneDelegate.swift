//
//  SceneDelegate.swift
//  MovieExplorer
//
//  Created by Nalou Nguyen on 3/6/25.
//

import Foundation
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    private var hudWindow: UIWindow?
    private var globalUIState = AppEnvironmentAggregator.globalUIState
    
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        
//        if let windowScene = scene as? UIWindowScene {
//            setupHUDWindow(in: windowScene)
//        }
    }
}

private extension SceneDelegate {
//    func setupHUDWindow(in scene: UIWindowScene) {
//        let hudWindow = UIPassThroughWindow(windowScene: scene)
//        let swiftUIContent = HUDWindow()
//            .environmentObject(globalUIState)
//        
//        let controller = UIHostingController(rootView: swiftUIContent)
//        controller.view.backgroundColor = .clear
//        hudWindow.rootViewController = controller
//        hudWindow.isHidden = false
//        self.hudWindow = hudWindow
//    }
}
