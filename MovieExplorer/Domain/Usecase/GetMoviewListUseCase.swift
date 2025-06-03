//
//  GetMovieListUseCase.swift
//  MovieExplorer
//
//  Created by Nalou Nguyen on 3/6/25.
//
import Foundation


protocol GetMovieListUseCase {
    func execute(page: Int) async throws -> (data: [MovieModel], page: Int)
}

final class GetMovieListUseCaseImpl: GetMovieListUseCase {
    private var movieRepository: MovieRepository
    
    init(movieRepository: MovieRepository) {
        self.movieRepository = movieRepository
    }
    
    func execute(page: Int) async throws -> (data: [MovieModel], page: Int) {
        let result = try await movieRepository.fetchMovies(page: page)
        
        return(data: result.results, page: result.page)
    }
}
