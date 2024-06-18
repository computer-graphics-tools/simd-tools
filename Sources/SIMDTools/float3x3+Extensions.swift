import simd

public extension float3x3 {

    // MARK: - Identity

    /// Returns the identity matrix
    static let identity = matrix_identity_float3x3

    // MARK: - Translate

    /// Returns a translation matrix
    /// - Parameter value: the translation value
    /// - Returns: a new translation matrix
    static func translate(value: SIMD2<Float32>) -> float3x3 {
        float3x3(
            [1,       0,       0],
            [0,       1,       0],
            [value.x, value.y, 1]
        )
    }

    // MARK: - Rotate

    /// Returns a transformation matrix that rotates around the x and then y axes
    /// - Parameter angle: angle
    /// - Returns: a new rotation matrix
    static func rotate(angle: Angle) -> float3x3 {
        let (sin: sx, cos: cx) = sincos(angle)
        return float3x3(
            [cx, -sx, 0],
            [sx,  cx, 0],
            [0,   0,  1]
        )
    }

    // MARK: - Scale

    /// Returns a scaling matrix
    /// - Parameter value: the scaling value
    /// - Returns: a new scaling matrix
    static func scale(value: SIMD2<Float32>) -> float3x3 {
        float3x3(
            [value.x, 0,       0],
            [0,       value.y, 0],
            [0,       0,       1]
        )
    }
}

// MARK: - Codable

extension float3x3: Codable {
    private enum CodingKey: String, Swift.CodingKey {
        case column1, column2, column3
    }

    /// Initializes a `float3x3` instance from a decoder
    /// - Parameter decoder: The decoder to read data from
    /// - Throws: An error if reading from the decoder fails
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKey.self)
        let c1 = try values.decode(SIMD3<Float>.self, forKey: .column1)
        let c2 = try values.decode(SIMD3<Float>.self, forKey: .column2)
        let c3 = try values.decode(SIMD3<Float>.self, forKey: .column3)

        self.init(c1, c2, c3)
    }

    /// Encodes a `float3x3` instance into an encoder
    /// - Parameter encoder: The encoder to write data to
    /// - Throws: An error if encoding fails
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKey.self)
        try container.encode(self.columns.0, forKey: .column1)
        try container.encode(self.columns.1, forKey: .column2)
        try container.encode(self.columns.2, forKey: .column3)
    }
}
