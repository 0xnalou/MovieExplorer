//
//  NetworkLogger.swift
//  Networking
//
//  Created by Nalou Nguyen on 2/6/25.
//

import Foundation
import OSLog

public class NetworkLogger {
    private var isLoggingEnabled: Bool = false
    private init() {
        // Do Nothing
    }
    private static var bundleIdentifier = Bundle.main.bundleIdentifier!
    static let network = Logger(subsystem: bundleIdentifier, category: "networking")
    
    public let application = Logger(subsystem: bundleIdentifier, category: "application")
    public let module = Logger(subsystem: bundleIdentifier, category: "module")
    
    public func loggingEnabled(_ isEnabled: Bool) -> Self {
        isLoggingEnabled = isEnabled
        return self
    }
}
