//
//  ProductDetailUseCase.swift
//  Domain
//
//  Created by 김도형 on 11/21/23.
//

import Foundation

public protocol ProductDetailUseCaseInterface {
    func fetchProductDetail(id: Int, completion: @escaping (Result<ProductDetail, APIError>) -> Void) async
}

public final class ProductDetailUseCase: ProductDetailUseCaseInterface {
    private let repository: ProductDetailRepositoryInterface
    
    public init(repository: ProductDetailRepositoryInterface) {
        self.repository = repository
    }
    
    public func fetchProductDetail(id: Int, completion: @escaping (Result<ProductDetail, APIError>) -> Void) async {
        await self.repository.fetchProductDetail(id: id, completion: completion)
    }
}
