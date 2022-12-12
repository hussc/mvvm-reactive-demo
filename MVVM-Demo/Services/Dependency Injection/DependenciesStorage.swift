//
//  DependenciesStorage.swift
//  MVVM-Demo
//
//  Created by Hussein AlRyalat on 10/12/2022.
//

import Foundation

struct DependenciesStorage {
    private static var current: DependenciesStorage = .init()
    
    static subscript<K>(key: K.Type) -> K.ProviderType where K : DependencyKey {
        get { key.current }
        set { key.current = newValue }
    }
    
    static subscript<P>(_ keyPath: WritableKeyPath<DependenciesStorage, P>) -> P {
        get { current[keyPath: keyPath] }
        set { current[keyPath: keyPath] = newValue }
    }
}

extension DependenciesStorage {
    var preferencesStorage: PreferencesStorageProtocol {
        get { Self[PreferencesStorageKey.self] }
        set { Self[PreferencesStorageKey.self] = newValue }
    }
    
    var authenticationService: AuthenticationService {
        get { Self[AuthenticationServiceKey.self] }
        set { Self[AuthenticationServiceKey.self] = newValue }
    }
}

private struct PreferencesStorageKey: DependencyKey {
    static var current: PreferencesStorageProtocol = UserDefaultsStorage()
}

private struct AuthenticationServiceKey: DependencyKey {
    static var current: AuthenticationService = DefaultAuthenticationService()
}
