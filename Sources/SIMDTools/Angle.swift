import Foundation

/// A floating point value that represents an angle
@frozen
public struct Angle {

    /// The value of the angle in degrees
    public let degrees: Float32

    /// The value of the angle in radians
    public var radians: Float32 {
        return degrees * Float32.pi / 180.0
    }

    /// Creates an instance using the value in radians
    public init(radians val: Float32) {
        degrees = val / Float32.pi * 180.0
    }

    /// Creates an instance using the value in degrees
    public init(degrees val: Float32) {
        degrees = val
    }

    internal init(_ val: Float32) {
        degrees = val
    }

    // MARK: Constants
    public static let zero = Angle(degrees: 0)
    public static let pi_6 = Angle(degrees: 30)
    public static let pi_4 = Angle(degrees: 45)
    public static let pi_3 = Angle(degrees: 60)
    public static let pi_2 = Angle(degrees: 90)
    public static let pi2_3 = Angle(degrees: 120)
    public static let pi = Angle(degrees: 180)
    public static let pi3_2 = Angle(degrees: 270)
    public static let pi2 = Angle(degrees: 360)
}

extension Angle: CustomStringConvertible, CustomDebugStringConvertible {
    public var description: String {
        return "\(degrees)°"
    }

    public var debugDescription: String {
        return "\(degrees)°"
    }
}

extension Angle: CustomPlaygroundDisplayConvertible {
    public var playgroundDescription: Any {
        return degrees
    }
}

extension Int {
    /// Returns the integer value as an angle in degrees
    public var degrees: Angle {
        return Angle(degrees: Float32(self))
    }
}

extension Angle {
    // MARK: - operators

    // MARK: multiplication (scaling)

    public static func *=(lhs: inout Angle, rhs: Float32) {
        lhs = Angle(lhs.degrees * rhs)
    }

    public static func *(lhs: Angle, rhs: Float32) -> Angle {
        return Angle(lhs.degrees * rhs)
    }

    public static func *(lhs: Float32, rhs: Angle) -> Angle {
        return Angle(rhs.degrees * lhs)
    }

    // MARK: division (scaling)

    public static func /=(lhs: inout Angle, rhs: Float32) {
        lhs = Angle(lhs.degrees / rhs)
    }

    public static func /(lhs: Angle, rhs: Float32) -> Angle {
        return Angle(lhs.degrees / rhs)
    }

    // MARK: addition

    public static func +=(lhs: inout Angle, rhs: Angle) {
        lhs = Angle(lhs.degrees + rhs.degrees)
    }

    public static func +(lhs: Angle, rhs: Angle) -> Angle {
        return Angle(lhs.degrees + rhs.degrees)
    }

    // MARK: subtraction

    public static func -=(lhs: inout Angle, rhs: Angle) {
        lhs = Angle(lhs.degrees - rhs.degrees)
    }

    public static func -(lhs: Angle, rhs: Angle) -> Angle {
        return Angle(lhs.degrees - rhs.degrees)
    }

    // MARK: Modulus

    public static func %(lhs: Angle, rhs: Angle) -> Angle {
        return Angle(lhs.degrees.truncatingRemainder(dividingBy: rhs.degrees))
    }

    // MARK: Unary

    public static prefix func -(lhs: Angle) -> Angle {
        return Angle(-lhs.degrees)
    }
}

// MARK: - Equatable

extension Angle: Equatable {
    public static func ==(lhs: Angle, rhs: Angle) -> Bool {
        return lhs.degrees == rhs.degrees
    }
}

// MARK: - Comparable

extension Angle: Comparable {
    public static func <(lhs: Angle, rhs: Angle) -> Bool {
        return lhs.degrees < rhs.degrees
    }

    public static func <=(lhs: Angle, rhs: Angle) -> Bool {
        return lhs.degrees <= rhs.degrees
    }

    public static func >(lhs: Angle, rhs: Angle) -> Bool {
        return lhs.degrees > rhs.degrees
    }

    public static func >=(lhs: Angle, rhs: Angle) -> Bool {
        return lhs.degrees >= rhs.degrees
    }
}

public func sincos(_ a: Angle, _ sina: inout Float, _ cosa: inout Float)  {
    __sincospif(a.degrees / 180.0, &sina, &cosa)
}

public func sincos(_ a: Angle) -> (sin: Float, cos: Float) {
    var s: Float = 0.0
    var c: Float = 0.0
    sincos(a, &s, &c)

    return (sin: s, cos: c)
}

public func sin(_ a: Angle) -> Float {
    return __sinpif(a.degrees / 180.0)
}

public func cos(_ a: Angle) -> Float {
    return __cospif(a.degrees / 180.0)
}

public func tan(_ a: Angle) -> Float {
    return __tanpif(a.degrees / 180.0)
}
