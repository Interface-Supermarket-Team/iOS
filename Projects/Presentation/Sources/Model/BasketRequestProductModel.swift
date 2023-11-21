//
//  BasketRequestProductModel.swift
//  Presentation
//
//  Created by 김도형 on 11/21/23.
//

import Foundation

public struct BasketRequestProductModel {
    public let id: Int
    public let spicy: Spicy?
    public let options: [Option]?
}

extension BasketRequestProductModel {
    public struct Spicy {
        public let id: Int
        public let level: String
        public let intro: String
    }
}

extension BasketRequestProductModel {
    public struct Option {
        public let id: Int
        public let name: String
        public let selected: String
    }
}
