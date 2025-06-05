//
//  AppEnvironmentAggregator.swift
//  MovieExplorer
//
//  Created by Nalou Nguyen on 2/6/25.
//

import Foundation

@MainActor
class AppEnvironmentAggregator {
    static var globalUIState: GlobalUIState = GlobalUIState()
    
    private init() {
        // Nothing
    }
}

extension AppEnvironmentAggregator {
    
    class GlobalUIState: ObservableObject {
        @Published var toast: Toast?
    }
}
