//
//  NetworkConfigProvider.swift
//  MovieExplorer
//
//  Created by Nalou Nguyen on 3/6/25.
//

final class NetworkConfigProvider: NetworkConfigProviderProtocol {
    var retryAPICount: Int = 3
    var apiCallTimeout: Double = 60.0
    var retryDelay: Double = 2.0
    var endPoint: String = AppConfiguration().serverDomainName
    
}
