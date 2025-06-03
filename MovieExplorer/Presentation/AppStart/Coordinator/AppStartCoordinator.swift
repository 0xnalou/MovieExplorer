//
//  AppStartCoordinator.swift
//  MovieExplorer
//
//  Created by Nalou Nguyen on 2/6/25.
//

import Foundation
import SwiftUI

final class AppStartCoordinator: BaseCoordinator<RootDependency, AppStartViewModel> {
    var movieListCoordinator: MovieListCoordinator
    
    private let showWelcomeScreenPublisher = PassthroughSubject<Void, Never>()
    
    init(
        navigationController: NavigationController,
        sheetPath: SheetPath = .init(),
        dependency: RootDependency
    ) {
        
        let movieListDependency = MovieListDependency(parent: dependency)
        movieListCoordinator = MovieListCoordinator(navigationController: NavigationController(),
                                                    dependency: movieListDependency)
        
        let viewModel = AppStartViewModel()
        
        super.init(
            navigationController: navigationController,
            viewModel: viewModel,
            dependency: dependency
        )
    }

    func appOnAppear() {
        viewModel.commonAction.onViewAppear()
    }
    
    func startMovieListScreen() -> some View {
        CoordinatorView(movieListCoordinator)
//        MovieListCoordinatorView(coordinator: movieListCoordinator)
    }
}
