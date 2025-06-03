//
//  GetMovieListRequest.swift
//  MovieExplorer
//
//  Created by Nalou Nguyen on 3/6/25.
//

import Foundation

struct GetMovieListRequest: APIRequest {
    var path: String = "/3/discover/movie"
    var method: HTTPMethod = .get
    var queryItems: [String: String]
    
    init(page: Int = 1) {
        queryItems = [
            "page": "\(page)"
        ]
    }
}

struct GetMovieDetailRequest: APIRequest {
    var path: String
    var method: HTTPMethod = .get
    
    init(id: Int) {
        path = "/3/movie/\(id)"
    }
}


