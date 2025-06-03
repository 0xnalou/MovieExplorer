//
//  AppDelegate.swift
//  MovieExplorer
//
//  Created by Nalou Nguyen on 3/6/25.
//

import Foundation
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        launchConfig(launchOptions)
        
        return true
    }
    
    func application(
        _ application: UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
        options: UIScene.ConnectionOptions
    ) -> UISceneConfiguration {
        
        let sceneConfig = UISceneConfiguration(name: nil, sessionRole: connectingSceneSession.role)
        sceneConfig.delegateClass = SceneDelegate.self
        return sceneConfig
    }
}

extension AppDelegate {
    private func launchConfig(_ launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        setupNetworkingModule()
    }
    
    private func setupNetworkingModule() {
        NetworkDependencyContainer.shared.setupModule(NetworkModule())
    }
}
