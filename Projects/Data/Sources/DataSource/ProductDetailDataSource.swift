//
//  ProductDetailDataSource.swift
//  Data
//
//  Created by 김도형 on 11/21/23.
//

import Foundation

public protocol ProductDetailDataSourceInterface {
    func fetchProductDetail(id: Int) async throws -> ProductDetailDTO
}

public final class ProductDetailDataSource: ProductDetailDataSourceInterface {
    public init() {}
    
    public func fetchProductDetail(id: Int) async throws -> ProductDetailDTO {
        let request: URLRequest = APIComponents.requset(url: APIEndpoints.fetchProductID(id).url, httpMethod: .get)
        let data: Data = try await APIComponents.urlSessionHandling(request: request)
        let decoder: JSONDecoder = APIComponents.jsonDecoder
        
        return try decoder.decode(ProductDetailDTO.self, from: data)
    }
}
