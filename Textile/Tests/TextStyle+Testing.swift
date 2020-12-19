//
//  TextStyle+Testing.swift
//  TextileTests
//
//  Created by Alexander Persson on 2020-12-18.
//  Copyright © 2020 aegzorz. All rights reserved.
//

import UIKit
import Textile

extension TextStyle {
    static let simple = TextStyle { style in
        style.set(.font, UIFont.systemFont(ofSize: 18, weight: .regular))
        style.set(.foregroundColor, .black)
    }
    
    static let uppercase = TextStyle { style in
        style.addTextTransformer(.init(\.localizedUppercase))
    }
    
    static let complex = TextStyle { style in
        style.set(.font, UIFont.systemFont(ofSize: 24, weight: .bold))
        
        style.set(.kern, 2)
        
        style.set(.underlineColor, .blue)
        style.set(.underlineStyle, .patternDashDotDot)
        
        style.set(.baselineOffset, 2)
        
        style.set(.strokeColor, .yellow)
        style.set(.strokeWidth, -2)
        style.set(.foregroundColor, .red)

        let shadow = NSShadow()
        shadow.shadowBlurRadius = 2
        shadow.shadowColor = UIColor.darkGray
        shadow.shadowOffset = CGSize(width: 0, height: 4)
        
        style.set(.shadow, shadow)
        
        let paragraph = NSMutableParagraphStyle()
        paragraph.lineBreakMode = .byTruncatingMiddle
        paragraph.headIndent = 10
        paragraph.minimumLineHeight = 24
        
        style.set(.paragraphStyle, paragraph)
    }
    
    static let boldBlueForeground = TextStyle { style in
        style.set(.font, UIFont.boldSystemFont(ofSize: 18))
        style.set(.foregroundColor, .blue)
    }
    
    static let italicRedBackground = TextStyle { style in
        style.set(.font, UIFont.italicSystemFont(ofSize: 18))
        style.set(.backgroundColor, .red)
    }
}
