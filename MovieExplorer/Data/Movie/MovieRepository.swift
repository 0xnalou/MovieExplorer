//
//  MovieRepository.swift
//  MovieExplorer
//
//  Created by Nalou Nguyen on 3/6/25.
//

import Foundation

protocol MovieRepository {
    
    func fetchMovies(page: Int) async throws -> GetMovieListResponse
}
