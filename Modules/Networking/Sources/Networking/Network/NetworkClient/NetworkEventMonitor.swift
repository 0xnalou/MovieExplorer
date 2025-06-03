//
//  NetworkEventMonitor.swift
//  Networking
//
//  Created by Nalou Nguyen on 2/6/25.
//

import Foundation
import Alamofire
import OSLog

class NetworkEventMonitor: EventMonitor {
    let queue = DispatchQueue(label: "com.movieExplorer.networkmonitor")
    let logger: Logger
    
    init(logger: Logger) {
        self.logger = logger
    }
    
    func request(_ request: DataRequest, didParseResponse response: DataResponse<Data?, AFError>) {
        guard let request = request.request else {
            return
        }
        
        var message = "🚀🚀🚀🚀🚀 Request:\n\(request.logMessage())"
        message += "\n💦💦💦💦💦 Response:\n"
        if let statusCode = response.response?.statusCode {
            message += "\(statusCodeMessage(statusCode))\n"
        }
        
        switch response.result {
        case .success(_):
            break
        case .failure(let error):
            message += "⛔️ Error: \(error.localizedDescription)\n"
        }
        
        if let data = response.data {
            if let json = try? JSONSerialization.jsonObject(with: data) as? [String: AnyObject] {
                message += "📦 Payload: \(json.prettyPrint())\n"
            } else {
                message += "📦 Payload: \(String(data: data, encoding: .utf8) ?? "")\n"
            }
        }
        logger.info("\(message)")
    }
}

extension NetworkEventMonitor {
    func statusCodeMessage(_ statusCode: Int) -> String {
        switch statusCode {
        case 200..<300:
            return "✅ Success - Status Code: \(statusCode)"
        case 300..<400:
            return "⚠️ Redirect/Warning - Status Code: \(statusCode)"
        case 400..<500:
            return "❌ Client Error - Status Code: \(statusCode)"
        case 500..<600:
            return "❌ Server Error - Status Code: \(statusCode)"
        default:
            return "ℹ️ Status Code: \(statusCode)"
        }
    }
}
