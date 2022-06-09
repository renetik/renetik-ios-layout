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
        .package(url: "https://github.com/renetik/renetik-ios-core", "0.9.1" ..< "0.9.1" ),
    ],
    targets: [
        .target(
            name: "RenetikLayout",
            dependencies: [
                .product(name: "RenetikCore", package: "renetik-ios-core"),
            ]
        ),
    ],
    swiftLanguageVersions: [
        .v5
    ]
)
