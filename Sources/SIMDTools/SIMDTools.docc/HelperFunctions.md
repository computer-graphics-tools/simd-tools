# Helper Functions

## Clamping Values

Clamp a value to a specified range:

```swift
let clampedValue = clamp(5, min: 1, max: 10) // 5
let clampedValue2 = clamp(15, min: 1, max: 10) // 10
```

## Saturating Values

Saturate a value to the range [0.0, 1.0]:

```swift
let saturatedValue = saturate(1.5) // 1.0
let saturatedValue2 = saturate(-0.5) // 0.0
```

## Linear Interpolation

Perform a linear interpolation between two values:

```swift
let start: Float = 0.0
let end: Float = 10.0
let t: Float = 0.5
let interpolatedValue = interpolate(a: start, b: end, t: t) // 5.0
```
