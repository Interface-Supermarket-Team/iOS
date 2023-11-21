//
//  BasketRequestDTO.swift
//  Data
//
//  Created by 김도형 on 11/21/23.
//

import Foundation

import Domain

public struct BasketRequestDTO: Codable {
    public let product: Product
    public let cnt: Int
    public let price: Int
    
    static func toDataSource(product: BasketRequest.Product, cnt: Int, price: Int) -> Self {
        var spicy: BasketRequestDTO.Product.Spicy? {
            guard let spicy = product.spicy else {
                return nil
            }
            
            return .init(id: spicy.id, level: spicy.level, intro: spicy.intro)
        }
        var options: [BasketRequestDTO.Product.Option]? {
            guard let options = product.options else {
                return nil
            }
            
            return options.map { option in
                return .init(id: option.id, name: option.name, selected: option.selected)
            }
        }
        return .init(product: .init(id: product.id, spicy: spicy, options: options), cnt: cnt, price: price)
    }
}

extension BasketRequestDTO {
    public struct Product: Codable {
        public let id: Int
        public let spicy: Spicy?
        public let options: [Option]?
    }
}

extension BasketRequestDTO.Product {
    public struct Spicy: Codable {
        public let id: Int
        public let level: String
        public let intro: String
    }
}

extension BasketRequestDTO.Product {
    public struct Option: Codable {
        public let id: Int
        public let name: String
        public let selected: String
    }
}
