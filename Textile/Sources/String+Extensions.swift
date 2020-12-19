//
//  String+Extensions.swift
//  TextileTests
//
//  Created by Alexander Persson on 2020-12-19.
//  Copyright © 2020 aegzorz. All rights reserved.
//

import Foundation

public extension String {
    func style(_ textStyle: TextStyle) -> NSAttributedString {
        textStyle(text: self)
    }
}
