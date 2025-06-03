//
//  NetworkConfigProviderProtocol.swift
//  Networking
//
//  Created by Nalou Nguyen on 2/6/25.
//

import Foundation

public protocol NetworkConfigProviderProtocol: AnyObject {
    var endPoint: String { get }
    var retryAPICount: Int { get }
    var apiCallTimeout: Double { get } // Seconds
    var retryDelay: Double { get } // Seconds
}
