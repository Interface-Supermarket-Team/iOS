//
//  ProductModel.swift
//  Presentation
//
//  Created by 김도형 on 11/20/23.
//

import Foundation

public struct ProductModel: Identifiable {
    public let id: Int
    public let name: String
    public let category: String
    public let price: Int
    public let image: String?
    public let intro: String
}
