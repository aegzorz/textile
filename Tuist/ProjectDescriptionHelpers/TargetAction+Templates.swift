//
//  TargetAction+Templates.swift
//  ProjectDescriptionHelpers
//
//  Created by Alexander Persson on 2020-12-15.
//

import ProjectDescription

public extension TargetAction {
    static var swiftlint: TargetAction {
        .pre(
            tool: "swiftlint",
            arguments: "lint", "--path", "$SRCROOT/Sources",
            name: "Swiftlint"
        )
    }
}
