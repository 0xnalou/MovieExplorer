//
//  AppState+Action.swift
//  MovieExplorer
//
//  Created by Nalou Nguyen on 2/6/25.
//

import Foundation

struct AppStartState {
    var showToast: AnyPublisher<Toast?, Never>
    var showMovieListScreen: AnyPublisher<Void, Never>
}

struct AppStartAction {

}
