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
        // Main library - this is what consumers import
        .library(
            name: "ARCDesignSystem",
            targets: ["ARCDesignSystem"]
        )
        // Note: ARCDesignSystemDemo is intentionally NOT exposed as a product.
        // It's an internal executable for development/testing purposes only.
    ],
    dependencies: [],
    targets: [
        .target(
            name: "ARCDesignSystem",
            path: "Sources",
            swiftSettings: [
                .enableExperimentalFeature("StrictConcurrency")
            ]
        ),
        .testTarget(
            name: "ARCDesignSystemTests",
            dependencies: ["ARCDesignSystem"],
            path: "Tests"
        )
        // Note: iOS demo app is in Examples/ARCDesignSystemDemo.xcodeproj
        // It's a separate Xcode project that imports this package locally.
    ]
)
