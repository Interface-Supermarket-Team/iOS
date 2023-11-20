//
//  Category.swift
//  Domain
//
//  Created by 김도형 on 11/21/23.
//

import Foundation

public struct ProductCategory {
    public let id: Int
    public let name: String
    
    public init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}

public extension ProductCategory {
    static let samples: [ProductCategory] = [
        .init(id: 1, name: "꼬치류"),
        .init(id: 2, name: "수제햄도그"),
        .init(id: 3, name: "수제닭강정"),
        .init(id: 4, name: "떡갈비완자")
    ]
}
