//
//  ProductDataSourceInterface.swift
//  Data
//
//  Created by 김도형 on 11/20/23.
//

import Foundation

public protocol ProductDataSourceInterface {
    func fetchProducts() async throws -> [ProductDTO]
    func fetchProduct(name: String) async throws -> ProductDTO
    func fetchMainProducts() async throws -> [ProductDTO]
    func fetchProductsCategory(name: String) async throws -> [ProductDTO]
}

public final class ProductDataSource: ProductDataSourceInterface {
    public init() {}
    
    public func fetchProducts() async throws -> [ProductDTO] {
        let request: URLRequest = APIComponents.requset(url: APIEndpoints.fetchProductAll.url, httpMethod: .get)
        let data: Data = try await APIComponents.urlSessionHandling(request: request)
        let decoder: JSONDecoder = APIComponents.jsonDecoder
        
        return try decoder.decode([ProductDTO].self, from: data)
    }
    
    public func fetchProduct(name: String) async throws -> ProductDTO {
        let request: URLRequest = APIComponents.requset(url: APIEndpoints.fetchProduct(name).url, httpMethod: .get)
        let data: Data = try await APIComponents.urlSessionHandling(request: request)
        let decoder: JSONDecoder = APIComponents.jsonDecoder
        
        return try decoder.decode(ProductDTO.self, from: data)
    }
    
    public func fetchMainProducts() async throws -> [ProductDTO] {
        let request: URLRequest = APIComponents.requset(url: APIEndpoints.fetchProductMain.url, httpMethod: .get)
        let data: Data = try await APIComponents.urlSessionHandling(request: request)
        let decoder: JSONDecoder = APIComponents.jsonDecoder
        
        return try decoder.decode([ProductDTO].self, from: data)
    }
    
    public func fetchProductsCategory(name: String) async throws -> [ProductDTO] {
        let request: URLRequest = APIComponents.requset(url: APIEndpoints.fetchProductCategory(name).url, httpMethod: .get)
        let data: Data = try await APIComponents.urlSessionHandling(request: request)
        let decoder: JSONDecoder = APIComponents.jsonDecoder
        
        return try decoder.decode([ProductDTO].self, from: data)
    }
}
