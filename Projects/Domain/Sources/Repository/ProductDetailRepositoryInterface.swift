//
//  ProductDetailRepositoryInterface.swift
//  Domain
//
//  Created by 김도형 on 11/21/23.
//

import Foundation

public protocol ProductDetailRepositoryInterface {
    func fetchProductDetail(id: Int, completion: @escaping (Result<ProductDetail, APIError>) -> Void) async
}
