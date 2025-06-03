//
//  ErrorResponse.swift
//  Networking
//
//  Created by Nalou Nguyen on 2/6/25.
//

import Foundation

public struct ErrorResponse: BaseErrorProtocol, Decodable {
    public var title: String
    public var message: String
    public var code: String
    public var info: [String : String]?
    
    private enum CodingKeys: String, CodingKey {
        case title = "title"
        case message = "message"
        case code = "error"
    }
    
    init(title: String = "",
         message: String = "",
         code: String = "",
         info: [String : String]? = nil) {
        self.title = title
        self.message = message
        self.code = code
        self.info = info
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.title = try container.decodeIfPresent(String.self, forKey: .title) ?? ""
        self.code = try container.decodeIfPresent(String.self, forKey: .code) ?? ""
        self.message = try container.decodeIfPresent(String.self, forKey: .message) ?? ""
        self.info = nil
      }
}
