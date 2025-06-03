//
//  MovieExplorerApp.swift
//  MovieExplorer
//
//  Created by Nalou Nguyen on 1/6/25.
//

import SwiftUI

@main
struct MovieExplorerApp: App {
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    @StateObject var globalUIState = AppEnvironmentAggregator.globalUIState
    
    var body: some Scene {
        WindowGroup {
            AppStartCoordinatorView()
                .environmentObject(globalUIState)
        }
    }
}
