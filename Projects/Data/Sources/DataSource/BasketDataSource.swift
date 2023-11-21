//
//  BasketDataSource.swift
//  Data
//
//  Created by 김도형 on 11/21/23.
//

import Foundation

public protocol BasketDataSourceInterface {
    func fetchBasket() async throws -> BasketDTO
}

public final class BasketDataSource: BasketDataSourceInterface {
    public init() {}
    
    public func fetchBasket() async throws -> BasketDTO {
        let request: URLRequest = APIComponents.requset(url: APIEndpoints.fetchBasket.url, httpMethod: .get)
        let data: Data = try await APIComponents.urlSessionHandling(request: request)
        let decoder: JSONDecoder = APIComponents.jsonDecoder
        
        return try decoder.decode(BasketDTO.self, from: data)
    }
}
