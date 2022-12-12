//
//  Application.swift
//  MVVM-Demo
//
//  Created by Hussein AlRyalat on 10/12/2022.
//

import Foundation
import UIKit
import RxSwift
import Action

final class Application {
    let window: UIWindow
    let dataStore: DataStoresContainerProtocol
    
    private var currentNavigationController: UINavigationController?
    private var disposeBag: DisposeBag
    
    @Dependency(\.authenticationService) var authenticationService
    @Dependency(\.preferencesStorage) var preferencesStorage
    
    init(window: UIWindow, dataStore: DataStoresContainerProtocol) {
        self.window = window
        self.dataStore = dataStore
        self.disposeBag = .init()
    }
    
    func start() {
        window.rootViewController = makeRootViewController()
        window.makeKeyAndVisible()
    }
    
    func registerServices() {
        authenticationService.userSession.subscribe(onNext: { session in
            
            if let session {
                
            } else {
                
            }
            
        }).disposed(by: disposeBag)
    }
}

extension Application {
    func makeRootViewController() -> UIViewController {
        let newLogin = makeLoginViewController()
        
        let navigationController = UINavigationController(rootViewController: newLogin)
        navigationController.setNavigationBarHidden(true, animated: false)
        
        /*
         Ops, we leaked something here :)
         */
        self.currentNavigationController = navigationController
        return navigationController
    }
    
    func makeLoginViewController() -> UIViewController {
        let loginViewModel = LoginViewModel(loginService: dataStore.loginDataService(), onRegister: CocoaAction { _ in
            
            let next = self.makeRegisterViewController()
            self.currentNavigationController?.pushViewController(next, animated: true)
            
            return Observable.empty()
        })
       
        return LoginViewController(viewModel: loginViewModel)
    }
    
    func makeRegisterViewController() -> UIViewController {
        let registerViewModel = RegisterViewModel(registerService: dataStore.registerDataService(), onBack: CocoaAction { _ in
            self.currentNavigationController?.popViewController(animated: true)
            return Observable.empty()
        })
        
        return RegisterViewController(viewModel: registerViewModel)
    }
    
    func makeFeedViewController() {
        
    }
}
