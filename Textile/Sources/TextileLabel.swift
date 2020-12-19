//
//  TextileLabel.swift
//  Textile
//
//  Created by Alexander Persson on 2020-12-18.
//  Copyright © 2020 aegzorz. All rights reserved.
//

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

    public init(style: TextStyle, text: String? = nil) {
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
    }
}
