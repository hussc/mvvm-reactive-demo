//
//  Styles.swift
//  MVVM-Demo
//
//  Created by Hussein AlRyalat on 10/12/2022.
//

import Foundation
import UIKit

struct Styles {
    static var Colors: Colors.Type { MVVM_Demo.Colors.self }
    
    static var Fonts: FontProviderType.Type { MVVM_Demo.SystemFontsProvider.self }
}

extension UIFont: FontProviderType {
    static func font(for trait: FontTrait, size: CGFloat) -> UIFont {
        Styles.Fonts.font(for: trait, size: size)
    }
}
