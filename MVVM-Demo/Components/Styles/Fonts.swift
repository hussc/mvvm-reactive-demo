//
//  Fonts.swift
//  MVVM-Demo
//
//  Created by Hussein AlRyalat on 10/12/2022.
//

import UIKit

enum FontTrait: String {
    case extraLight
    case light
    case regular
    case medium
    case semiBold
    case bold
    case black
    case heavy
}

protocol FontProviderType {
    static func font(for trait: FontTrait, size: CGFloat) -> UIFont
}

struct SystemFontsProvider: FontProviderType  {
    static func font(for trait: FontTrait, size: CGFloat) -> UIFont {
        switch trait {
        case .extraLight:
            return UIFont.systemFont(ofSize: size, weight: .ultraLight)
        case .light:
            return UIFont.systemFont(ofSize: size, weight: .light)
        case .regular:
            return UIFont.systemFont(ofSize: size, weight: .regular)
        case .medium:
            return UIFont.systemFont(ofSize: size, weight: .medium)
        case .semiBold:
            return UIFont.systemFont(ofSize: size, weight: .semibold)
        case .bold:
            return UIFont.systemFont(ofSize: size, weight: .bold)
        case .black:
            return UIFont.systemFont(ofSize: size, weight: .black)
        case .heavy:
            return UIFont.systemFont(ofSize: size, weight: .heavy)
        }
    }
}
