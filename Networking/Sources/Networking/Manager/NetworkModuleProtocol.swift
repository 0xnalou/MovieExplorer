//
//  NetworkModuleProtocol.swift
//  Networking
//
//  Created by Nalou Nguyen on 2/6/25.
//

import Foundation

public protocol NetworkModuleProtocol: AnyObject {
    func makeConfigProvider() -> NetworkConfigProviderProtocol
    func makeCommonHeaderProvider() -> DefaultHeaderProvider
}
