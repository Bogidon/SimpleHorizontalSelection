//
//  SHSDelegate.swift
//  SimpleHorizontalSelection
//
//  Created by Bogdan Vitoc on 4/25/16.
//  Copyright © 2016 Unleash.me. All rights reserved.
//

import Foundation

public protocol SHSDelegate {
    func didSelect(title: String, index: Int)
}