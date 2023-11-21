//
//  Basket.swift
//  Domain
//
//  Created by 김도형 on 11/21/23.
//

import Foundation

public struct Basket {
    public let product: [Product]
    public let totalprice: Int
    
    public init(product: [Product], totalPrice: Int) {
        self.product = product
        self.totalprice = totalPrice
    }
}

extension Basket {
    public struct Product: Codable {
        public let id: Int
        public let product: ProductItem
        public let cnt: Int
        public let price: Int
    }
}

extension Basket.Product {
    public struct ProductItem: Codable {
        public let id: Int
        public let name: String
        public let image: String
        public let intro: String
        public let price: Int
        public let spicy: Basket.Product.Spicy?
        public let options: [Basket.Product.Option]?
        public let category: String
        
        public init(id: Int, name: String, image: String, intro: String, price: Int, spicy: Basket.Product.Spicy?, options: [Basket.Product.Option]?, category: String) {
            self.id = id
            self.name = name
            self.image = image
            self.intro = intro
            self.price = price
            self.spicy = spicy
            self.options = options
            self.category = category
        }
    }
}

extension Basket.Product {
    public struct Spicy: Codable {
        public let id: Int
        public let intro: String
        public let level: String
        
        public init(id: Int, intro: String, level: String) {
            self.id = id
            self.intro = intro
            self.level = level
        }
    }
}

extension Basket.Product {
    public struct Option: Codable {
        public let id: Int
        public let name: String
        public let selected: String
        
        public init(id: Int, name: String, selected: String) {
            self.id = id
            self.name = name
            self.selected = selected
        }
    }
}
