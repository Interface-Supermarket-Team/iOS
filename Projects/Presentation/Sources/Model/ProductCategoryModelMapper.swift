//
//  ProductCategoryModelMapper.swift
//  Presentation
//
//  Created by 김도형 on 11/21/23.
//

import Foundation

import Domain

enum ProductCategoryModelMapper {
    static func toProductCategoryModel(entity: ProductCategory) -> ProductCategoryModel {
        return .init(id: entity.id, name: entity.name)
    }
}
