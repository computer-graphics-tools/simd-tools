// swift-tools-version: 5.9

import PackageDescription
import CompilerPluginSupport

let package = Package(
    name: "SIMDTools",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .tvOS(.v13),
        .watchOS(.v6),
        .macCatalyst(.v13)
    ],
    products: [
        .library(
            name: "SIMDTools",
            targets: ["SIMDTools"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-syntax.git", from: "510.0.2"),
        .package(url: "https://github.com/SwiftGFX/SwiftMath.git", from: "3.3.1"),
    ],
    targets: [
        .macro(
            name: "SIMDToolsMacros",
            dependencies: [
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
                .product(name: "SwiftCompilerPlugin", package: "swift-syntax")
            ]
        ),
        .target(name: "SIMDTools", dependencies: ["SIMDToolsMacros"]),
        .testTarget(
            name: "SIMDToolsTests",
            dependencies: [
                .product(name: "SwiftMath", package: "SwiftMath"),
                "SIMDTools",
            ]
        ),
    ]
)
