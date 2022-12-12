//
//  DataStoresContainer.swift
//  MVVM-Demo
//
//  Created by Hussein AlRyalat on 10/12/2022.
//

import Foundation

protocol DataStoresContainerProtocol {
    func loginDataService() -> LoginDataService
    
    func registerDataService() -> RegisterDataService
    
    func imagesFeedDataService() -> ImagesFeedDataService
}

class DefaultDataStoresContainer: DataStoresContainerProtocol {
    
    let userSessionsStore: LocalUserSessionStore
    let imagesStore: ImagesRestStore
    
    init(apiKey: String) {
        self.userSessionsStore = .init(key: apiKey)
        self.imagesStore = .init(key: apiKey)
    }
    
    func loginDataService() -> LoginDataService {
        return userSessionsStore
    }
    
    func registerDataService() -> RegisterDataService {
        return userSessionsStore
    }
    
    func imagesFeedDataService() -> ImagesFeedDataService {
        return imagesStore
    }
}
