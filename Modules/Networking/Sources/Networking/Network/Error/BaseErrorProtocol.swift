//
//  Untitled.swift
//  Networking
//
//  Created by Nalou Nguyen on 2/6/25.
//

import Foundation

public protocol BaseErrorProtocol: Error {
    var title: String { get }
    var code: String { get }
    var message: String { get }
    var info: [String: String]? { get }
}
