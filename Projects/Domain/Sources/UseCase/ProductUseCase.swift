//
//  ProductUseCase.swift
//  Domain
//
//  Created by 김도형 on 11/20/23.
//

import Foundation

public protocol ProductUseCaseInterface {
    func fetchProducts(completion: @escaping (Result<[Product], APIError>) -> Void) async
    func fetchMainProducts(completion: @escaping (Result<[Product], APIError>) -> Void) async
    func fetchProductsCategory(name: String, completion: @escaping (Result<[Product], APIError>) -> Void) async
}

public final class ProductUseCase: ProductUseCaseInterface {
    private let repository: ProductRepositoryInterface
    
    public init(repository: ProductRepositoryInterface) {
        self.repository = repository
    }
    
    public func fetchProducts(completion: @escaping (Result<[Product], APIError>) -> Void) async {
        await self.repository.fetchProducts(completion: completion)
    }
    
    public func fetchMainProducts(completion: @escaping (Result<[Product], APIError>) -> Void) async {
        await self.repository.fetchMainProducts(completion: completion)
    }
    
    public func fetchProductsCategory(name: String, completion: @escaping (Result<[Product], APIError>) -> Void) async {
        await self.repository.fetchProductsCategory(name: name, completion: completion)
    }
}
