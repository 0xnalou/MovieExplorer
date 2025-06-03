//
//  AppEnvironmentAggregator.swift
//  MovieExplorer
//
//  Created by Nalou Nguyen on 2/6/25.
//

import Foundation

@MainActor
class AppEnvironmentAggregator {
    // MARK: - Properties
    static var globalUIState: GlobalUIState = GlobalUIState()
    
    private init() {
        // Nothing
    }
}

// MARK: - Define classes
extension AppEnvironmentAggregator {
    
    class GlobalUIState: ObservableObject {
        @Published var toast: Toast?
    }
}
