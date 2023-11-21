//
//  BasketModelMapper.swift
//  Presentation
//
//  Created by 김도형 on 11/21/23.
//

import Foundation

import Domain

enum BasketModelMapper {
    static func toBasketModel(entity: Basket) -> BasketModel {
        
        return .init(product: entity.product.map({ product in
            var spicy: BasketModel.Product.Spicy? {
                guard let spicy = product.product.spicy else {
                    return nil
                }
                
                return .init(id: spicy.id, intro: spicy.intro, level: spicy.level)
            }
            
            var options: [BasketModel.Product.Option]? {
                guard let options = product.product.options else {
                    return nil
                }
                
                return options.map { option in
                    return .init(id: option.id, name: option.name, selected: option.selected)
                }
            }
            
            return .init(id: product.id, 
                         product: .init(id: product.product.id,
                                        name: product.product.name,
                                        image: product.product.image,
                                        intro: product.product.intro,
                                        price: product.product.price,
                                        spicy: spicy,
                                        options: options,
                                        category: product.product.category),
                         cnt: product.cnt,
                         price: product.price)
        }), totalPrice: entity.totalprice)
    }
}
