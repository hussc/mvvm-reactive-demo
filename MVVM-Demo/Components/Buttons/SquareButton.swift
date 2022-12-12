//
//  RectangleButton.swift
//  MVVM-Demo
//
//  Created by Hussein AlRyalat on 10/12/2022.
//

import UIKit

@IBDesignable
class SquareButton: UIButton {
    
    @IBInspectable
    var systemImageName: String? {
        didSet {
            if let systemImageName {
                self.updateImage(with: systemImageName)
            }
        }
    }
    
    override var intrinsicContentSize: CGSize {
        .init(width: 44, height: 44)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
        supplySampleImage()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    private func setup() {
        var newConfiguration = UIButton.Configuration.tinted()
        newConfiguration.baseBackgroundColor = .black
        newConfiguration.baseForegroundColor = .black
        newConfiguration.contentInsets = .init(top: 12, leading: 12, bottom: 12, trailing: 12)
        
        self.configuration = newConfiguration
        self.setNeedsUpdateConfiguration()
    }
    
    private func supplySampleImage() {
        self.systemImageName = "arrow.backward"
    }
    
    private func updateImage(with name: String) {
        setImage(UIImage(systemName: name, withConfiguration: UIImage.SymbolConfiguration(font: .systemFont(ofSize: 14, weight: .medium))), for: .normal)
    }
}
