//
//  RequestBody.swift
//  Networking
//
//  Created by Nalou Nguyen on 2/6/25.
//

import Foundation

public enum RequestBody {
    case data(Data)
    
    case dictionary([String: Any],
                    options: JSONSerialization.WritingOptions = [])
    
    case encodable(Encodable,
                   encoder: JSONEncoder = .init())
}
