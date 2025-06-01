//
//  Networking.swift
//  Networking
//
//  Created by Nalou Nguyen on 2/6/25.
//
import Foundation

public typealias APIResponse = (data: Data?, statusCode: Int)

/// A protocol that defines the interface for performing network requests.
///
/// The `Networking` protocol provides three methods for handling network requests,
/// supporting different levels of customization in how requests are processed and responses are handled.
public protocol Networking {
    
    /// Performs a network request and returns a `Result` containing either a successful `APIResponse`
    /// or an `APIError` indicating failure.
    ///
    /// - Parameter request: An object conforming to `APIRequest` protocol, representing the request to be made.
    /// - Returns: A `Result` object containing either a success with `APIResponse` or failure with `APIError`.
    func request(_ request: any APIRequest) async -> Result<APIResponse, APIError>
    
    /// Performs a network request and decodes the response into a specified `Decodable` type using a provided `JSONDecoder`.
    ///
    /// - Parameters:
    ///   - request: An object conforming to `APIRequest` protocol, representing the request to be made.
    ///   - decoder: A `JSONDecoder` instance used to decode the response.
    /// - Returns: A decoded object of the specified type conforming to `Decodable`.
    /// - Throws: An error if the request fails or the decoding process encounters an issue.
    func request<Response: Decodable>(request: any APIRequest, decoder: JSONDecoder) async throws -> Response
    
    /// Performs a network request and decodes the response into a specified `Decodable` type using the default `JSONDecoder`.
    ///
    /// - Parameter request: An object conforming to `APIRequest` protocol, representing the request to be made.
    /// - Returns: A decoded object of the specified type conforming to `Decodable`.
    /// - Throws: An error if the request fails or the decoding process encounters an issue.
    func request<Response: Decodable>(_ request: any APIRequest) async throws -> Response
}

public extension Networking {
    func request<Response: Decodable>(_ request: any APIRequest) async throws -> Response {
        return try await self.request(request: request, decoder: JSONDecoder())
    }
}
