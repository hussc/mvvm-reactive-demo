//
//  AuthenticationSessionService.swift
//  MVVM-Demo
//
//  Created by Hussein AlRyalat on 10/12/2022.
//

import Foundation
import RxSwift
import RxRelay

protocol AuthenticationService {
    var isAuthenticated: Observable<Bool> { get }
    
    var userSession: BehaviorRelay<UserSessionResponse?> { get }

    func login(with userSession: UserSessionResponse) -> Observable<Void>
    
    func logout() -> Observable<Void>
}
