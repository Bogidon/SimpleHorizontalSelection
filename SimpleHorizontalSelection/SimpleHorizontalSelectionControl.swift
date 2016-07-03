//
//  SimpleHorizontalSelectionView.swift
//  SimpleHorizontalSelection
//
//  Created by Bogdan Vitoc on 4/25/16.
//  Copyright © 2016 Unleash.me. All rights reserved.
//

import UIKit

public class SimpleHorizontalSelectionControl: UIControl {

    // MARK: - Private properties
    private var _buttons = [UIButton]()
    private var _selectedButton: UIButton?
    private let _stackView = SHSStackView()
    private var _didLayout = false
    
    // MARK: - Init
    override public init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    convenience public init() {
        self.init(frame: CGRectZero)
        commonInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
    }
    
    override public func updateConstraints() {
        super.updateConstraints()
        
        if !_didLayout {
            _stackView.translatesAutoresizingMaskIntoConstraints = false
            addSubview(_stackView)
            addConstraints([
                NSLayoutConstraint(
                    item: _stackView,
                    attribute: .CenterX,
                    relatedBy: .Equal,
                    toItem: self,
                    attribute: .CenterX,
                    multiplier: 1.0,
                    constant: 0.0),
                NSLayoutConstraint(
                    item: _stackView,
                    attribute: .CenterY,
                    relatedBy: .Equal,
                    toItem: self,
                    attribute: .CenterY,
                    multiplier: 1.0,
                    constant: 0.0),
                NSLayoutConstraint(
                    item: _stackView,
                    attribute: .Width,
                    relatedBy: .Equal,
                    toItem: self,
                    attribute: .Width,
                    multiplier: 1.0,
                    constant: 0.0),
                NSLayoutConstraint(
                    item: _stackView,
                    attribute: .Height,
                    relatedBy: .Equal,
                    toItem: self,
                    attribute: .Height,
                    multiplier: 1.0,
                    constant: 0.0)])
            _didLayout = true
        }
    }
    
    // MARK - Public properties
    /// Color for text that is *not* selected
    public var unselectedTextColor = UIColor.darkGrayColor() { didSet { updateExistingButtons() }}
    
    /// Color for text that *is* selected
    public var selectedTextColor = UIColor.lightGrayColor() { didSet { updateExistingButtons() }}
    
    /// Font
    public var font = UIFont.systemFontOfSize(UIFont.labelFontSize()) { didSet { updateExistingButtons() }}
    
    /// Delegate
    public var delegate: SHSDelegate? { didSet { updateExistingButtons() }}
    
    /**
     Update the titles
     
     - parameter data:  an array of titles
     */
    public func update(titles: [String]) {
        
        titles.forEach {
            let button = UIButton(type: .Custom)
            button.setTitle($0, forState: .Normal)
            _buttons.append(button)
        }
        
        updateExistingButtons()
        _stackView.set(_buttons)
    }
    
    /**
     Select button at a given index. Throws exception if index is greater than array.
     
     - parameter index:	index to select
     */
    public func selectIndex(index: Int) {
        _buttons[index].sendActionsForControlEvents(.TouchUpInside)
    }
    
    private func updateExistingButtons() {
        for (idx, button) in _buttons.enumerate() {
            let isSelectedButton = button == _selectedButton
            button.setTitleColor(isSelectedButton ? selectedTextColor : unselectedTextColor, forState: .Normal)
            button.setTitleColor(isSelectedButton ? unselectedTextColor : selectedTextColor, forState: .Highlighted)
            button.titleLabel?.font = font
            button.removeControlEvent(.TouchUpInside)
            button.addControlEvent(.TouchUpInside) {
                // Alert delegate
                self.delegate?.didSelect(button.titleLabel!.text!, index: idx)
                // Toggle button selection
                if (self._selectedButton != button) {
                    self._selectedButton?.setTitleColor(self.unselectedTextColor, forState: .Normal)
                    self._selectedButton = button
                    button.setTitleColor(self.selectedTextColor, forState: .Normal)
                }
            }
        }
    }
}
