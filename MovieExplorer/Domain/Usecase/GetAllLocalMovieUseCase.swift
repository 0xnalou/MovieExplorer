//
//  GetAllLocalMovieUseCase.swift
//  MovieExplorer
//
//  Created by Nalou Nguyen on 3/6/25.
//

import Foundation

protocol GetAllLocalMovieUseCase {
    func execute() async throws -> [MovieModel]
}

class GetAllLocalMovieUseCaseImpl: GetAllLocalMovieUseCase {
    private let storageRepository: StorageRepository

    init(
        storageRepository: StorageRepository
    ) {
        self.storageRepository = storageRepository
    }
    
    func execute() async throws -> [MovieModel] {
        try await storageRepository.fetchAllMovie()
    }
}
