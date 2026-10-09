// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "Trophy",
    platforms: [
        .iOS(.v15),
        .macOS(.v12),
        .tvOS(.v15),
        .watchOS(.v8)
    ],
    products: [
        .library(
            name: "Trophy",
            targets: ["Trophy"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Trophy",
            path: "Sources"
        ),
        .testTarget(
            name: "TrophyTests",
            dependencies: ["Trophy"],
            path: "Tests"
        )
    ]
)
