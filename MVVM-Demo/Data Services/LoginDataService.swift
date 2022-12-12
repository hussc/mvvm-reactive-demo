//
//  LoginService.swift
//  MVVM-Demo
//
//  Created by Hussein AlRyalat on 10/12/2022.
//

import Foundation
import RxSwift

struct LoginRequestInput: Encodable {
    let email: String
    let password: String
}

protocol LoginDataService: DataServiceProtocol {
    func login(with input: LoginRequestInput) -> Single<UserSessionResponse>
}
