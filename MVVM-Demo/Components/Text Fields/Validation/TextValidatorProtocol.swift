//
//  TextValidatorProtocol.swift
//  MVVM-Demo
//
//  Created by Hussein AlRyalat on 10/12/2022.
//

import Foundation
import RxSwift

protocol TextValidationProtocol {
    func validate() -> Observable<TextValidationResult>
}
