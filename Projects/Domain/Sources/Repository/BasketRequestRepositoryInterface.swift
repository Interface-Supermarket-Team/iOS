//
//  BasketRequestRepositoryInterface.swift
//  Domain
//
//  Created by 김도형 on 11/21/23.
//

import Foundation

public protocol BasketRequestRepositoryInterface {
    func sendBasketRequest(product: BasketRequest.Product, cnt: Int, price: Int, completion: @escaping (Result<Data, APIError>) -> Void) async
}
