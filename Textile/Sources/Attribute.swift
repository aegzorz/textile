//
//  Attribute.swift
//  Textile
//
//  Created by Alexander Persson on 2020-12-15.
//  Copyright © 2020 aegzorz. All rights reserved.
//

#if canImport(UIKit)
import UIKit

extension TextStyle {
    public struct Attribute<Value> {
        internal let key: NSAttributedString.Key

        init(_ key: NSAttributedString.Key) {
            self.key = key
        }
    }
}

public extension TextStyle.Attribute {
    static var font: TextStyle.Attribute<UIFont?> { return .init(.font) }
    static var paragraphStyle: TextStyle.Attribute<NSParagraphStyle?> { return .init(.paragraphStyle) }
    static var foregroundColor: TextStyle.Attribute<UIColor?> { return .init(.foregroundColor) }
    static var backgroundColor: TextStyle.Attribute<UIColor?> { return .init(.backgroundColor) }
    static var ligature: TextStyle.Attribute<Bool> { return .init(.ligature) }
    static var kern: TextStyle.Attribute<Float> { return .init(.kern) }
    static var strikethroughStyle: TextStyle.Attribute<NSUnderlineStyle> { return .init(.strikethroughStyle) }
    static var underlineStyle: TextStyle.Attribute<NSUnderlineStyle> { return .init(.underlineStyle) }
    static var strokeColor: TextStyle.Attribute<UIColor?> { return .init(.strokeColor) }
    static var strokeWidth: TextStyle.Attribute<Float> { return .init(.strokeWidth) }
    static var shadow: TextStyle.Attribute<NSShadow?> { return .init(.shadow) }
    static var textEffect: TextStyle.Attribute<String?> { return .init(.textEffect) }
    static var attachment: TextStyle.Attribute<NSTextAttachment?> { return .init(.attachment) }
    static var link: TextStyle.Attribute<URL?> { return .init(.link) }
    static var baselineOffset: TextStyle.Attribute<Float> { return .init(.baselineOffset) }
    static var underlineColor: TextStyle.Attribute<UIColor?> { return .init(.underlineColor) }
    static var strikethroughColor: TextStyle.Attribute<UIColor?> { return .init(.strikethroughColor) }
    static var obliqueness: TextStyle.Attribute<Float> { return .init(.obliqueness) }
    static var expansion: TextStyle.Attribute<Float> { return .init(.expansion) }
}

#endif
