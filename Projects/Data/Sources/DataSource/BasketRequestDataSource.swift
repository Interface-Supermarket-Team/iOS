//
//  BasketRequestDataSource.swift
//  Data
//
//  Created by 김도형 on 11/21/23.
//

import Foundation

public protocol BasketRequestDataSourceInterface {
    func sendBasketRequest(basketRequest: BasketRequestDTO) async throws -> Data
}

public final class BasketRequestDataSource: BasketRequestDataSourceInterface {
    public init() {}
    
    public func sendBasketRequest(basketRequest: BasketRequestDTO) async throws -> Data {
        let request: URLRequest = APIComponents.requset(url: APIEndpoints.sendBasket.url, httpMethod: .post, body: basketRequest)
        let data: Data = try await APIComponents.urlSessionHandling(request: request)
        
        return data
    }
}
