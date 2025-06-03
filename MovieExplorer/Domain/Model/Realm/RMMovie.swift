//
//  RMMovie.swift
//  MovieExplorer
//
//  Created by Nalou Nguyen on 3/6/25.
//

import Foundation
import RealmSwift

class RMMovie: Object {
    @Persisted var isAdult: Bool
    @Persisted var backdropPath: String?
    @Persisted var genreIds: List<Int>
    @Persisted(primaryKey: true) var id: Int
    @Persisted var originalLanguage: String
    @Persisted var originalTitle: String
    @Persisted var overview: String
    @Persisted var popularity: Double
    @Persisted var posterPath: String
    @Persisted var releaseDate: String
    @Persisted var title: String
    @Persisted var video: Bool
    @Persisted var voteAverage: Double
    @Persisted var voteCount: Int
    
    override init() {
        // Nothing
    }
    
    init(
        isAdult: Bool,
        backdropPath: String? = nil,
        genreIds: List<Int>,
        id: Int,
        originalLanguage: String,
        originalTitle: String,
        overview: String,
        popularity: Double,
        posterPath: String,
        releaseDate: String,
        title: String,
        video: Bool,
        voteAverage: Double,
        voteCount: Int
    ) {
        super.init()
        self.isAdult = isAdult
        self.backdropPath = backdropPath
        self.genreIds = genreIds
        self.id = id
        self.originalLanguage = originalLanguage
        self.originalTitle = originalTitle
        self.overview = overview
        self.popularity = popularity
        self.posterPath = posterPath
        self.releaseDate = releaseDate
        self.title = title
        self.video = video
        self.voteAverage = voteAverage
        self.voteCount = voteCount
        
    }
    
    
}

extension RMMovie {
    var toMovieModel: MovieModel {
        MovieModel(
            isAdult: isAdult,
            id: id,
            originalLanguage: originalLanguage,
            originalTitle: originalTitle,
            overview: overview,
            popularity: popularity,
            posterPath: posterPath,
            releaseDate: releaseDate,
            title: title,
            video: video,
            voteAverage: voteAverage,
            voteCount: voteCount
        )
    }
}
