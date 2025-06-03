//
//  DefaultHeader.swift
//  MovieExplorer
//
//  Created by Nalou Nguyen on 3/6/25.
//

final class DefaultHeaderProviderImpl: DefaultHeaderProvider {

    var headers: [String: String] {
        var commonHeaders: [String: String] = [:]
        
        let accessToken = AppSessionManager.shared.accessToken ?? ""
        if !accessToken.isEmpty {
            commonHeaders[Constants.HeaderKey.authorization] = "Bearer \(accessToken)"
        }
        
        
        commonHeaders[Constants.HeaderKey.contentType] = Constants.HeaderValue.contentType
        
        return commonHeaders
    }
}
