//
//  ProductDetailModel.swift
//  Presentation
//
//  Created by 김도형 on 11/21/23.
//

import Foundation

public struct ProductDetailModel: Identifiable {
    public let id: Int
    public let name: String
    public let category: String
    public let price: Int
    public let image: String
    public let intro: String
    public let spicy: [Spicy]
    public let options: [Option]
}

extension ProductDetailModel {
    public struct Spicy: Identifiable {
        public init(id: Int, intro: String, level: String) {
            self.id = id
            self.intro = intro
            self.level = level
        }
        
        public let id: Int
        public let intro: String
        public let level: String
    }
}

extension ProductDetailModel {
    public struct Option: Identifiable {
        public init(id: Int, name: String, item: [Item]) {
            self.id = id
            self.name = name
            self.item = item
        }
        
        public let id: Int
        public let name: String
        public let item: [Item]
        
        public struct Item: Identifiable {
            public let id: Int
            public let name: String
        }
    }
}
