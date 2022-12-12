//
//  PixabayAPI.swift
//  MVVM-Demo
//
//  Created by Hussein AlRyalat on 10/12/2022.
//

import Foundation
import Moya

enum PiaxbayAPI: TargetType {
    case imageFeed(query: String, key: String)
    
    var baseURL: URL {
        URL(string: "https://pixabay.com/api/")!
    }
    
    var headers: [String : String]? {
        [:]
    }
    
    var path: String {
        switch self {
        case .imageFeed: return ""
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .imageFeed: return .get
        }
    }
    
    var task: Task {
        switch self {
        case .imageFeed(let query, let key):
            return .requestParameters(parameters: [
                "q": query,
                "key": key
            ], encoding: JSONEncoding.default)
        }
    }
}
