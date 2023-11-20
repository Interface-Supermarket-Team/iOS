//
//  CategoryUseCase.swift
//  Domain
//
//  Created by 김도형 on 11/21/23.
//

import Foundation

public protocol ProductCategoryUseCaseInterface {
    func fetchCategories(completion: @escaping (Result<[ProductCategory], APIError>) -> Void) async
}

public final class ProductCategoryUseCase: ProductCategoryUseCaseInterface {
    private let repository: ProductCategoryRepositoryInterface
    
    public init(repository: ProductCategoryRepositoryInterface) {
        self.repository = repository
    }
    
    public func fetchCategories(completion: @escaping (Result<[ProductCategory], APIError>) -> Void) async {
        await self.repository.fetchCategories(completion: completion)
    }
}
