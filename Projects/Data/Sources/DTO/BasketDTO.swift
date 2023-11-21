//
//  BasketDTO.swift
//  Data
//
//  Created by 김도형 on 11/21/23.
//

import Foundation

import Domain

public struct BasketDTO: Codable {
    public let product: [Basket.Product]
    public let totalprice: Int
    
    public func toEntity() -> Basket {
        return .init(product: self.product, totalPrice: self.totalprice)
    }
}
