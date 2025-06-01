//
//  NetworkClient.swift
//  Networking
//
//  Created by Nalou Nguyen on 2/6/25.
//

import Foundation
import Alamofire

public class NetworkClient: Networking {
    
    // MARK: - Properties
    private var hostDomain: String
    private var session: Session
    
    // MARK: - Initializers
    public init?() {
        let container = NetworkDependencyContainer.shared
        guard let config = container.makeConfigProvider() else {
            return nil
        }
        self.hostDomain = config.endPoint
        
        let configuration = URLSessionConfiguration.default
        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        configuration.urlCache = nil
        configuration.timeoutIntervalForRequest = config.apiCallTimeout
        let networkMonitor = NetworkEventMonitor(logger: NetworkLogger.network)
        let interceptor = NetworkInterceptor(
            retryLimit: config.retryAPICount,
            retryDelay: config.retryDelay,
            defaultHeader: container.makeCommonHeaderProvider()
        )
        
        self.session = Session(
            configuration: configuration,
            interceptor: interceptor,
            eventMonitors: [networkMonitor]
        )
    }
    
    // MARK: - Networking
    
    public func request(_ request: any APIRequest) async -> Result<APIResponse, APIError> {
        await withCheckedContinuation { continuation in
            self.request(request, completion: { result in
                continuation.resume(returning: result)
            })
        }
    }
    
    public func request<Response: Decodable>(request: any APIRequest, decoder: JSONDecoder = JSONDecoder()) async throws -> Response {
        
        let result = await self.request(request)
        
        switch result {
        case let .success(dataResponse):
            do {
                let responseObject = try decoder.decode(Response.self, from: dataResponse.data ?? Data())
                return responseObject
            }
            catch let error as DecodingError {
                NetworkLogger.network.error("❌ Decoding error: \(error)")
                throw APIError.internalError(error: .parsing(error: error))
            }
            catch {
                throw APIError.unknown
            }
        case let .failure(apiError):
            throw apiError
        }
    }
    
    public func request(_ request: APIRequest, completion: @escaping (Result<APIResponse, APIError>) -> Void) {
        
        // APIRequest to URLRequest
        let urlRequest = request.toURLRequest(hostDomain)
        guard let urlRequest else {
            let apiError = APIError.networkError(type: .invalidEndpoint)
            completion(.failure(apiError))
            return
        }
        
        session
            .request(urlRequest)
            .validate(statusCode: 200..<300)
            .response { dataResponse in
                switch dataResponse.result {
                case .success(let data):
                    guard let httpResponse = dataResponse.response else {
                        completion(.failure(.unknown))
                        return
                    }
                    let statusCode = httpResponse.statusCode
                    completion(.success((data, statusCode)))
                case .failure(let afError):
                    do {
                        if let apiError = APIError.map(from: afError) {
                            completion(.failure(apiError))
                            return
                        }
    
                        guard let errorData = dataResponse.data else {
                            let info = ErrorResponse(message: afError.errorDescription ?? "")
                            completion(.failure(.severError(error: info)))
                            return
                        }
                        
                        let info = try JSONDecoder().decode(ErrorResponse.self, from: errorData)
                        completion(.failure(.severError(error: info)))
                    }
                    catch let error as DecodingError {
                        NetworkLogger.network.error("❌ Decoding error: \(error)")
                        let apiError = APIError.internalError(error: .parsing(error: error))
                        completion(.failure(apiError))
                    }
                    catch {
                        let info = ErrorResponse(message: afError.errorDescription ?? "")
                        completion(.failure(.severError(error: info)))
                    }
                }
            }
    }
}
