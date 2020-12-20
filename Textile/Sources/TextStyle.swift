//
//  TextStyle.swift
//  Textile
//
//  Created by Alexander Persson on 2020-12-15.
//  Copyright © 2020 aegzorz. All rights reserved.
//

#if canImport(UIKit)
import UIKit

public extension String {
    func style(_ textStyle: TextStyle) -> NSAttributedString {
        textStyle(text: self)
    }
}

public struct TextStyle {
    public func callAsFunction(text: String) -> NSAttributedString {
        let transformedText = transformers.reduce(text) { result, transformer in
            return transformer(text: result)
        }
        return NSAttributedString(string: transformedText, attributes: attributes)
    }

    public init(configure: (inout TextStyle) -> Void = { _ in }) {
        configure(&self)
    }

    fileprivate var transformers: [TextTransformer] = []
    fileprivate var attributes: [NSAttributedString.Key: Any] = [:]
}

extension TextStyle {
    public static func combining(_ textStyles: TextStyle...) -> TextStyle {
        textStyles.reduce(into: TextStyle()) { combined, style in
            combined.merge(with: style)
        }
    }

    public mutating func addTextTransformer(_ transformer: TextTransformer) {
        transformers.append(transformer)
    }

    public mutating func set<T>(_ attribute: Attribute<T>, _ value: T) {
        switch value {
        case let style as NSUnderlineStyle:
            attributes[attribute.key] = style.rawValue
        default:
            attributes[attribute.key] = value
        }
    }

    public mutating func merge(with textStyle: TextStyle) {
        transformers.append(contentsOf: textStyle.transformers)
        attributes.merge(textStyle.attributes) { $1 }
    }
}
#endif
