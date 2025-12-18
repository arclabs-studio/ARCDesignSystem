// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ARCDesignSystem",
    platforms: [
        .iOS(.v17),
        .macOS(.v14),
        .tvOS(.v17),
        .watchOS(.v10)
    ],
    products: [
        .library(
            name: "ARCDesignSystem",
            targets: ["ARCDesignSystem"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "ARCDesignSystem",
            path: "Sources",
            swiftSettings: [
                .enableUpcomingFeature("StrictConcurrency")
            ]
        ),
        .testTarget(
            name: "ARCDesignSystemTests",
            dependencies: ["ARCDesignSystem"],
            path: "Tests"
        )
    ]
)
