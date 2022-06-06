// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RenetikLayout",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "RenetikLayout",
            targets: ["RenetikLayout"]),
    ],
    dependencies: [
        .package(url: "https://github.com/rene-dohan/renetik-library-ios", branch: "master"),
    ],
    targets: [
        .target(
            name: "RenetikLayout",
            dependencies: [
                .product(name: "Renetik", package: "renetik-library-ios"),
            ]
        ),
    ],
    swiftLanguageVersions: [
        .v5
    ]
)
