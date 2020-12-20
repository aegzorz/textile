// swift-tools-version:5.2
import PackageDescription

let package = Package(
    name: "Textile",
    platforms: [.iOS(.v10)],
    products: [
        .library(name: "Textile", targets: ["Textile"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Textile",
            path: "Textile/Sources"
        ),
        .testTarget(
            name: "TextileTests",
            dependencies: ["Textile"],
            path: "Textile/Tests"
        )
    ],
    swiftLanguageVersions: [
        .v5
    ]
)
