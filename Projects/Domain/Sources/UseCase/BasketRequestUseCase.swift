//
//  BasketRequestUseCase.swift
//  Domain
//
//  Created by 김도형 on 11/21/23.
//

import Foundation

public protocol BasketRequestUseCaseInterface {
    func sendBasketRequest(product: BasketRequest.Product, cnt: Int, price: Int, completion: @escaping (Result<Data, APIError>) -> Void) async
}

public final class BasketRequestUseCase: BasketRequestUseCaseInterface {
    private let repository: BasketRequestRepositoryInterface
    
    public init(repository: BasketRequestRepositoryInterface) {
        self.repository = repository
    }
    
    public func sendBasketRequest(product: BasketRequest.Product, cnt: Int, price: Int, completion: @escaping (Result<Data, APIError>) -> Void) async {
        await self.repository.sendBasketRequest(product: product, cnt: cnt, price: price, completion: completion)
    }
}
