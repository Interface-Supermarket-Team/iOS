//
//  MarketModelMapper.swift
//  Presentation
//
//  Created by 김도형 on 11/20/23.
//

import Foundation

import Domain

enum MarketModelMapper {
    static func toMarketModel(entity: Market) -> MarketModel {
        return .init(id: entity.id, name: entity.name, info: entity.info, category: entity.category)
    }
}
