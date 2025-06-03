//
//  StorageRepository.swift
//  MovieExplorer
//
//  Created by Nalou Nguyen on 3/6/25.
//

import Foundation

protocol StorageRepository {
    
    func store(movies: [MovieModel]) async throws
    func delete(movie: MovieModel) async throws
    func fetchAllMovie() async throws -> [MovieModel]
    
    /**
     Clean Local Storage
     */
    func resetStorage() async throws
}
