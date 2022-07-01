// swift-tools-version: 5.5
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
        .package(url: "https://github.com/renetik/renetik-ios-core", from: "0.9.10"),
        .package(url: "https://github.com/renetik/renetik-ios-event", from: "0.9.10"),
        .package(url: "https://github.com/renetik/renetik-ios-ui", from: "0.9.10"),
    ],
    targets: [
        .target(
            name: "RenetikLayout",
            dependencies: [
                .product(name: "RenetikCore", package: "renetik-ios-core"),
                .product(name: "RenetikEvent", package: "renetik-ios-event"),
                .product(name: "RenetikUI", package: "renetik-ios-ui"),
            ]
        ),
    ],
    swiftLanguageVersions: [
        .v5
    ]
)
