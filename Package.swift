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
        .package(url: "https://github.com/renetik/renetik-ios-core", exact: "0.9.3" ),
        .package(url: "https://github.com/renetik/renetik-ios-event", exact: "0.9.3" ),
        .package(url: "https://github.com/renetik/renetik-ios-ui", exact: "0.9.3" ),
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
