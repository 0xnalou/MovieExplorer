//
//  APIHeader.swift
//  Networking
//
//  Created by Nalou Nguyen on 2/6/25.
//

import Foundation

public protocol APIHeader {
    var requestHeader: [String: String] { get }
}

public struct DefaultHeader: APIHeader {
    public var requestHeader: [String : String] = [:]
    
    public init(requestHeader: [String : String] = [:]) {
        self.requestHeader = requestHeader
    }
}
