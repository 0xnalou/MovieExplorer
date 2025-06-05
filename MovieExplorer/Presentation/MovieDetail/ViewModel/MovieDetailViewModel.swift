//
//  MovieDetailViewModel.swift
//  MovieExplorer
//
//  Created by Nalou Nguyen on 3/6/25.
//

import Foundation

final class MovieDetailViewModel: BaseViewModelImpl, BaseViewModel {
    @Published private(set) var state: MovieDetailState
    
    var action: MovieDetailAction {
        return MovieDetailAction()
    }
    
    init(movie: MovieModel) {
        self.state = MovieDetailState(movie: movie)
        super.init()
        
    }
    
    override func onViewAppear() {
        super.onViewAppear()
    }
}
