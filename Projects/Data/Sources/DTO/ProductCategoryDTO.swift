//
//  CategoryDTO.swift
//  Data
//
//  Created by 김도형 on 11/21/23.
//

import Foundation

import Domain

public struct ProductCategoryDTO: Codable {
    public let id: Int
    public let name: String
    
    public func toEntity() -> ProductCategory {
        return .init(id: self.id, name: self.name)
    }
}
