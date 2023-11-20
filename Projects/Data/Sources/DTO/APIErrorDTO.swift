//
//  APIErrorDTO.swift
//  Data
//
//  Created by 김도형 on 11/20/23.
//

import Foundation

import Domain

enum APIErrorDTO {
    static func convert(error: Error) -> APIError {
        switch error {
        case is APIError:
            return error as! APIError
        case is DecodingError:
            return .jsonDecodingError
        case is EncodingError:
            return .jsonEncodingError
        default:
            print(error)
            return .unknown(nil)
        }
    }
}
