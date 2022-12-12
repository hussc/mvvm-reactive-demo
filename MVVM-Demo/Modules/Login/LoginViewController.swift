//
//  LoginViewController.swift
//  MVVM-Demo
//
//  Created by Hussein AlRyalat on 10/12/2022.
//

import UIKit
import RxSwift
import RxCocoa

class LoginViewController: UIViewController {
    
    private let contentView: LoginContentView
    private let viewModel: LoginViewModel
    private let disposeBag: DisposeBag

    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        self.contentView = .fromNib()
        self.disposeBag = .init()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupBindings()
    }
}

// MARK: Setup
extension LoginViewController {
    private func setupView() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupBindings() {
        contentView.registerButton.rx.tap.bind(to: viewModel.registerAction.inputs)
            .disposed(by: disposeBag)
        
        let inputObs = Observable.combineLatest(contentView.emailTextField.rx.text.orEmpty, contentView.passwordTextField.rx.text.orEmpty)
            .map { LoginRequestInput(email: $0, password: $1) }
        
        contentView.loginButton.rx.tap
            .withLatestFrom(inputObs)
            .bind(to: viewModel.loginAction.inputs)
            .disposed(by: disposeBag)
    }
}
