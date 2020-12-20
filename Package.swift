// swift-tools-version:5.2
import PackageDescription

let package = Package(
    name: "Textile",
    platforms: [.iOS(.v10)],
    products: [
        .library(name: "Textile", targets: ["Textile"]),
    ],
    dependencies: [
        .package(name: "SnapshotTesting", url: "https://github.com/pointfreeco/swift-snapshot-testing.git", .upToNextMajor(from: "1.8.0"))
    ],
    targets: [
        .target(
            name: "Textile",
            path: "Textile/Sources"
        ),
        .testTarget(
            name: "TextileTests",
            dependencies: ["Textile", "SnapshotTesting"],
            path: "Textile/Tests"
        )
    ],
    swiftLanguageVersions: [
        .v5
    ]
)
