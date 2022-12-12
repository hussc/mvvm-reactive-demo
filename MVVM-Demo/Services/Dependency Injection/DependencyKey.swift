//
//  DependencyKey.swift
//  MVVM-Demo
//
//  Created by Hussein AlRyalat on 10/12/2022.
//

import Foundation

/**
 Dependency in the demo application were made as simple as providing the current dependency within the implementation of one.
 
 The usage used here is very similar to EnvironmentValues in SwiftUI or in Services in Vapor (backend swift framework), but with simpler implementation.
 
 Typically, you provide keys that conform to **Dependency Key** instead of letting the concrete types conform so that the types are still isolated.
 */
protocol DependencyKey {
    associatedtype ProviderType
    
    static var current: ProviderType { get set }
}
