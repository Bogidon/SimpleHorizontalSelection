//
//  SHSStackView.swift
//  SimpleHorizontalSelection
//
//  Created by Bogdan Vitoc on 4/25/16.
//  Copyright © 2016 Unleash.me. All rights reserved.
//

import UIKit

internal class SHSStackView: CommonInitStackView {
    
    override func commonInit() {
        axis = .Horizontal
        distribution = .EqualCentering
    }
        
    internal func set(buttons: [UIButton]) {
        arrangedSubviews.forEach { $0.removeFromSuperview() }
        buttons.forEach { self.addArrangedSubview($0) }
    }
}
