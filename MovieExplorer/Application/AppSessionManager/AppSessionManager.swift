//
//  Untitled.swift
//  MovieExplorer
//
//  Created by Nalou Nguyen on 3/6/25.
//

final class AppSessionManager {
    public static let shared = AppSessionManager()
    var accessToken: String? = AppConfiguration().accessToken
    
    private init() {
    }
}

extension AppSessionManager: AppSessionManagerProtocol {
}
