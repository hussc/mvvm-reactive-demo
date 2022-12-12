//
//  ValidationTextField.swift
//  MVVM-Demo
//
//  Created by Hussein AlRyalat on 10/12/2022.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class ValidationTextField: DefaultTextField {
    
    var validation: TextValidationProtocol? {
        didSet {
            self.updateValidation(validation)
        }
    }
    
    private let disposeBag = DisposeBag()
    
    private func updateValidation(_ validation: TextValidationProtocol?) {
    }
}
