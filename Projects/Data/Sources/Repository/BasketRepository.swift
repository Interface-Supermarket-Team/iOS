//
//  BasketRepository.swift
//  Data
//
//  Created by 김도형 on 11/21/23.
//

import Foundation

import Domain

public final class BasketRepository: BasketRepositoryInterface {
    private let dataSource: BasketDataSourceInterface
    
    public init (dataSource: BasketDataSource) {
        self.dataSource = dataSource
    }
    
    public func fetchBasket(completion: @escaping (Result<Basket, APIError>) -> Void) async {
        do {
            let entity = try await dataSource.fetchBasket().toEntity()
            completion(.success(entity))
        } catch {
            completion(.failure(APIErrorDTO.convert(error: error)))
        }
    }
}
