//
//  TextileLabel.swift
//  Textile
//
//  Created by Alexander Persson on 2020-12-18.
//  Copyright © 2020 aegzorz. All rights reserved.
//

#if canImport(UIKit)
import UIKit

open class TextileLabel: UILabel {
    open var textStyle: TextStyle? {
        didSet {
            applyTextStyle()
        }
    }

    open override var text: String? {
        didSet {
            applyTextStyle()
        }
    }

    public init(style: TextStyle? = nil, text: String? = nil) {
        textStyle = style
        super.init(frame: .zero)
        self.text = text
    }

    required public init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: Private
    private func applyTextStyle() {
        guard let text = text else { return }
        attributedText = textStyle?(text: text)
        textStyle?.apply(to: self)
    }
}
#endif
