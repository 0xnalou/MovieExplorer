//
//  MovieListState+Action.swift
//  MovieExplorer
//
//  Created by Nalou Nguyen on 2/6/25.
//

import Foundation

struct MovieListState {
    var movies: [MovieModel] = []
    var isLoading: Bool = false
    var openDetailScreen: AnyPublisher<MovieModel, Never>
}

struct MovieListAction {
    var loadMovies: () -> Void
    var reloadMovies: () -> Void
    var openMovieDetail: (_ id: Int) -> Void
}

