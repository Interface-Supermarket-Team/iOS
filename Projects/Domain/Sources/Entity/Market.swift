//
//  Market.swift
//  Domain
//
//  Created by 김도형 on 11/20/23.
//

import Foundation

public struct Market {
    public init(id: Int, name: String, info: String, category: String) {
        self.id = id
        self.name = name
        self.info = info
        self.category = category
    }
    
    public let id: Int
    public let name: String
    public let info: String
    public let category: String
}

public extension Market {
    static let sample: Market = .init(id: 1, name: "꼬치집", info: "", category: "분식")
}
