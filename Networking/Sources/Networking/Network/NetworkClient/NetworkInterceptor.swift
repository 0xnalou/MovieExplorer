//
//  NetworkInterceptor.swift
//  Networking
//
//  Created by Nalou Nguyen on 2/6/25.
//

import Foundation
import Alamofire

class NetworkInterceptor: RequestInterceptor {
    private let retryLimit: Int
    private let retryDelay: TimeInterval
    private let defaultHeader: DefaultHeaderProvider?
    
    init(
        retryLimit: Int,
        retryDelay: TimeInterval,
        defaultHeader: DefaultHeaderProvider?
    ) {
        self.retryLimit = retryLimit
        self.retryDelay = retryDelay
        self.defaultHeader = defaultHeader
    }
    
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, any Error>) -> Void) {
        guard let defaultHeader else {
            completion(.success(urlRequest))
            return
        }
        
        var urlRequest = urlRequest
        for (key, value) in defaultHeader.headers {
            urlRequest.setValue(value, forHTTPHeaderField: key)
        }
        completion(.success(urlRequest))
    }
    
    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        if request.retryCount >= retryLimit {
            completion(.doNotRetry)
            return
        }
        
        guard let afError = error.asAFError else {
            completion(.doNotRetry)
            return
        }
        
        switch afError {
        case .responseValidationFailed(let reason):
            if case .unacceptableStatusCode(let statusCode) = reason {
                if statusCode >= 500 {
                    completion(.retryWithDelay(retryDelay))
                    return
                }
            }
        case .sessionTaskFailed(let urlError as URLError):
            if urlError.code == .timedOut {
                completion(.retryWithDelay(retryDelay))
                return
            }
        default:
            break
        }
        
        completion(.doNotRetry)
    }
}
