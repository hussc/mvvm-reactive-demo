//
//  RegisterViewController.swift
//  MVVM-Demo
//
//  Created by Hussein AlRyalat on 10/12/2022.
//

import UIKit
import RxSwift
import RxCocoa

class RegisterViewController: UIViewController {
    private let contentView: RegisterContentView
    private let viewModel: RegisterViewModel
    private let disposeBag: DisposeBag
    
    init(viewModel: RegisterViewModel) {
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
extension RegisterViewController {
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
        contentView.backButton.rx.tap.bind(to: viewModel.onBack.inputs).disposed(by: disposeBag)
        
        let inputObs = Observable.combineLatest(
            contentView.emailTextField.rx.text.orEmpty,
            contentView.passwordTextField.rx.text.orEmpty,
            contentView.ageTextField.rx.text.orEmpty.compactMap(Int.init),
            contentView.nameTextField.rx.text.orEmpty
        ).map {
            RegisterationRequestInput(name: $3, age: $2, password: $1, email: $0)
        }
        
        contentView.registerButton.rx.tap
            .withLatestFrom(inputObs)
            .bind(to: viewModel.registerAction.inputs)
            .disposed(by: disposeBag)
    }
}
