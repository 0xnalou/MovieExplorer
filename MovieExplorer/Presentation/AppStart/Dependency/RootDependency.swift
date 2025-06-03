//
//  RootDependency.swift
//  MovieExplorer
//
//  Created by Nalou Nguyen on 2/6/25.
//

import Foundation

final class RootDependency: Dependency, ObservableObject {
    override func setup() {
        let repositoryAssembly = RepositoryAssembly()
        let usecaseAssembly = UsecaseAssembly()
        let supportAssembly = SupporterAssembly()
        
        assembler.apply(assemblies: [
            repositoryAssembly,
            usecaseAssembly,
            supportAssembly
        ])
    }
}
