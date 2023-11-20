//
//  APIComponents.swift
//  Data
//
//  Created by 김도형 on 11/20/23.
//

import Foundation

import Domain

enum APIComponents {
    enum HTTPMethod: String {
        case get = "GET"
        case post = "POST"
        case delete = "DELETE"
        case put = "PUT"
    }
    
    static func requset(url: URL, httpMethod: HTTPMethod, body: Encodable? = nil) -> URLRequest {
        var request: URLRequest = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        
        if let body {
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = try? JSONEncoder().encode(body)
        }
        
        return request
    }
    
    static func urlSessionHandling(request: URLRequest) async throws -> Data {
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.unknown(nil)
        }
        
        guard (200...204).contains(httpResponse.statusCode) else {
            switch httpResponse.statusCode {
            case 400:
                throw APIError.invalidURL400
            case 404:
                throw APIError.invalidRequest404
            case 500...505:
                throw APIError.internalServerError500
            default:
                throw APIError.unknown(httpResponse.statusCode)
            }
        }
        
        return data
    }
    
    static var jsonDecoder: JSONDecoder {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        
        let decoder: JSONDecoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        return decoder
    }
}
