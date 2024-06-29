# ``SIMDTools``

![SIMDTools](simd-tools.png)

Welcome to the documentation for the `SIMDTools` Swift package (`SIMD` stands for [Single instruction, multiple data](https://en.wikipedia.org/wiki/Single_instruction,_multiple_data)).

This package provides utility functions and extensions for working with SIMD matrices and vectors in Swift.

## Topics

### Articles

- <doc:WorkingWithAngles>
- <doc:WorkingWith3x3Matrices>
- <doc:WorkingWith4x4Matrices>
- <doc:HelperFunctions>

### Tutorials

- <doc:/tutorials/UseSIMDToolsInSwiftUI>

### Float3x3 Extensions

- ``simd/simd_float3x3/identity``
- ``simd/simd_float3x3/translate(value:)``
- ``simd/simd_float3x3/rotate(angle:)``
- ``simd/simd_float3x3/scale(value:)``
- ``simd/simd_float3x3/shear(x:)``
- ``simd/simd_float3x3/shear(y:)``

### Float4x4 Extensions

- ``simd/simd_float4x4/identity``
- ``simd/simd_float4x4/translate(value:)``
- ``simd/simd_float4x4/rotate(x:)``
- ``simd/simd_float4x4/rotate(y:)``
- ``simd/simd_float4x4/rotate(z:)``
- ``simd/simd_float4x4/scale(value:)``
- ``simd/simd_float4x4/shear(xy:)``
- ``simd/simd_float4x4/shear(xz:)``
- ``simd/simd_float4x4/shear(yz:)``
- ``simd/simd_float4x4/lookAt(eye:at:up:)``
- ``simd/simd_float4x4/lookAt(eye:view:up:)``
- ``simd/simd_float4x4/proj(fovy:aspect:near:far:)``
- ``simd/simd_float4x4/ortho(left:right:bottom:top:near:far:)``
