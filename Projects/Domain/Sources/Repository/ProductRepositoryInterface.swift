//
//  ProductRepositoryInterface.swift
//  Domain
//
//  Created by 김도형 on 11/20/23.
//

import Foundation

public protocol ProductRepositoryInterface {
    func fetchProducts(completion: @escaping (Result<[Product], APIError>) -> Void) async
    func fetchProduct(name: String, completion: @escaping (Result<Product, APIError>) -> Void) async
    func fetchMainProducts(completion: @escaping (Result<[Product], APIError>) -> Void) async
    func fetchProductsCategory(name: String, completion: @escaping (Result<[Product], APIError>) -> Void) async
}
