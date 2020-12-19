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
}
