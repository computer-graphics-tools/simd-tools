# SIMDTools

<p align="left">
    <img src="Sources/SIMDTools/SIMDTools.docc/Resources/documentation-art/simd-tools@2x.png", width="120">
</p>

Welcome to the documentation for the `SIMDTools` Swift package. This package provides utility functions and extensions for working with SIMD matrices and vectors in Swift.

## Overview

The `simd-tools` package includes:

- `Angle` struct for representing angles.
- Extensions for `float3x3` and `float4x4` to perform various matrix transformations.
- Utility functions such as `clamp`, `saturate`, and `interpolate`.

## Install via [SwiftPM](https://swift.org/package-manager/)

```swift
.package(url: "https://github.com/computer-graphics-tools/simd-tools", from: "0.0.1")
```

### Usage

- [Working With Angles](Sources/SIMDTools/SIMDTools.docc/WorkingWithAngles.md)
- [Working With 3x3 Matrices](Sources/SIMDTools/SIMDTools.docc/WorkingWith3x3Matrices.md)
- [Working With 4x4 Matrices](Sources/SIMDTools/SIMDTools.docc/WorkingWith4x4Matrices.md)
- [Helper Functions](Sources/SIMDTools/SIMDTools.docc/HelperFunctions.md)

## License

MetalTools is licensed under [MIT license](LICENSE).
