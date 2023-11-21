//
//  BasketRepositoryInterface.swift
//  Domain
//
//  Created by 김도형 on 11/21/23.
//

import Foundation

public protocol BasketRepositoryInterface {
    func fetchBasket(completion: @escaping (Result<Basket, APIError>) -> Void) async
}
