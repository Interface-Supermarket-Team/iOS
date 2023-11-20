//
//  ProductDTO.swift
//  Data
//
//  Created by 김도형 on 11/20/23.
//

import Foundation

import Domain

public struct ProductDTO: Codable {
    public let id: Int
    public let name: String
    public let category: String
    public let price: Int
    public let image: String?
    public let intro: String
    
    public func toEntity() -> Product {
        return .init(id: self.id,
                     name: self.name, 
                     category: self.category,
                     price: self.price,
                     image: self.image,
                     intro: self.intro)
    }
}
