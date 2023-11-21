//
//  BasketRequestRepository.swift
//  Data
//
//  Created by 김도형 on 11/21/23.
//

import Foundation

import Domain

public final class BasketRequestRepository: BasketRequestRepositoryInterface {
    private let dataSource: BasketRequestDataSource
    
    public init(dataSource: BasketRequestDataSource) {
        self.dataSource = dataSource
    }
    
    public func sendBasketRequest(product: BasketRequest.Product, cnt: Int, price: Int, completion: @escaping (Result<Data, APIError>) -> Void) async {
        do {
            let entity = try await dataSource.sendBasketRequest(basketRequest: BasketRequestDTO.toDataSource(product: product, cnt: cnt, price: price))
            completion(.success(entity))
        } catch {
            completion(.failure(APIErrorDTO.convert(error: error)))
        }
    }
}
