//
//  ProductRepository.swift
//  Data
//
//  Created by 김도형 on 11/20/23.
//

import Foundation

import Domain

public final class ProductRepository: ProductRepositoryInterface {
    
    private let dataSource: ProductDataSourceInterface
    
    public init(dataSource: ProductDataSourceInterface) {
        self.dataSource = dataSource
    }
    
    public func fetchProducts(completion: @escaping (Result<[Product], APIError>) -> Void) async {
        do {
            let entity = try await dataSource.fetchProducts().map { productDTO in
                return productDTO.toEntity()
            }
            completion(.success(entity))
        } catch {
            completion(.failure(APIErrorDTO.convert(error: error)))
        }
    }
    
    public func fetchMainProducts(completion: @escaping (Result<[Product], APIError>) -> Void) async {
        do {
            let entity = try await dataSource.fetchMainProducts().map { productDTO in
                return productDTO.toEntity()
            }
            completion(.success(entity))
        } catch {
            completion(.failure(APIErrorDTO.convert(error: error)))
        }
    }
    
    public func fetchProductsCategory(name: String, completion: @escaping (Result<[Product], APIError>) -> Void) async {
        do {
            let entity = try await dataSource.fetchProductsCategory(name: name).map { productDTO in
                return productDTO.toEntity()
            }
            completion(.success(entity))
        } catch {
            completion(.failure(APIErrorDTO.convert(error: error)))
        }
    }
}
