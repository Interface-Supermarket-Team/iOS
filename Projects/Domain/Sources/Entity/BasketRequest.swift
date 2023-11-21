//
//  BasketRequest.swift
//  Domain
//
//  Created by 김도형 on 11/21/23.
//

import Foundation

public struct BasketRequest {
    public let product: Product
    public let cnt: Int
    public let price: Int
}

extension BasketRequest {
    public struct Product {
        public let id: Int
        public let spicy: Spicy?
        public let options: [Option]?
        
        public init(id: Int, spicy: Spicy?, options: [Option]?) {
            self.id = id
            self.spicy = spicy
            self.options = options
        }
    }
}

extension BasketRequest.Product {
    public struct Spicy {
        public let id: Int
        public let level: String
        public let intro: String
        
        public init(id: Int, level: String, intro: String) {
            self.id = id
            self.level = level
            self.intro = intro
        }
    }
}

extension BasketRequest.Product {
    public struct Option {
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
