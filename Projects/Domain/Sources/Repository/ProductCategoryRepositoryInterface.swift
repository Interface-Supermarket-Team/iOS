//
//  CategoryRepositoryInterface.swift
//  Domain
//
//  Created by 김도형 on 11/21/23.
//

import Foundation

public protocol ProductCategoryRepositoryInterface {
    func fetchCategories(completion: @escaping (Result<[ProductCategory], APIError>) -> Void) async
}
