//
//  MarketDataSource.swift
//  Data
//
//  Created by 김도형 on 11/20/23.
//

import Foundation

public protocol MarketDataSourceInterface {
    func fetchMarket(id: Int) async throws -> MarkteDTO
}

public final class MarketDataSource: MarketDataSourceInterface {
    public init() {}
    
    public func fetchMarket(id: Int) async throws -> MarkteDTO {
        let request: URLRequest = APIComponents.requset(url: APIEndpoints.fetchMarket(id).url, httpMethod: .get)
        let data: Data = try await APIComponents.urlSessionHandling(request: request)
        let decoder: JSONDecoder = APIComponents.jsonDecoder
        
        return try decoder.decode(MarkteDTO.self, from: data)
    }
}
