//
//  NetworkDependencyContainerProtocol.swift
//  Networking
//
//  Created by Nalou Nguyen on 2/6/25.
//

import Foundation

public protocol NetworkDependencyContainerProtocol: AnyObject {
    func setupModule(_ module: NetworkModuleProtocol)
    func makeConfigProvider() -> NetworkConfigProviderProtocol?
}
