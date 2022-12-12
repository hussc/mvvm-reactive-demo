//
//  ResponseError.swift
//  MVVM-Demo
//
//  Created by Hussein AlRyalat on 10/12/2022.
//

import Foundation

struct ResponseError: LocalizedError, ExpressibleByStringLiteral, Codable {
    
    let message: String
    
    var errorDescription: String? {
        message
    }
    
    init(stringLiteral value: StringLiteralType) {
        self.message = value
    }
    
    init(unicodeScalarLiteral value: String) {
        self.message = value
    }
    
    init(extendedGraphemeClusterLiteral value: String) {
        self.message = value
    }
}
