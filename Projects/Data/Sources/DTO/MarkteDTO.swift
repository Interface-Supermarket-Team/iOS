//
//  MarkteDTO.swift
//  Data
//
//  Created by 김도형 on 11/20/23.
//

import Foundation

import Domain

public struct MarkteDTO: Codable {
    public let id: Int
    public let name: String
    public let info: String
    public let category: String
    
    public func toEntity() -> Market {
        return .init(id: self.id, name: self.name, info: self.info, category: self.category)
    }
}
