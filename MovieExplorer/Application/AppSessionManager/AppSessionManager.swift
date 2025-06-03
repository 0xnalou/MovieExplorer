//
//  Untitled.swift
//  MovieExplorer
//
//  Created by Nalou Nguyen on 3/6/25.
//

final class AppSessionManager {
    // MARK: - Public Properties
    public static let shared = AppSessionManager()
    var accessToken: String? = AppConfiguration().accessToken
    
    // MARK: - Private Functions
    private init() {
    }
}

// MARK: - AppSessionManagerProtocol
extension AppSessionManager: AppSessionManagerProtocol {
}
