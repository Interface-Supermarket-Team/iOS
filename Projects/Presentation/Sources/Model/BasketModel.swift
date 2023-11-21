//
//  BasketModel.swift
//  Presentation
//
//  Created by 김도형 on 11/21/23.
//

import Foundation

public struct BasketModel {
    public let product: [Product]
    public let totalprice: Int
    
    public init(product: [Product], totalPrice: Int) {
        self.product = product
        self.totalprice = totalPrice
    }
}

extension BasketModel {
    public struct Product: Codable {
        public let id: Int
        public let product: ProductItem
        public let cnt: Int
        public let price: Int
    }
}

extension BasketModel.Product {
    public struct ProductItem: Codable {
        public let id: Int
        public let name: String
        public let image: String
        public let intro: String
        public let price: Int
        public let spicy: BasketModel.Product.Spicy?
        public let options: [BasketModel.Product.Option]?
        public let category: String
        
        public init(id: Int, name: String, image: String, intro: String, price: Int, spicy: BasketModel.Product.Spicy?, options: [BasketModel.Product.Option]?, category: String) {
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

extension BasketModel.Product {
    public struct Spicy: Codable {
        public let id: Int
        public let level: String
        public let intro: String
        
        public init(id: Int, intro: String, level: String) {
            self.id = id
            self.intro = intro
            self.level = level
        }
    }
}

extension BasketModel.Product {
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
