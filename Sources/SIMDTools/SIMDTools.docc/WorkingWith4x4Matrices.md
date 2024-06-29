# Working with 4x4 Matrices

## Identity Matrix

Get the identity matrix:

```swift
let identityMatrix = float4x4.identity
```

## Translation Matrix

Create a translation matrix:

```swift
let translation = float4x4.translate(value: SIMD3<Float32>(x: 10, y: 5, z: 3))
```

## Rotation Matrix

Create a rotation matrix:

```swift
let rotationX = float4x4.rotate(x: Angle(degrees: 45))
let rotationY = float4x4.rotate(y: Angle(degrees: 45))
let rotationZ = float4x4.rotate(z: Angle(degrees: 45))
let rotationXYZ = float4x4.rotate(
    x: Angle(degrees: 45),
    y: Angle(degrees: 45),
    z: Angle(degrees: 45)
)
```

## Scaling Matrix

Create a scaling matrix:

```swift
let scaling = float4x4.scale(value: SIMD3<Float32>(x: 2, y: 3, z: 4))
```

## Shearing Matrix

Create shearing matrices:

```swift
let shearXY = float4x4.shear(xy: SIMD2<Float32>(x: 1, y: 0.5))
let shearXZ = float4x4.shear(xz: SIMD2<Float32>(x: 1, y: 0.5))
let shearYZ = float4x4.shear(yz: SIMD2<Float32>(x: 1, y: 0.5))
```

## Matrix Operations

Create view and projection matrices:

```swift
let eye = SIMD3<Float32>(x: 0, y: 0, z: 5)
let center = SIMD3<Float32>(x: 0, y: 0, z: 0)
let up = SIMD3<Float32>(x: 0, y: 1, z: 0)
let viewMatrix = float4x4.lookAt(eye: eye, at: center, up: up)

let fovy = Angle(degrees: 60)
let aspectRatio: Float32 = 16.0 / 9.0
let near: Float32 = 0.1
let far: Float32 = 100.0
let projectionMatrix = float4x4.proj(fovy: fovy, aspect: aspectRatio, near: near, far: far)
```



## Codable Support

Encode and decode float4x4 matrices:

```swift
let matrix = float4x4.identity

// Encoding
let encoder = JSONEncoder()
let encodedData = try encoder.encode(matrix)

// Decoding
let decoder = JSONDecoder()
let decodedMatrix = try decoder.decode(float4x4.self, from: encodedData)
```
