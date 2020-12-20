//
//  LabelConfigurator.swift
//  Textile
//
//  Created by Alexander Persson on 2020-12-20.
//  Copyright © 2020 aegzorz. All rights reserved.
//

#if canImport(UIKit)
import UIKit

public struct LabelConfigurator {
    let configure: (UILabel) -> Void

    public init<T>(_ keyPath: ReferenceWritableKeyPath<UILabel, T>, _ value: T) {
        configure = { label in
            label[keyPath: keyPath] = value
        }
    }
}
#endif
