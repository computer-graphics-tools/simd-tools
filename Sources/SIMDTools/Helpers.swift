/// Returns x, such that min ≤ x ≤ max
///
/// - parameter x:   value to be clamped
/// - parameter min: minimum
/// - parameter max: maximum
public func clamp<T>(_ x: T, min _min: T, max _max: T) -> T where T: Comparable {
    return min(max(x, _min), _max)
}

/// Returns x, where 0.0 ≤ x ≤ 1.0
public func saturate<T>(_ x: T) -> T where T: BinaryFloatingPoint {
    return clamp(x, min: 0.0, max: 1.0)
}

/// Performs a linear interpolation between a and b by the interpolant t
///
/// - parameter a: start value
/// - parameter b: end value
/// - parameter t: interpolant
///
/// - returns: a value interpolated from a to b
public func interpolate<T>(a: T, b: T, t: T) -> T  where T: BinaryFloatingPoint {
    return a + (b - a) * t
}
