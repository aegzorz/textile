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
import SnapKit

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
    
    func testCustomFont() {
        let font = UIFont(font: TextileTestsFontFamily.Quicksand.dash, size: 72)
        
        let style = TextStyle { style in
            style.set(.font, font)
            style.set(.foregroundColor, .red)
            style.set(.baselineOffset, -4)
            style.set(.kern, 3)
            
            let shadow = NSShadow()
            shadow.shadowColor = UIColor(white: 0, alpha: 0.3)
            shadow.shadowOffset = CGSize(width: 0.5, height: 0.5)
            shadow.shadowBlurRadius = 1
            
            style.set(.shadow, shadow)
        }
        
        let label = TextileLabel(style: style, text: " Textile ")
        
        // <a href="https://www.freepik.com/photos/background">Background photo created by rawpixel.com - www.freepik.com</a>
        label.backgroundColor = UIColor(patternImage: TextileTestsAsset.whiteMicrofiberFabricBackground.image)
                
        assertSnapshot(matching: label, as: .image)
    }
}
