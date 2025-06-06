//
//  MovieListScreen.swift
//  MovieExplorer
//
//  Created by Nalou Nguyen on 2/6/25.
//

import SwiftUI

struct MovieListScreen: View {
    @ObservedObject var viewModel: MovieListViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                movieList
            }
        }
        .handleCommonViewModel(using: viewModel)
        .navigationTitle("🎬 Movie Explorer")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    var movieList: some View {
        VStack {
            let movieList =  viewModel.state.movies
            let lastItem = movieList.last
            
            List(viewModel.state.movies) { item in
                MovieItemView(movie: item) { id in
                    viewModel.action.openMovieDetail(id)
                }
                .onAppear {
                    if lastItem?.id == item.id {
                        viewModel.action.loadMovies()
                    }
                }
            }
            
            if viewModel.state.isLoading {
                HStack {
                    Spacer()
                    ProgressView()
                        .padding()
                    Spacer()
                }
                .listRowSeparator(.hidden)
            }
        }
        .clipped()
        .refreshable {
            viewModel.action.reloadMovies()
        }
    }
}
