// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AppLibrary",
    platforms: [
        .iOS(.v14),
        .macOS(.v11)
    ],
    products: [
        .library(
            name: "AppLibrary",
            targets: [
                "AppLibrary"
            ]
        )
    ],
    dependencies: [
        .package(path: "../../..")
    ],
    targets: [
        .target(
            name: "AppLibrary",
            dependencies: [
                .product(name: "MotleyHue", package: "KGDesignTokens")
            ]
        )
    ]
)
