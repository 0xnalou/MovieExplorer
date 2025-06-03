//
//  StorageLocalMoviesUseCase.swift
//  MovieExplorer
//
//  Created by Nalou Nguyen on 3/6/25.
//

import Foundation

protocol StorageLocalMoviesUseCase {
    func execute(movies: [MovieModel]) async throws
}

class StorageLocalMoviesUseCaseImpl: StorageLocalMoviesUseCase {
    private let storageRepository: StorageRepository

    init(
        storageRepository: StorageRepository
    ) {
        self.storageRepository = storageRepository
    }
    
    func execute(movies: [MovieModel]) async throws {
        try await storageRepository.store(movies: movies)
        
    }
}
