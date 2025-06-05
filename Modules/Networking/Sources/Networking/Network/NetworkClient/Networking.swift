//
//  Networking.swift
//  Networking
//
//  Created by Nalou Nguyen on 2/6/25.
//
import Foundation

public typealias APIResponse = (data: Data?, statusCode: Int)

public protocol Networking {
    
    func request(_ request: any APIRequest) async -> Result<APIResponse, APIError>
    
    func request<Response: Decodable>(request: any APIRequest, decoder: JSONDecoder) async throws -> Response
    
    func request<Response: Decodable>(_ request: any APIRequest) async throws -> Response
}

public extension Networking {
    func request<Response: Decodable>(_ request: any APIRequest) async throws -> Response {
        return try await self.request(request: request, decoder: JSONDecoder())
    }
}
