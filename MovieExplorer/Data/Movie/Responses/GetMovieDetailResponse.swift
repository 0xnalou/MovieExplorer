//
//  GetMovieDetailResponse.swift
//  MovieExplorer
//
//  Created by Nalou Nguyen on 3/6/25.
//

struct GetMovieDetailResponse: Codable {
    let page: Int
    let results: [MovieModel]
    let totalPages: Int
    let totalResults: Int
    
    enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
