# Working with 3x3 Matrices

## Identity Matrix

Get the identity matrix:

```swift
let identityMatrix = float3x3.identity
```

## Translation Matrix

Create a translation matrix:

```swift
let translation = float3x3.translate(value: SIMD2<Float32>(x: 10, y: 5))
```

## Rotation Matrix

Create a rotation matrix:

```swift
let rotation = float3x3.rotate(angle: Angle(degrees: 45))
```

## Scaling Matrix

Create a scaling matrix:

```swift
let scaling = float3x3.scale(value: SIMD2<Float32>(x: 2, y: 3))
```

## Codable Support

Encode and decode float3x3 matrices:

```swift
let matrix = float3x3.identity

// Encoding
let encoder = JSONEncoder()
let encodedData = try encoder.encode(matrix)

// Decoding
let decoder = JSONDecoder()
let decodedMatrix = try decoder.decode(float3x3.self, from: encodedData)
```
