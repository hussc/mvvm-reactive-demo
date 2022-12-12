//
//  RegisterDataService.swift
//  MVVM-Demo
//
//  Created by Hussein AlRyalat on 10/12/2022.
//

import Foundation
import RxSwift

struct RegisterationRequestInput: Encodable {
    let name: String
    let age: Int
    let password: String
    let email: String
}

protocol RegisterDataService: DataServiceProtocol {
    func register(with input: RegisterationRequestInput) -> Single<UserSessionResponse>
}
