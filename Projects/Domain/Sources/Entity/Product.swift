//
//  Product.swift
//  Domain
//
//  Created by 김도형 on 11/20/23.
//

import Foundation

import DesignSystem

public struct Product {
    public let id: Int
    public let name: String
    public let category: String
    public let price: Int
    public let image: String?
    public let intro: String
    
    public init(id: Int, name: String, category: String, price: Int, image: String?, intro: String) {
        self.id = id
        self.name = name
        self.category = category
        self.price = price
        self.image = image
        self.intro = intro
    }
}

public extension Product {
    static let samples: [Product] = [
        .init(id: 1, 
              name: "떡갈비 완자",
              category: "분식",
              price: 1500,
              image: "https://github.com/Interface-Supermarket-Team/backend/blob/main/food.png?raw=false",
              intro: "전주 한옥마을의 유명한 떡갈비 완자"),
        .init(id: 2,
              name: "야채곱창",
              category: "분식",
              price: 3500,
              image: "https://github.com/Interface-Supermarket-Team/backend/blob/main/food.png?raw=false",
              intro: "델리곱창"),
        .init(id: 3,
              name: "치킨갈비",
              category: "분식",
              price: 1500,
              image: "https://github.com/Interface-Supermarket-Team/backend/blob/main/food.png?raw=false",
              intro: ""),
        .init(id: 4,
              name: "고기찜맛바",
              category: "분식",
              price: 1500,
              image: "https://github.com/Interface-Supermarket-Team/backend/blob/main/food.png?raw=false",
              intro: ""),
        .init(id: 5,
              name: "불고기 소세지",
              category: "분식",
              price: 1500,
              image: "https://github.com/Interface-Supermarket-Team/backend/blob/main/food.png?raw=false",
              intro: ""),
        .init(id: 6,
              name: "치킨바",
              category: "분식",
              price: 1000,
              image: nil,
              intro: "")
    ]
}
