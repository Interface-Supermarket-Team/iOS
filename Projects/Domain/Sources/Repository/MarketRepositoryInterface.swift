//
//  MarketRepositoryInterface.swift
//  Domain
//
//  Created by 김도형 on 11/20/23.
//

import Foundation

public protocol MarketRepositoryInterface {
    func fetchMarket(id: Int, completion: @escaping (Result<Market?, APIError>) -> Void) async
}
