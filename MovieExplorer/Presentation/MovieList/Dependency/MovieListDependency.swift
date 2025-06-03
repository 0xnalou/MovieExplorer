//
//  MovieListDependency.swift
//  MovieExplorer
//
//  Created by Nalou Nguyen on 2/6/25.
//

import Foundation

class MovieListDependency: Dependency {
    override func setup() {
        assembler.apply(assembly: MovieListAssembly())
    }
}
