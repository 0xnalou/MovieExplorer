//
//  NetworkDependencyContainer.swift
//  Networking
//
//  Created by Nalou Nguyen on 2/6/25.
//
import Foundation

public protocol DefaultHeaderProvider {
    var headers: [String: String] { get }
}

public final class NetworkDependencyContainer {
    public static let shared = NetworkDependencyContainer()
    private var module: NetworkModuleProtocol?
    private var configProvider: NetworkConfigProviderProtocol?
    private var commonHeaderProvider: DefaultHeaderProvider?
}

// MARK: - NetworkDependencyContainerProtocol
extension NetworkDependencyContainer: NetworkDependencyContainerProtocol {
    public func setupModule(_ module: NetworkModuleProtocol) {
        self.module = module
    }
    
    public func makeConfigProvider() -> NetworkConfigProviderProtocol? {
        if configProvider == nil {
            configProvider = module?.makeConfigProvider()
        }
        return configProvider
    }
    
    public func makeCommonHeaderProvider() -> DefaultHeaderProvider? {
        if commonHeaderProvider == nil {
            commonHeaderProvider = module?.makeCommonHeaderProvider()
        }
        return commonHeaderProvider
    }
}
