//
//  PrimaryActionButton.swift
//  MVVM-Demo
//
//  Created by Hussein AlRyalat on 10/12/2022.
//

import UIKit

class PrimaryActionButton: UIButton {
    
    @IBInspectable
    var text: String? {
        didSet {
            if let text {
                setTitle(text, for: .normal)
            }
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    private func setup() {
        var newConfiguration = UIButton.Configuration.filled()
        newConfiguration.baseBackgroundColor = Styles.Colors.accent
        newConfiguration.contentInsets = .init(top: 12, leading: 12, bottom: 12, trailing: 12)
        
        self.configuration = newConfiguration
        self.setNeedsUpdateConfiguration()
    }
}
