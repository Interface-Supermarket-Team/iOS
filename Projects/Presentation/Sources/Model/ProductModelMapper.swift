//
//  ProductModelMapper.swift
//  Presentation
//
//  Created by 김도형 on 11/21/23.
//

import Foundation

import Domain

enum ProductModelMapper {
    static func toProductModels(entity: Product) -> ProductModel {
        return .init(id: entity.id,
                     name: entity.name,
                     category: entity.category,
                     price: entity.price,
                     image: entity.image,
                     intro: entity.intro)
    }
}
