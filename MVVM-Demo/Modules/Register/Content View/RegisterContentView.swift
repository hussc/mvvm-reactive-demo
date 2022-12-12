//
//  RegisterContentView.swift
//  MVVM-Demo
//
//  Created by Hussein AlRyalat on 10/12/2022.
//

import UIKit

class RegisterContentView: UIView {

    @IBOutlet weak var backButton: SquareButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var nameTextField: DefaultTextField!
    @IBOutlet weak var ageTextField: DefaultTextField!
    @IBOutlet weak var emailTextField: DefaultTextField!
    @IBOutlet weak var passwordTextField: DefaultTextField!
    
    @IBOutlet weak var registerButton: PrimaryActionButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    private func setupUI() {
        ageTextField.placeholder = "input.age".localized
        nameTextField.placeholder = "input.name".localized
        emailTextField.placeholder = "input.email".localized
        passwordTextField.placeholder = "input.password".localized
    }
}
