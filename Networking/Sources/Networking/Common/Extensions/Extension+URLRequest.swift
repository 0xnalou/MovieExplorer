//
//  Extension+URLRequest.swift
//  Networking
//
//  Created by Nalou Nguyen on 2/6/25.
//

import Foundation

extension URLRequest {
    func logMessage() -> String {
        var result = ""
        result += "🌐 Endpoint: \(url!)\n"
        result += "🎏 Headers: \(allHTTPHeaderFields!)\n"
        result += "🏷️ Method: \(httpMethod!)\n"

        if let httpBody = httpBody {
            let bodyDict = try? JSONSerialization.jsonObject(with: httpBody, options: []) as? [String: AnyObject]

            if let bodyDict = bodyDict {
                result += "📦 Body: \(bodyDict.prettyPrint())"
            } else if let resultString = String(data: httpBody, encoding: .utf8) {
                result += "📦 Body: \(resultString)"
            }
        }

        return result
    }
}
