//
//  APIEndpoints.swift
//  Data
//
//  Created by 김도형 on 11/20/23.
//

import Foundation

enum APIEndpoints {
    case fetchMarket(Int)
    
    var url: URL {
        var serverURL: URLComponents = URLComponents(string: "http:34.127.76.250:3000")!
        
        switch self {
        case .fetchMarket(let id):
            serverURL.path = "/market/\(id)"
            break
        }
        
        return serverURL.url!
    }
}
