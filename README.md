# SIMDTools

[![Platform Compatibility](https://img.shields.io/badge/Platforms-iOS%20|%20macOS%20|%20watchOS%20|%20tvOS-brightgreen)](https://swift.org/platforms/)
[![Swift Version](https://img.shields.io/badge/Swift-5.9-orange)](https://swift.org)

<p align="left">
    <img src="Sources/SIMDTools/SIMDTools.docc/Resources/documentation-art/simd-tools@2x.png", width="120">
</p>

Welcome to the documentation for the `SIMDTools` Swift package. This package provides utility functions and extensions for working with SIMD matrices and vectors in Swift.

## Overview

The `simd-tools` package includes:

- `Angle` struct for representing angles.
- Extensions for `float3x3` and `float4x4` to perform various matrix transformations.
- `SIMD2`, `SIMD3` and `SIMD4` components permutations.
- Utility functions such as `clamp`, `saturate`, and `interpolate`.

Please see [the package's documentation](https://swiftpackageindex.com/computer-graphics-tools/simd-tools/documentation/simdtools)
for more detailed usage instructions.

## Adding the SIMDTools as a Dependency

To use the SIMDTools package, first add it as a dependency:

```swift
let package = Package(
    // name, platforms, products, etc.
    dependencies: [
        // other dependencies
        .package(url: "https://github.com/computer-graphics-tools/simd-tools", from: "0.0.1"),
    ],
    targets: [
        // targets
    ]
)
```

Swift 5.9 is required in order to use the package.

## Tutorials

- [Use SIMDTools in SwiftUI](https://swiftpackageindex.com/computer-graphics-tools/simd-tools/tutorials/usesimdtoolsinswiftui)

    Learn how to use SIMD matrices to calculate affine transform for rotating SwiftUI views. Get started with SIMDTools by building the demo app RotateImage.

## Usage

- [Working With Angles](Sources/SIMDTools/SIMDTools.docc/WorkingWithAngles.md)
- [Working With 3x3 Matrices](Sources/SIMDTools/SIMDTools.docc/WorkingWith3x3Matrices.md)
- [Working With 4x4 Matrices](Sources/SIMDTools/SIMDTools.docc/WorkingWith4x4Matrices.md)
- [Helper Functions](Sources/SIMDTools/SIMDTools.docc/HelperFunctions.md)

## License

MetalTools is licensed under [MIT license](LICENSE).
