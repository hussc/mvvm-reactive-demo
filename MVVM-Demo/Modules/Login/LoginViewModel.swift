//
//  LoginViewModel.swift
//  MVVM-Demo
//
//  Created by Hussein AlRyalat on 10/12/2022.
//

import UIKit
import RxSwift
import RxCocoa
import Action

class LoginViewModel {
    private let loginService: LoginDataService
    private let disposeBag = DisposeBag()
    
    lazy var loginAction = Action<LoginRequestInput, UserSessionResponse> { input in
        self.loginService.login(with: input)
    }
    
    var registerAction: CocoaAction
    
    init(loginService: LoginDataService, onRegister: CocoaAction) {
        self.loginService = loginService
        self.registerAction = onRegister
        
        loginAction
            .executionObservables
            .take(1)
            .subscribe(onNext: { output in
                print(output)
            }).disposed(by: disposeBag)
        
        loginAction.errors.subscribe(onNext: {
            print("Error: \($0)")
        }).disposed(by: disposeBag)
    }
}
