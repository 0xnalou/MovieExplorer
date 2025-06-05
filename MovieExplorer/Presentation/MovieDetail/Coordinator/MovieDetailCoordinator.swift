//
//  MovieDetailCoordinator.swift
//  MovieExplorer
//
//  Created by Nalou Nguyen on 3/6/25.
//

import Foundation
import SwiftUI


final class MovieDetailCoordinator: BaseCoordinator<MovieDetailDependency, MovieDetailViewModel>, Coordinator {
    init(
        detail: MovieModel,
        navigationController: NavigationController,
        sheetPath: SheetPath = .init(),
        dependency: MovieDetailDependency
    ) {
        let viewModel = MovieDetailViewModel(movie: detail)

        super.init(
            navigationController: navigationController,
            viewModel: viewModel,
            dependency: dependency
        )
    }
    
    override func bindingViewModel() {
        super.bindingViewModel()
        
    }
    
    func start() -> some View {
        MovieDetailScreen(viewModel: viewModel)
    }
}
