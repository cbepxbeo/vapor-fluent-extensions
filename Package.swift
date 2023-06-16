// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "vapor-fluent-extensions",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        .library(
            name: "FluentExtensions",
            targets: ["FluentExtensions"]),
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/fluent-kit.git", from: "1.38.0"),
    ],
    targets: [
        .target(
            name: "FluentExtensions",
            dependencies: [
                .product(name: "FluentKit", package: "fluent-kit"),
                .product(name: "FluentSQL", package: "fluent-kit"),
            ],
            path: "Sources"
        ),
        .testTarget(
            name: "FluentExtensionsTests",
            dependencies: ["FluentExtensions"]),
    ]
)
