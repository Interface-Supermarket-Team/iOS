//
//  BasketUseCase.swift
//  Domain
//
//  Created by 김도형 on 11/21/23.
//

import Foundation

public protocol BasketUseCaseInterface {
    func fetchBasket(completion: @escaping (Result<Basket, APIError>) -> Void) async
}

public final class BasketUseCase: BasketUseCaseInterface {
    private let repository: BasketRepositoryInterface
    
    public init(repository: BasketRepositoryInterface) {
        self.repository = repository
    }
    
    public func fetchBasket(completion: @escaping (Result<Basket, APIError>) -> Void) async {
        await self.repository.fetchBasket(completion: completion)
    }
}
