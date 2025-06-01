//
//  Extension+AFError.swift
//  Networking
//
//  Created by Nalou Nguyen on 2/6/25.
//

import Foundation
import Alamofire

extension APIError {
    static func map(from error: AFError) -> APIError? {
        switch error {
        case .sessionTaskFailed(let underlyingError as URLError):
            switch underlyingError.code {
            case .notConnectedToInternet:
                return APIError.networkError(type: .noInternetConnection)
            case .timedOut:
                return APIError.internalError(error: .requestTimeOut)
            default:
                return nil
            }
        case .responseValidationFailed(reason: let reason):
            switch reason {
            case .unacceptableStatusCode(let statusCode) where (500...599).contains(statusCode):
                let info = ErrorResponse(code: "\(statusCode)")
                return APIError.serverFailure(info)
            default:
                return nil
            }
        default:
            return nil
        }
    }
}
