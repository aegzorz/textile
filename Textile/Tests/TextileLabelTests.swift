//
//  TextileLabelTests.swift
//  TextileTests
//
//  Created by Alexander Persson on 2020-12-18.
//  Copyright © 2020 aegzorz. All rights reserved.
//

import XCTest
import Textile
import SnapshotTesting

class TextileLabelTests: XCTestCase {
    func testSimpleStyle() {
        let label = TextileLabel(style: .simple, text: "Hello world!")
        assertSnapshot(matching: label, as: .image)
    }
    
    func testComplexStyle() {
        let label = TextileLabel(style: .complex, text: "Hello world!")
        label.backgroundColor = .white
        assertSnapshot(matching: label, as: .image)
    }
}
