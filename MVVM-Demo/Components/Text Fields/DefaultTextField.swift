//
//  DefaultTextField.swift
//  MVVM-Demo
//
//  Created by Hussein AlRyalat on 10/12/2022.
//

import Foundation
import UIKit
import SkyFloatingLabelTextField

class DefaultTextField: SkyFloatingLabelTextField {
    
    override var placeholder: String? {
        didSet {
            attributedPlaceholder = NSAttributedString(string: placeholder ?? "", attributes: [
                .foregroundColor: UIColor.placeholderText,
                .font: UIFont.font(for: .medium, size: 17)
            ])
        }
    }
    
    var paddingValue: CGFloat = 0 {
        didSet {
            inset = .init(top: 0, left: paddingValue, bottom: 0, right: paddingValue)
        }
    }
    
    var inset: UIEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 0) {
        didSet {
            setNeedsDisplay()
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    override var intrinsicContentSize: CGSize {
        .init(width: Self.noIntrinsicMetric, height: 55)
    }
    
    func updateStyle() {
        font = .font(for: .medium, size: 17)
        textColor = .label
        tintColor = Styles.Colors.accent
        backgroundColor = .clear
        
        
        // customizng floating label attributes
        lineColor = .separator
        selectedLineColor = Styles.Colors.accent
        
        selectedTitleColor = Styles.Colors.accent
        titleColor = .placeholderText
                
        lineHeight = 1
        selectedLineHeight = 1.5
        
        errorColor = .systemRed
        titleFont = .font(for: .regular, size: 12)
    }
    
    func setup(){
        self.inset = .init(top: 0, left: paddingValue, bottom: 0, right: paddingValue)
        updateStyle()
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: inset)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
         return bounds.inset(by: inset)
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
         return bounds.inset(by: inset)
    }
}
