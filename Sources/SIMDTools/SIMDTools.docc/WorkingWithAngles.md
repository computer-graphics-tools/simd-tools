# Working with Angles

## Creating Angles

You can create an angle using degrees or radians:

```swift
let angleInDegrees = Angle(degrees: 45)
let angleInRadians = Angle(radians: .pi / 4)
```

## Accessing Angle Values

Retrieve the angle value in degrees or radians:

```swift
let degrees = angleInDegrees.degrees // 45.0
let radians = angleInDegrees.radians // 0.7853982
```

## Arithmetic Operations

Perform arithmetic operations with angles:

```swift
let angle1 = Angle(degrees: 30)
let angle2 = Angle(degrees: 60)

let sum = angle1 + angle2 // 90 degrees
let difference = angle2 - angle1 // 30 degrees
let scaledAngle = angle1 * 2 // 60 degrees
let dividedAngle = angle2 / 2 // 30 degrees
```

## Trigonometric Functions

Compute sine, cosine, and tangent of an angle:

```swift
let angle = Angle(degrees: 45)
let sine = sin(angle) // 0.70710677
let cosine = cos(angle) // 0.70710677
let tangent = tan(angle) // 1.0

let (sine, cosine) = sincos(angle) // (0.70710677, 0.70710677)
```

## Comparison Operators

Compare angles:

```swift
let angle1 = Angle(degrees: 45)
let angle2 = Angle(degrees: 90)

if angle1 < angle2 {
    print("\(angle1) is less than \(angle2)")
}

if angle1 == Angle(degrees: 45) {
    print("\(angle1) is equal to 45 degrees")
}

```

## Constants

Use predefined angle constants:

```swift
let zeroAngle = Angle.zero
let rightAngle = Angle.pi_2
let fullCircle = Angle.pi2
```
