//
//  ProductDetail.swift
//  Domain
//
//  Created by 김도형 on 11/21/23.
//

import Foundation

public struct ProductDetail {
    public let id: Int
    public let name: String
    public let category: String
    public let price: Int
    public let image: String
    public let intro: String
    public let spicy: [Spicy]
    public let options: [Option]
    
    public init(id: Int, name: String, category: String, price: Int, image: String, intro: String, spicy: [Spicy], options: [Option]) {
        self.id = id
        self.name = name
        self.category = category
        self.price = price
        self.image = image
        self.intro = intro
        self.spicy = spicy
        self.options = options
    }
}

extension ProductDetail {
    public struct Spicy: Codable, Identifiable {
        public let id: Int
        public let intro: String
        public let level: String
    }
}

extension ProductDetail {
    public struct Option: Codable, Identifiable {
        public let id: Int
        public let name: String
        public let item: [Item]
        
        public struct Item: Codable, Identifiable {
            public let id: Int
            public let name: String
        }
    }
}

public extension ProductDetail {
    static let sample: ProductDetail = .init(id: 1,
                                             name: "떡갈비 완자",
                                             category: "분식",
                                             price: 1500,
                                             image: "https://github.com/Interface-Supermarket-Team/backend/blob/main/food.png?raw=false",
                                             intro: "전주 한옥마을의 유명한 떡갈비 완자",
                                             spicy: [
                                                .init(id: 1, intro: "아기도 먹을 수 있어요", level: "순한맛"),
                                                .init(id: 2, intro: "신라면모다 안매워요", level: "보통맛"),
                                                .init(id: 3, intro: "핵불딝볶음면 맛", level: "매운맛")
                                             ],
                                             options: [
                                                .init(id: 1, name: "소스 선택", item: [
                                                    .init(id: 1, name: "데리야끼 소스"),
                                                    .init(id: 2, name: "칠리 소스"),
                                                    .init(id: 3, name: "불닭 소스")
                                                ]),
                                                .init(id: 2, name: "추가", item: [
                                                    .init(id: 1, name: "모짜렐라 치즈"),
                                                    .init(id: 2, name: "슈레드 치즈")
                                                ])
                                             ])
}
