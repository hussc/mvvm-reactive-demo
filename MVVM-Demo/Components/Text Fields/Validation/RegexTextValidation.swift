//
//  RegexTextValidation.swift
//  MVVM-Demo
//
//  Created by Hussein AlRyalat on 10/12/2022.
//

import Foundation
import RxSwift

class RegexTextValidator {
    var input: Observable<String>
    var regex: NSRegularExpression

    init(input: Observable<String>, regex: NSRegularExpression) {
       self.input = input
       self.regex = regex
    }

    func validate() -> Observable<TextValidationResult> {
        input.map { text in
            .success
        }
    }
}

extension RegexTextValidator {
    static func email(with input: Observable<String>) -> RegexTextValidator {
        let regex = try! NSRegularExpression(pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
        return .init(input: input, regex: regex)
    }
}
