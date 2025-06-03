//
//  MovieDetailDependency.swift
//  MovieExplorer
//
//  Created by Nalou Nguyen on 3/6/25.
//

class MovieDetailDependency: Dependency {
    override func setup() {
        assembler.apply(assembly: MovieDetailAssembly())
    }
}
