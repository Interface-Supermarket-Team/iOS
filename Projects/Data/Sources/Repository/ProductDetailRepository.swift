//
//  ProductDetailRepository.swift
//  Data
//
//  Created by 김도형 on 11/21/23.
//

import Foundation

import Domain

public final class ProductDetailRepository: ProductDetailRepositoryInterface {
    private let dataSource: ProductDetailDataSource
    
    public init(dataSource: ProductDetailDataSource) {
        self.dataSource = dataSource
    }
    
    public func fetchProductDetail(id: Int, completion: @escaping (Result<ProductDetail, APIError>) -> Void) async {
        do {
            let entity = try await dataSource.fetchProductDetail(id: id).toEntity()
            completion(.success(entity))
        } catch {
            completion(.failure(APIErrorDTO.convert(error: error)))
        }
    }
}
