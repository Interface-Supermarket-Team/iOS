//
//  BasketRequestProductModelMapper.swift
//  Presentation
//
//  Created by 김도형 on 11/21/23.
//

import Foundation

import Domain

enum BasketRequestProductModelMapper {
    static func toBasketRequestProduct(model: BasketRequestProductModel) -> BasketRequest.Product {
        var spicy: BasketRequest.Product.Spicy? {
            guard let spicy = model.spicy else {
                return nil
            }
            
            return .init(id: spicy.id, level: spicy.level, intro: spicy.intro)
        }
        var options: [BasketRequest.Product.Option]? {
            guard let options = model.options else {
                return nil
            }
            
            return options.map { option in
                return .init(id: option.id, name: option.name, selected: option.selected)
            }
        }
        return .init(id: model.id, spicy: spicy, options: options)
    }
}
