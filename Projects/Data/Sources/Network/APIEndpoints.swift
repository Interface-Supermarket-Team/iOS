//
//  APIEndpoints.swift
//  Data
//
//  Created by 김도형 on 11/20/23.
//

import Foundation

enum APIEndpoints {
    case fetchMarket(Int)
    case fetchProduct(String)
    case fetchProductAll
    case fetchProductMain
    case fetchProductCategory(String)
    case fetchCategoryAll
    
    var url: URL {
        var serverURL: URLComponents = URLComponents(string: "http://34.127.76.250:3000")!
        
        switch self {
        case .fetchMarket(let id):
            serverURL.path = "/market/\(id)"
            break
        case .fetchProduct(let name):
            serverURL.path = "/product/\(name)"
            break
        case .fetchProductAll:
            serverURL.path = "/product/all"
            break
        case .fetchProductMain:
            serverURL.path = "/product/main"
            break
        case .fetchProductCategory(let name):
            serverURL.path = "/product/category/\(name)"
            break
        case .fetchCategoryAll:
            serverURL.path = "/category/all"
            break
        }
        
        return serverURL.url!
    }
}
