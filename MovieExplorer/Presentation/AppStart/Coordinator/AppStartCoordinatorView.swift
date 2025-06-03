//
//  AppStartCoordinatorView.swift
//  MovieExplorer
//
//  Created by Nalou Nguyen on 2/6/25.
//

import Foundation
import SwiftUI
import MVVMCModule

struct AppStartCoordinatorView: View {
    @StateObject var appCoordinator = AppStartCoordinator(
        navigationController: NavigationController(),
        dependency: RootDependency()
    )
    @State private var toast: Toast?
    @EnvironmentObject var globalUIState: AppEnvironmentAggregator.GlobalUIState
    @Environment(\.scenePhase) var scenePhase
    
    var body: some View {
        appCoordinator.startMovieListScreen()
            .toastView(toast: $toast)
            .onAppear(perform: {
                appCoordinator.appOnAppear()
            })
            .onChange(of: scenePhase) { _, newPhase in
                if newPhase == .active {
                    appCoordinator.appOnAppear()
                }
            }
    }
}
