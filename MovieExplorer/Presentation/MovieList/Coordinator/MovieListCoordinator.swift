//
//  MovieListCoordinator.swift
//  MovieExplorer
//
//  Created by Nalou Nguyen on 2/6/25.
//

import Foundation
import SwiftUI

final class MovieListCoordinator: BaseCoordinator<MovieListDependency, MovieListViewModel>, Coordinator {
    init(
        navigationController: NavigationController,
        sheetPath: SheetPath = .init(),
        dependency: MovieListDependency
    ) {
        let viewModel = dependency.resolve(MovieListViewModel.self)

        super.init(
            navigationController: navigationController,
            viewModel: viewModel,
            dependency: dependency
        )
    }
    
    override func bindingViewModel() {
        super.bindingViewModel()
        
        viewModel.state.openDetailScreen.sink { [weak self] detail in
            guard let self else { return }
            
            let dependency = MovieDetailDependency(parent: dependency)
            let movieDetailCoordinator = MovieDetailCoordinator(
                detail: detail,
                navigationController: navigationController,
                dependency: dependency
            )
            
            push(movieDetailCoordinator)
        }
        .store(in: &disposeBag)
    }
    
    func start() -> some View {
        NavigationStack(path: $navigationController.navigationPath) {
            MovieListScreen(viewModel: self.viewModel)
                .navigationDestination(for: MovieDetailCoordinator.self) {
                    CoordinatorView($0)
                }
        }
    }
}
