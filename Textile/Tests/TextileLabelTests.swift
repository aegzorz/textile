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
    
    func testCombiningStyles() {
        let label = TextileLabel()
        label.text = "Lorem ipsum dolor sit amet"
        
        label.textStyle = .combining(.boldBlueForeground, .italicRedBackground)
        
        // Should be blue italic on red background
        assertSnapshot(matching: label, as: .image)
        
        label.textStyle = .combining(.italicRedBackground, .boldBlueForeground)
        
        // Should be blue bold on red background
        assertSnapshot(matching: label, as: .image)
    }
    
    func testConfigurator() {
        let label = TextileLabel(
            style: .combining(.simple, .multiline),
            text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        )
        
        assertSnapshot(matching: label, as: .image(size: CGSize(width: 350, height: 260)))
    }
}
