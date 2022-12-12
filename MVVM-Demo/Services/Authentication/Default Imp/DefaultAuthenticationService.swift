//
//  DefaultAuthenticationService.swift
//  MVVM-Demo
//
//  Created by Hussein AlRyalat on 10/12/2022.
//

import Foundation
import UIKit
import RxSwift
import RxRelay

class DefaultAuthenticationService: AuthenticationService {
    @Dependency(\.preferencesStorage) var preferencesStorage
    
    private var disposeBag: DisposeBag = .init()
    private var _isAuthenticated: PublishSubject<Bool> = .init()
    
    var isAuthenticated: Observable<Bool> {
        _isAuthenticated.asObservable()
    }
    
    private(set) lazy var userSession: BehaviorRelay<UserSessionResponse?> = .init(value: preferencesStorage.retrive(forKey: Self.userSessionKey))
    
    init() {
        userSession.subscribe(onNext: {
            self._isAuthenticated.onNext($0 == nil)
        }).disposed(by: disposeBag)
    }
    
    func login(with userSession: UserSessionResponse) -> Observable<Void> {
        Observable.create { subscribe in
            guard self.userSession.value == nil else {
                subscribe.onError("User is already logged in" as ResponseError)
                return Disposables.create()
            }
            
            self.preferencesStorage.update(value: userSession, forKey: Self.userSessionKey)

            subscribe.onNext(())
            subscribe.onCompleted()
            return Disposables.create()
        }
    }
    
    func logout() -> Observable<Void> {
        Observable.create { subscribe in
            guard self.userSession.value != nil else {
                subscribe.onError("No user is found for logout" as ResponseError)
                return Disposables.create()
            }
            
            self.preferencesStorage.update(value: nil, forKey: Self.userSessionKey)
            
            subscribe.onNext(())
            subscribe.onCompleted()
            return Disposables.create()
        }
    }
}

extension DefaultAuthenticationService {
    private static var userSessionKey: PreferenceKey<UserSessionResponse> = "user.session"
}
