//
//  MovieItemView.swift
//  MovieExplorer
//
//  Created by Nalou Nguyen on 3/6/25.
//

import SwiftUI
import Foundation

struct MovieItemView: View {
    var movie: MovieModel
    
    let onTap: (_ id: Int) -> Void
    
    public var body: some View {
        HStack(spacing: 16) {
            AsyncImage(url: movie.posterURL) { image in
                image.resizable()
            } placeholder: {
                Color.gray
            }
            .frame(width: 60, height: 90)
            .cornerRadius(8)

            VStack(alignment: .leading, spacing: 4) {
                Text(movie.title)
                    .font(.headline)
                Text(movie.releaseYear)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
        .padding(.vertical, 4)
        .onTapGesture {
            self.onTap(movie.id)
        }
    }
}
