import ProjectDescription
import ProjectDescriptionHelpers

let framework = Target(
    name: "Textile",
    platform: .iOS,
    product: .framework,
    bundleId: "se.aegzorz.textile",
    deploymentTarget: .iOS(targetVersion: "11.0", devices: [.iphone, .ipad]),
    infoPlist: .default,
    sources: "Sources/**",
    resources: nil,
    actions: [.swiftlint],
    dependencies: []
)

let tests = Target(
    name: "TextileTests",
    platform: .iOS,
    product: .unitTests,
    bundleId: "se.aegzorz.textiletests",
    infoPlist: .default,
    sources: "Tests/**",
    dependencies: [
        .target(name: "Textile"),
        .package(product: "SnapshotTesting")
    ]
)

let project = Project(
    name: "Textile",
    organizationName: "aegzorz",
    packages: [
        .package(url: "https://github.com/pointfreeco/swift-snapshot-testing.git", .upToNextMajor(from: "1.8.0")),
    ],
    targets: [
        framework,
        tests
    ]
)
