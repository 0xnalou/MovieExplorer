//
//  MovieListViewModel.swift
//  MovieExplorer
//
//  Created by Nalou Nguyen on 2/6/25.
//

import Foundation

final class MovieListViewModel: BaseViewModelImpl, BaseViewModel {
    // MARK: - State
    @Published private(set) var state: MovieListState
    
    // MARK: - Action
    var action: MovieListAction {
        return MovieListAction(
            loadMovies: loadMovies,
            reloadMovies: reloadMovies,
            openMovieDetail: openMovieDetail
        )
    }
    
    // MARK: - Properties
    private let getMovieListUseCase: GetMovieListUseCase
    private let storageLocalMoviesUseCase: StorageLocalMoviesUseCase
    private let getAllLocalMovieUseCase: GetAllLocalMovieUseCase
    
    private var pageIndex: Int = 0
    private var isFetchedLocal: Bool = false
    private var latestTask: Task<Void, Never>?
    private var openDetailScreenSubject = PassthroughSubject<MovieModel, Never>()
    private var networkMonitor: NetworkMonitor
    
    init(getMovieListUseCase: GetMovieListUseCase,
         networkMonitor: NetworkMonitor,
         storageLocalMoviesUseCase: StorageLocalMoviesUseCase,
         getAllLocalMovieUseCase: GetAllLocalMovieUseCase) {
        self.state = MovieListState(openDetailScreen: openDetailScreenSubject.asDriver())
        self.getMovieListUseCase = getMovieListUseCase
        self.storageLocalMoviesUseCase = storageLocalMoviesUseCase
        self.getAllLocalMovieUseCase = getAllLocalMovieUseCase
        self.networkMonitor = networkMonitor
        
        super.init()
        
    }
    
    override func onViewAppear() {
        super.onViewAppear()
        loadMovies()

    }
}

// MARK: TransactionHistoryAction

private extension MovieListViewModel {
    func loadMovies() {
        if state.isLoading { return }
        self.state.isLoading = true
        
        latestTask?.cancel()
        latestTask = loadMovieTask()
    }
    
    func reloadMovies() {
        reset()
        loadMovies()
    }
    
    func reset() {
        latestTask?.cancel()
        state.movies = []
        state.isLoading = false
        pageIndex = 0
    }
    
    func loadMovieTask() -> Task<Void, Never> {
        Task { @MainActor in
            defer {
                state.isLoading = false
            }
            
            if Task.isCancelled {
                return
            }
            
            do {
                if networkMonitor.isReachable {
                    let movies = try await fetchMovies()
                    
                    guard !movies.data.isEmpty else {
                        return
                    }
                    
                    pageIndex = movies.page
                    var currentMovies = state.movies
                    try await storageLocalMoviesUseCase.execute(movies: movies.data)
                    
                    currentMovies.append(contentsOf: movies.data)
                    
                    state.movies = currentMovies
                }else {
                    let toast = Toast(title: "No Internet Access",
                                      subtitle: "Plese check your intertnet connection",
                                      icon: "")
                    showToast(toast)
                    if !isFetchedLocal {
                        state.movies = try await getAllLocalMovieUseCase.execute()
                    }
                }
                

            } catch {
                let toast = Toast(title: "Error",
                                  subtitle: error.localizedDescription,
                                  icon: "")
                showToast(toast)
            }
        }
    }
    
    
    func fetchMovies() async throws -> (data: [MovieModel], page: Int) {
        return try await getMovieListUseCase.execute(page: pageIndex + 1)
    }
    
    func openMovieDetail(_ id: Int) {
        Task {
            await loadMovieDetail(id)
        }
    }
    
    @MainActor
    func loadMovieDetail(_ id: Int) {
        guard let result = state.movies.first (where: { $0.id == id}) else {
            return
        }
        openDetailScreenSubject.send(result)
    }
}
