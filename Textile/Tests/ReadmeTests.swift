//
//  ReadmeTests.swift
//  TextileTests
//
//  Created by Alexander Persson on 2020-12-20.
//  Copyright © 2020 aegzorz. All rights reserved.
//

import XCTest
import Textile
import SnapshotTesting

class ReadmeTests: XCTestCase {
    func testLogo() {
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

    
    func testSimpleStyle() {
        let style = TextStyle { style in
            style.set(.font, UIFont.systemFont(ofSize: 18, weight: .regular))
            style.set(.foregroundColor, .black)
        }
        
        let label = UILabel()
        label.attributedText = style(text: "Hello world!")
        
        assertSnapshot(matching: label, as: .image)
    }
    
    func testTextileLabel() {
        let label = TextileLabel(style: .combining(.body, .uppercase), text: "Hello World!")
        assertSnapshot(matching: label, as: .image)
    }
    
}

private extension TextStyle {
    static let body = TextStyle { style in
        style.set(.font, UIFont.systemFont(ofSize: 18, weight: .regular))
    }
}
