//
//  PreferencesManagerProtocol.swift
//  MVVM-Demo
//
//  Created by Hussein AlRyalat on 10/12/2022.
//

import Foundation

/**
 Typed Keys for preferences,
 In short, associates the Type of the value stored with the key name.
 */
struct PreferenceKey<T>: ExpressibleByStringLiteral {
    typealias Key<T> = PreferenceKey<T>
    let key: String
    
    init(key: String) {
        self.key = key
    }
    
    init(stringLiteral value: StringLiteralType) {
        self.key = value
    }
    
    init(unicodeScalarLiteral value: String) {
        self.key = value
    }
    
    init(extendedGraphemeClusterLiteral value: String) {
        self.key = value
    }
}

protocol PreferencesStorageProtocol {
    func retrive<T>(forKey key: PreferenceKey<T>) -> T?
    func update<T>(value: T?, forKey key: PreferenceKey<T>)
}
