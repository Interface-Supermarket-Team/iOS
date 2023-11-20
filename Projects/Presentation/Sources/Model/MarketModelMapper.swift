//
//  MarketModelMapper.swift
//  Presentation
//
//  Created by 김도형 on 11/20/23.
//

import Foundation

import Domain

struct MarketModelMapper {
    static func toMarketModel(entity: Market?) -> MarketModel? {
        guard let entity else {
            return nil
        }
        
        return .init(id: entity.id, name: entity.name, info: entity.info, category: entity.category)
    }
}
