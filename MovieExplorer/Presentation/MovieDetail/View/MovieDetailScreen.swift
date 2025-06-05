//
//  MovieDetailScreen.swift
//  MovieExplorer
//
//  Created by Nalou Nguyen on 3/6/25.
//

import SwiftUI
import Kingfisher

struct MovieDetailScreen: View {
    @ObservedObject var viewModel: MovieDetailViewModel

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                KFImage(viewModel.state.movie.posterURL)
                    .resizable()
                    .placeholder {
                        Color.gray.frame(height: 300)
                    }
                    .cacheOriginalImage()
                    .fade(duration: 0.3)
                    .aspectRatio(contentMode: .fit)
                    .shadow(radius: 6)

                VStack(alignment: .leading, spacing: 8) {
                    Text(viewModel.state.movie.title)
                        .font(.title)
                        .fontWeight(.bold)

                    HStack(spacing: 8) {
                        Text(viewModel.state.movie.releaseYear)
                            .foregroundColor(.gray)
                            .font(.subheadline)
                        
                        Label(String(format: "%.1f", viewModel.state.movie.voteAverage), systemImage: "star.fill")
                            .foregroundColor(.orange)
                            .font(.subheadline)
                    }
                    if !viewModel.state.movie.overview.isEmpty {
                        Text("Overview")
                            .font(.headline)
                            .padding(.top, 12)

                        Text(viewModel.state.movie.overview)
                            .font(.body)
                            .foregroundColor(.primary)
                    }
                    
                    if let genres = viewModel.state.movie.genreIds, !genres.isEmpty {
                        Text("Genres")
                            .font(.headline)
                            .foregroundColor(.orange)
                            .padding(.top)
                        
                        FlowLayout(items: genres, spacing: 8) { genre in
                            Text("\(genre)")
                                .padding(.horizontal, 12)
                                .padding(.vertical, 6)
                                .background(Color(.systemGray5))
                                .cornerRadius(16)
                        }
                    }
                }
                .padding([.horizontal, .bottom])
            }
            .padding(.top)
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}
