//
//  TextTransformer.swift
//  Textile
//
//  Created by Alexander Persson on 2020-12-18.
//  Copyright © 2020 aegzorz. All rights reserved.
//

import Foundation

public struct TextTransformer {
    internal let transform: (String) -> String

    public init(_ transform: @escaping (String) -> String) {
        self.transform = transform
    }

    func callAsFunction(text: String) -> String {
        transform(text)
    }
}
