//
//  UserSessionStore.swift
//  MVVM-Demo
//
//  Created by Hussein AlRyalat on 10/12/2022.
//

import Foundation
import RxSwift

/**
 Not thread safe
 */
final class LocalUserSessionStore: LoginDataService, RegisterDataService {
    private static var current: LocalUserSessionStore?
    
    private var key: String
    private var isDataLoaded = false
    private var sessions: [SavedSession] = []
    private var disposeBag: DisposeBag = .init()
    
    private var searchPath: URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
    
    private var delayInSeconds: RxTimeInterval {
        .seconds(Int.random(in: 0...2))
    }
    
    private var fileName: String {
        "sessions.json"
    }
    
    init(key: String) {
        assert(Self.current == nil, "Only one user session store must exist!")
        self.key = key
        Self.current = self
        loadInitialData()
    }
    
    func login(with input: LoginRequestInput) -> Single<UserSessionResponse> {
        let session = self.sessions.first { $0.email.lowercased() == input.email.lowercased() && $0.password == input.password }?.toUserSession(with: self.key)

        if let session {
            return .just(session).delay(delayInSeconds, scheduler: MainScheduler.instance)
        } else {
            return .error("Couldn't match the credentials with the sessions" as ResponseError)
        }
    }
    
    func register(with input: RegisterationRequestInput) -> Single<UserSessionResponse> {
        // do we have to do validation here?
        // I'll skip this for now
        if (sessions.contains { input.email == $0.email }) {
            return .error("User already exists, try to login instead" as ResponseError)
        }
        
        let newSession = SavedSession(input: input)
        self.sessions.append(newSession)
        
        return self.saveSessions().map {
            return newSession.toUserSession(with: self.key)
        }.asSingle()
    }
    
    func clear() {
        self.sessions = []
    }
    
    private func saveSessions() -> Observable<Void> {
        Observable.create { subscribe in
            let urlToWrite = self.searchPath.appendingPathComponent(self.fileName)
            
            do {
                let data = try JSONEncoder().encode(self.sessions)
                
                try data.write(to: urlToWrite)
                subscribe.onNext(())
                
                subscribe.onCompleted()
            } catch {
                subscribe.onError(error)
            }
            
            return Disposables.create()
        }
    }
    
    private func loadInitialData() {
        print(searchPath.absoluteString)

        do {
            let data = try Data(contentsOf: searchPath.appendingPathComponent(fileName))
            let sessions = try JSONDecoder().decode([SavedSession].self, from: data)
            self.sessions = sessions
            self.isDataLoaded = true
        } catch {
            print("Sessions failed to load: \(error.localizedDescription)")
            self.sessions = []
            self.isDataLoaded = true
        }
    }
}

extension LocalUserSessionStore {
    private struct SavedSession: Codable {
        let name: String
        let email: String
        let age: Int
        let password: String
        
        func toUserSession(with key: String) -> UserSessionResponse {
            .init(name: name, age: age, email: email, accessToken: key)
        }
        
        init(input: RegisterationRequestInput) {
            self.name = input.name
            self.email = input.email
            self.age = input.age
            self.password = input.password
        }
    }
}
