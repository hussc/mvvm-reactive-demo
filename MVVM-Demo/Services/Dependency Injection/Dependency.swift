//
//  Dependency.swift
//  MVVM-Demo
//
//  Created by Hussein AlRyalat on 10/12/2022.
//

import Foundation

/**
 A readonly dependency property wrapper to retrive the current dependency of the specified type, doesn't allow modifying the dependency
 */
@propertyWrapper
struct Dependency<T> {
    private var keyPath: WritableKeyPath<DependenciesStorage, T>
    
    var wrappedValue: T {
        get { DependenciesStorage[keyPath] }
    }
    
    init(_ keyPath: WritableKeyPath<DependenciesStorage, T>) {
        self.keyPath = keyPath
    }
}
