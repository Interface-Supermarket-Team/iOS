//
//  ProductDetailModelMapper.swift
//  Presentation
//
//  Created by 김도형 on 11/21/23.
//

import Foundation

import Domain

enum ProductDetailModelMapper {
    static func toProductDetailModel(entity: ProductDetail) -> ProductDetailModel {
        return .init(id: entity.id,
                     name: entity.name,
                     category: entity.category,
                     price: entity.price,
                     image: entity.image,
                     intro: entity.intro, spicy: entity.spicy.map { spicy in
                        return .init(id: spicy.id, intro: spicy.intro, level: spicy.level)
                     },
                     options: entity.options.map { option in
                        return .init(id: option.id, name: option.name, item: option.item.map { item in
                            return .init(id: item.id, name: item.name)
                        })
                    })
    }
}
