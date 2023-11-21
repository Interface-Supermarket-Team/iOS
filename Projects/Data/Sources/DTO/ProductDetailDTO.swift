//
//  ProductDetailDTO.swift
//  Data
//
//  Created by 김도형 on 11/21/23.
//

import Foundation

import Domain

public struct ProductDetailDTO: Codable {
    public let id: Int
    public let name: String
    public let category: String
    public let price: Int
    public let image: String
    public let intro: String
    public let spicy: [ProductDetail.Spicy]
    public let options: [ProductDetail.Option]
    
    public func toEntity() -> ProductDetail {
        return .init(id: self.id,
                     name: self.name,
                     category: self.category,
                     price: self.price,
                     image: self.image,
                     intro: self.intro,
                     spicy: self.spicy,
                     options: self.options)
    }
}
