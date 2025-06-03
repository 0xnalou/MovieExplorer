//
//  APIError.swift
//  Networking
//
//  Created by Nalou Nguyen on 2/6/25.
//

import Foundation

public enum APIError: Error {
    case networkError(type: NetworkError)
    case severError(error: BaseErrorProtocol)
    case serverFailure(BaseErrorProtocol) // StatusCode: 5xx
    case internalError(error: InternalError)
    case unknown
}


extension Error {
    /// Returns the instance cast as an `APIError`.
    public var asAPIError: APIError? {
        self as? APIError
    }
    
    public var asBaseError: BaseErrorProtocol? {
        self as? BaseErrorProtocol
    }
}
