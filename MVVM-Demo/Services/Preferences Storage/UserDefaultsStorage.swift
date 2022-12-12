//
//  UserDefaultsStorage.swift
//  MVVM-Demo
//
//  Created by Hussein AlRyalat on 10/12/2022.
//

import Foundation

class UserDefaultsStorage: PreferencesStorageProtocol {
    
    let defaults = UserDefaults.standard
    
    func retrive<T>(forKey key: PreferenceKey<T>) -> T? {
        defaults.value(forKey: key.key) as? T
    }
    
    func update<T>(value: T?, forKey key: PreferenceKey<T>) {
        defaults.set(value, forKey: key.key)
    }
}
