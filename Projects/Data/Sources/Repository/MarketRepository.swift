//
//  MarketRepository.swift
//  Data
//
//  Created by 김도형 on 11/20/23.
//

import Foundation

import Domain

public final class MarketRepository: MarketRepositoryInterface {
    private let dataSource: MarketDataSourceInterface
    
    public init(dataSource: MarketDataSourceInterface) {
        self.dataSource = dataSource
    }
    
    public func fetchMarket(id: Int, completion: @escaping (Result<Market, APIError>) -> Void) async {
        do {
            let entity = try await dataSource.fetchMarket(id: id).toEntity()
            completion(.success(entity))
        } catch {
            completion(.failure(APIErrorDTO.convert(error: error)))
        }
    }
}
