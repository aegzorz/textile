//
//  TextStyleTests.swift
//  Textile
//
//  Created by Alexander Persson on 2020-12-18.
//  Copyright © 2020 aegzorz. All rights reserved.
//

import XCTest
import Textile
import SnapshotTesting

class TextStyleTests: XCTestCase {
    func testSimpleStyle() {
        let attributedText = TextStyle.simple(text: "Hello World!")
        assertSnapshot(matching: attributedText, as: .dump)
    }
    
    func testComplexStyle() {
        let attributedText = TextStyle.complex(text: "Hello World!")
        assertSnapshot(matching: attributedText, as: .dump)
    }
    
    func testCombiningStyles() {
        let style: TextStyle = .combining(.simple, .uppercase)
        let attributedText = style(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
        assertSnapshot(matching: attributedText, as: .dump)
    }
    
    func testMultipleStyles() {
        let attributedText = NSMutableAttributedString()
        attributedText.append("Hello ".style(.simple))
        attributedText.append("World!".style(.combining(.simple, .uppercase)))
        
        assertSnapshot(matching: attributedText, as: .dump)
    }
}
