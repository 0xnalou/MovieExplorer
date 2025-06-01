//
//  APIRequest.swift
//  Networking
//
//  Created by Nalou Nguyen on 2/6/25.
//
import Foundation

public protocol APIRequest {
    var path: String { get set }
    
    var method: HTTPMethod { get }
    
    var queryItems: [String: String] { get }
    
    var headers: APIHeader { get }
    
    var body: RequestBody? { get }
}


//MARK: - Default value
public extension APIRequest {
    var body: RequestBody? {
        return nil
    }
    
    var queryItems: [String : String] {
        [:]
    }
    
    var headers: APIHeader {
        DefaultHeader()
    }
    
    func withPrefix(_ prefix: String) -> Self {
        var request = self
        request.path = prefix + request.path
        return request
    }
}

extension APIRequest {
    func toURLRequest(_ host: String) -> URLRequest? {
        var components = URLComponents()
        
        components.scheme = "https"
        components.host = host
        components.path = path
        
        let urlQueries = queryItems
        if !urlQueries.isEmpty {
            var queryItems: [URLQueryItem] = []
            for item in urlQueries {
                queryItems.append(URLQueryItem(name: item.key, value: item.value))
            }
            components.queryItems = queryItems
        }
        
        guard let url = components.url else {
            return nil
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers.requestHeader
        
        switch body {
        case let .data(data):
            request.httpBody = data
        case let .dictionary(dict, options):
            let jsonData = try? JSONSerialization.data(withJSONObject: dict, options: options)
            request.httpBody = jsonData
        case let .encodable(object, encoder):
            let data = try? encoder.encode(object)
            request.httpBody = data
        case .none:
            break
        }
        
        return request
    }
}
