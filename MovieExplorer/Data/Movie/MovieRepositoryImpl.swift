//
//  MovieRepositoryImpl.swift
//  MovieExplorer
//
//  Created by Nalou Nguyen on 3/6/25.
//

import Foundation

final actor MovieRepositoryImpl: MovieRepository {
    let networking: Networking
    let appSessionManager: AppSessionManagerProtocol
    
    init(
        networking: Networking,
        appSessionManager: AppSessionManagerProtocol
    ) {
        self.networking = networking
        self.appSessionManager = appSessionManager
    }
    
    func fetchMovies(page: Int) async throws -> GetMovieListResponse {
        let request = GetMovieListRequest(page: page)
        return try await networking.request(request)
    }
}
