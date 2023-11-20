//
//  ProductCategoryDataSource.swift
//  Data
//
//  Created by 김도형 on 11/21/23.
//

import Foundation

public protocol ProductCategoryDataSourceInterface {
    func fetchCategories() async throws -> [ProductCategoryDTO]
}

public final class ProductCategoryDataSource: ProductCategoryDataSourceInterface {
    public init() {}
    
    public func fetchCategories() async throws -> [ProductCategoryDTO] {
        let request: URLRequest = APIComponents.requset(url: APIEndpoints.fetchCategoryAll.url, httpMethod: .get)
        let data: Data = try await APIComponents.urlSessionHandling(request: request)
        let decoder: JSONDecoder = APIComponents.jsonDecoder
        
        return try decoder.decode([ProductCategoryDTO].self, from: data)
    }
}
