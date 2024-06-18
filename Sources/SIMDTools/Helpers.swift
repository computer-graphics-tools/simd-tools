/// Clamps a value to the specified range
/// - Parameters:
///   - x: The value to be clamped
///   - min: The minimum value
///   - max: The maximum value
/// - Returns: The clamped value
public func clamp<T>(_ x: T, min: T, max: T) -> T where T: Comparable {
    Swift.min(Swift.max(x, min), max)
}

/// Clamps a value to the range [0.0, 1.0]
/// - Parameter x: The value to be clamped
/// - Returns: The clamped value
public func saturate<T>(_ x: T) -> T where T: BinaryFloatingPoint {
    clamp(x, min: 0.0, max: 1.0)
}

/// Performs a linear interpolation between two values
/// - Parameters:
///   - a: The start value
///   - b: The end value
///   - t: The interpolant
/// - Returns: A value interpolated from a to b
public func interpolate<T>(a: T, b: T, t: T) -> T where T: BinaryFloatingPoint {
    a + (b - a) * t
}
