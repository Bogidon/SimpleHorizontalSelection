//
//  UIStackView+CommonInit.swift
//  BarsUnleashed
//
//  Created by Bogdan Vitoc on 4/18/16.
//  Copyright © 2016 Unleash.me. All rights reserved.
//

import Foundation

internal class CommonInitStackView: UIStackView {
    override internal init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    override internal init(arrangedSubviews views: [UIView]) {
        super.init(arrangedSubviews: views)
        commonInit()
    }
    
    convenience internal init() {
        self.init(arrangedSubviews: [])
        commonInit()
    }
    
    required internal init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    internal func commonInit() {}
}