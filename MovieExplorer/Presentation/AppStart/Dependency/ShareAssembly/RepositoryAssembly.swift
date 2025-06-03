//
//  RepositoryAssembly.swift
//  MovieExplorer
//
//  Created by Nalou Nguyen on 2/6/25.
//

import Foundation

final class RepositoryAssembly: Assembly {
    func assemble(container: Container) {
        
        // TransactionRepository
        container
            .register(MovieRepository.self) { resolver in
                guard let networking = resolver.resolve(Networking.self) else {
                    fatalError("Can't resolve \(Networking.self)")
                }
                
                return MovieRepositoryImpl(
                    networking: networking,
                    appSessionManager: AppSessionManager.shared
                )
            }
            .inObjectScope(.container)
        
        // StorageRepository
        container
            .register(StorageRepository.self) { resolver in
                return StorageRepositoryImpl()
            }
            .inObjectScope(.container)
    }
}
