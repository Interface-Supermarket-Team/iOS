//
//  MarketUseCase.swift
//  Domain
//
//  Created by 김도형 on 11/20/23.
//

import Foundation

public protocol MarketUseCaseInterface {
    func fetchMarket(id: Int, completion: @escaping (Result<Market?, APIError>) -> Void) async
}

public final class MarketUseCase: MarketUseCaseInterface {
    private let repository: MarketRepositoryInterface
    
    public init(repository: MarketRepositoryInterface) {
        self.repository = repository
    }
    
    public func fetchMarket(id: Int, completion: @escaping (Result<Market?, APIError>) -> Void) async {
        await self.repository.fetchMarket(id: id, completion: completion)
    }
}
