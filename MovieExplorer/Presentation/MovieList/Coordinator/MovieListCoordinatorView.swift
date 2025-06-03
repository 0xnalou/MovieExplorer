//
//  MovieListCoordinatorView.swift
//  MovieExplorer
//
//  Created by Nalou Nguyen on 3/6/25.
//

import Foundation
import SwiftUI

struct MovieListCoordinatorView: View {
    @StateObject private var coordinator: MovieListCoordinator
    
    init(coordinator: MovieListCoordinator) {
        self._coordinator = StateObject(wrappedValue: coordinator)
    }
    
    var body: some View {
        coordinator.start()
            .sheet(for: $coordinator.sheetPath)
    }
}
