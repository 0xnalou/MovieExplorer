//
//  NetworkModule.swift
//  MovieExplorer
//
//  Created by Nalou Nguyen on 3/6/25.
//

import Foundation

final class NetworkModule: NetworkModuleProtocol {
    func makeConfigProvider() -> any NetworkConfigProviderProtocol {
        NetworkConfigProvider()
    }
    
    func makeCommonHeaderProvider() -> any DefaultHeaderProvider {
        DefaultHeaderProviderImpl()
    }
}
