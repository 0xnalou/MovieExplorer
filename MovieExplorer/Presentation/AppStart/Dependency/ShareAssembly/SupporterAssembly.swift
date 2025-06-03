//
//  SupporterAssembly.swift
//  MovieExplorer
//
//  Created by Nalou Nguyen on 2/6/25.
//

import Foundation


final class SupporterAssembly: Assembly {
    func assemble(container: Container) {
        // Networking
        container.register(Networking.self) { _ in
            guard let networkClient = NetworkClient() else {
                fatalError("Initialize NetworkClient failure")
            }
            return networkClient
        }.inObjectScope(.container)
        
        // NetworkMonitor
        container.register(NetworkMonitor.self) { _ in
            return NetworkMonitorImpl()
        }
        .inObjectScope(.container)
    }
}
