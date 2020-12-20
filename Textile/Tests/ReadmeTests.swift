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
    
    func testComplexStyle() {
        let attributedText = NSMutableAttributedString()
        attributedText.append("First we need a title\n".style(.heading))
        attributedText.append("Here starts the ".style(.body))
        attributedText.append("body text".style(.body + .underlined))
        attributedText.append(", then suddenly we might want some".style(.body))
        attributedText.append(" bold text ".style(.bodyBold))
        attributedText.append("in the middle.\n".style(.body))
        attributedText.append("...and then some right-aligned text".style(.body + .rightGray))
        
        let label = UILabel()
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.attributedText = attributedText
        
        assertSnapshot(matching: label, as: .image(size: CGSize(width: 350, height: 150)))
    }
}

private extension TextStyle {
    static let heading = TextStyle { style in
        style.set(.font, UIFont.systemFont(ofSize: 24))
        style.merge(with: .center)
    }
    
    static let body = TextStyle { style in
        style.set(.font, UIFont.systemFont(ofSize: 18, weight: .regular))
    }
    
    static let underlined = TextStyle { style in
        style.set(.underlineStyle, .single)
        style.set(.underlineColor, .black)
    }
    
    static let bodyBold = TextStyle { style in
        style.set(.font, UIFont.systemFont(ofSize: 18, weight: .bold))
    }
    
    static let center = TextStyle { style in
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = .center
        style.set(.paragraphStyle, paragraph)
    }
    
    static let rightGray = TextStyle { style in
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = .right
        style.set(.paragraphStyle, paragraph)
        style.set(.foregroundColor, .darkGray)
    }
}
