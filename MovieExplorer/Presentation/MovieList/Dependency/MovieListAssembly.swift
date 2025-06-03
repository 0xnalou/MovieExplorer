//
//  MovieListAssembly.swift
//  MovieExplorer
//
//  Created by Nalou Nguyen on 2/6/25.
//

import Foundation

class MovieListAssembly: Assembly {
    func assemble(container: Container) {
        
        container
            .register(GetMovieListUseCase.self) { resolver in
                guard let movieRepository = resolver.resolve(MovieRepository.self) else {
                    fatalError("Cannot resolve \(MovieRepository.self)")
                }
                
                return GetMovieListUseCaseImpl(movieRepository: movieRepository)
            }
            .inObjectScope(.container)
        
        container
            .register(StorageLocalMoviesUseCase.self) { resolver in
                guard let storageRepository = resolver.resolve(StorageRepository.self) else {
                    fatalError("Cannot resolve \(StorageRepository.self)")
                }
                
                return StorageLocalMoviesUseCaseImpl(storageRepository: storageRepository)
            }
            .inObjectScope(.container)
        
        container
            .register(GetAllLocalMovieUseCase.self) { resolver in
                guard let storageRepository = resolver.resolve(StorageRepository.self) else {
                    fatalError("Cannot resolve \(StorageRepository.self)")
                }
                
                return GetAllLocalMovieUseCaseImpl(storageRepository: storageRepository)
            }
            .inObjectScope(.container)
        
        container
            .register(MovieListViewModel.self) { resolver in
                
                guard let getMovieListUseCase = resolver.resolve(GetMovieListUseCase.self) else {
                    fatalError("Cannot resolve \(GetMovieListUseCase.self)")
                }
                
                guard let networkMonitor = resolver.resolve(NetworkMonitor.self) else {
                    fatalError("Cannot resolve \(NetworkMonitor.self)")
                }
                
                guard let storageLocalMoviesUseCase = resolver.resolve(StorageLocalMoviesUseCase.self) else {
                    fatalError("Cannot resolve \(StorageLocalMoviesUseCase.self)")
                }
                
                guard let getAllLocalMovieUseCase = resolver.resolve(GetAllLocalMovieUseCase.self) else {
                    fatalError("Cannot resolve \(GetAllLocalMovieUseCase.self)")
                }
                
                return MovieListViewModel(
                    getMovieListUseCase: getMovieListUseCase,
                    networkMonitor: networkMonitor,
                    storageLocalMoviesUseCase: storageLocalMoviesUseCase,
                    getAllLocalMovieUseCase: getAllLocalMovieUseCase
                )
            }
            .inObjectScope(.container)
    }
}
