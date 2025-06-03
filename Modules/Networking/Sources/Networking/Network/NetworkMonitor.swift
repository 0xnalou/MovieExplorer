//
//  NetworkMonitor.swift
//  NetworkingModule
//
//  Created by Nalou Nguyen on 3/6/25.
//

import Foundation
import Alamofire

public protocol NetworkMonitor {
    var isReachable: Bool { get }
}

public class NetworkMonitorImpl: NetworkMonitor {
    
    private let reachabilityManager = NetworkReachabilityManager()

    public init() {}

    public var isReachable: Bool {
        return reachabilityManager?.isReachable ?? false
    }
}
