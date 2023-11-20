//
//  ProductCategoryRepository.swift
//  Data
//
//  Created by 김도형 on 11/21/23.
//

import Foundation

import Domain

public final class ProductCategoryRepository: ProductCategoryRepositoryInterface {
    private let dataSource: ProductCategoryDataSourceInterface
    
    public init(dataSource: ProductCategoryDataSourceInterface) {
        self.dataSource = dataSource
    }
    
    public func fetchCategories(completion: @escaping (Result<[ProductCategory], APIError>) -> Void) async {
        do {
            let entity = try await dataSource.fetchCategories().map {productCategoryDTO in
                return productCategoryDTO.toEntity()
            }
            completion(.success(entity))
        } catch {
            completion(.failure(APIErrorDTO.convert(error: error)))
        }
    }
}
