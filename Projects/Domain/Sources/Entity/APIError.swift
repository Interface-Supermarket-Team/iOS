//
//  APIError.swift
//  Domain
//
//  Created by 김도형 on 11/20/23.
//

import Foundation

public enum APIError: Error {
    case invalidURL400
    case invalidRequest404
    case internalServerError500
    case jsonEncodingError
    case jsonDecodingError
    case unknown(Int?)
}
