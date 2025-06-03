//
//  InternalError.swift
//  Networking
//
//  Created by Nalou Nguyen on 2/6/25.
//

import Foundation

public enum InternalError {
    case parsing(error: Error)
    case requestTimeOut
}
