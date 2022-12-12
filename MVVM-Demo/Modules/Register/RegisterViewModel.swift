//
//  RegisterViewModel.swift
//  MVVM-Demo
//
//  Created by Hussein AlRyalat on 10/12/2022.
//

import UIKit
import RxSwift
import Action

class RegisterViewModel {
    private let registerService: RegisterDataService
    private let disposeBag = DisposeBag()
    
    lazy var registerAction = Action<RegisterationRequestInput, UserSessionResponse> { input in
        self.registerService.register(with: input)
    }
    
    var onBack: CocoaAction
    
    init(registerService: RegisterDataService, onBack: CocoaAction) {
        self.registerService = registerService
        self.onBack = onBack
        
        
        registerAction
            .executionObservables
            .take(1)
            .subscribe(onNext: { output in
                print(output)
            }).disposed(by: disposeBag)
        
        registerAction.errors.subscribe(onNext: {
            print("Error: \($0)")
        }).disposed(by: disposeBag)
    }
}
