//
//  SecondaryActionButton.swift
//  MVVM-Demo
//
//  Created by Hussein AlRyalat on 10/12/2022.
//

import UIKit

class SecondaryActionButton: UIButton {
    
    @IBInspectable
    var text: String? {
        didSet {
            if let text {
                setTitle(text, for: .normal)
            }
        }
    }
    
    @IBInspectable
    var isLoading: Bool = false {
        didSet {
            cUpdateConfiguration()
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
        cUpdateConfiguration()
    }
    
    /**
     Updates the configuration preserving any changed parameteres if they passed as null
     */
    private func cUpdateConfiguration() {
        var newConfiguration = UIButton.Configuration.borderedTinted()
        newConfiguration.baseBackgroundColor = Styles.Colors.accent.withAlphaComponent(0.7)
        newConfiguration.baseForegroundColor = Styles.Colors.accent
        newConfiguration.contentInsets = .init(top: 12, leading: 12, bottom: 12, trailing: 12)
        newConfiguration.showsActivityIndicator = isLoading
                
        self.configuration = newConfiguration
        self.setNeedsUpdateConfiguration()
    }
}
