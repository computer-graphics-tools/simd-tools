import simd

public extension float4x4 {

    // MARK: - Identity
    
    /// Returns the identity matrix
    static let identity = matrix_identity_float4x4

    // MARK: - Translate
    
    /// Returns a translation matrix
    /// - Parameter value: the translation value
    /// - Returns: a new translation matrix
    static func translate(value: SIMD3<Float32>) -> float4x4 {
        float4x4(
            [1,       0,       0,       0],
            [0,       1,       0,       0],
            [0,       0,       1,       0],
            [value.x, value.y, value.z, 1]
        )
    }

    // MARK: - Rotate

    /// Create a matrix with rotates around the x axis
    /// - parameter x: angle
    /// - returns: a new rotation matrix
    static func rotate(x: Angle) -> float4x4 {
        let (sin: sx, cos: cx) = sincos(x)
        return float4x4(
            [1, 0,   0,  0],
            [0, cx, -sx, 0],
            [0, sx,  cx, 0],
            [0, 0,   0,  1]
        )
    }

    /// Returns a transformation matrix that rotates around the y axis
    /// - Parameter y: angle
    /// - Returns: a new rotation matrix
    static func rotate(y: Angle) -> float4x4 {
        let (sin: sy, cos: cy) = sincos(y)
        return float4x4(
            [cy, 0, sy, 0],
            [0,  1,  0,  0],
            [-sy, 0,  cy, 0],
            [0,  0,  0,  1]
        )
    }
    
    /// Returns a transformation matrix that rotates around the z axis
    /// - Parameter z: angle
    /// - Returns: a new rotation matrix
    static func rotate(z: Angle) -> float4x4 {
        let (sin: sz, cos: cz) = sincos(z)
        return float4x4(
            [ cz, -sz, 0, 0],
            [sz, cz, 0, 0],
            [ 0,  0,  1, 0],
            [ 0,  0,  0, 1]
        )
    }

    /// Returns a transformation matrix that rotates around the x, y and then z axes
    /// - Parameters:
    ///   - x: angle to rotate around `x` axis
    ///   - y: angle to rotate around `y` axis
    ///   - z: angle to rotate around `z` axis
    /// - Returns: a new rotation matrix
    static func rotate(x: Angle, y: Angle, z: Angle) -> float4x4 {
        let (sin: sx, cos: cx) = sincos(x)
        let (sin: sy, cos: cy) = sincos(y)
        let (sin: sz, cos: cz) = sincos(z)
        return float4x4(
            [cy * cz,                 -cy * sz,                  sy,      0],
            [cz * sx * sy + cx * sz,   cx * cz - sx * sy * sz,  -cy * sx, 0],
            [-cx * cz * sy + sx * sz,  cz * sx + cx * sy * sz,   cx * cy, 0],
            [ 0,                       0,                        0,       1]
        )
    }

    // MARK: - Scale

    static func scale(value: SIMD3<Float32>) -> float4x4 {
        float4x4(
            [value.x, 0,       0,       0],
            [0,       value.y, 0,       0],
            [0,       0,       value.z, 0],
            [0,       0,       0,       1]
        )
    }

    // MARK: - Matrix Operations

    /// Returns a transformation matrix which can be used to scale, rotate and translate vectors
    static func scaleRotateTranslate(
        scale: SIMD3<Float32>,
        ax: Angle,
        ay: Angle,
        az: Angle,
        translate: SIMD3<Float32>
    ) -> float4x4 {
        let (sin: sx, cos: cx) = sincos(ax)
        let (sin: sy, cos: cy) = sincos(ay)
        let (sin: sz, cos: cz) = sincos(az)

        let sxsz = sx * sz
        let cycz = cy * cz

        return float4x4(
            [scale.x * (cycz - sxsz * sy),       scale.x * -cx * sz, scale.x * (cz * sy + cy * sxsz), 0],
            [scale.y * (cz * sx * sy + cy * sz), scale.y * cx * cz,  scale.y * (sy * sz - cycz * sx), 0],
            [scale.z * -cx * sy,                 scale.z * sx,       cx * cy,                         0],
            [translate.x,                        translate.y,        translate.z,                     1]
        )
    }

    static func lookAt(
        eye: SIMD3<Float32>,
        at: SIMD3<Float32>,
        up: SIMD3<Float32> = [0, 1, 0]
    ) -> float4x4 {
        return lookAtLH(
            eye: eye,
            at: at,
            up: up
        )
    }

    static func lookAtLH(
        eye: SIMD3<Float32>,
        at: SIMD3<Float32>, up: SIMD3<Float32>
    ) -> float4x4 {
        let view = normalize(at - eye)
        return lookAt(
            eye: eye,
            view: view,
            up: up
        )
    }

    static func lookAt(
        eye: SIMD3<Float32>,
        view: SIMD3<Float32>,
        up: SIMD3<Float32>
    ) -> float4x4 {
        let right = normalize(cross(up, view))
        let u = cross(view, right)
        return float4x4(
            [right[0],          u[0],         view[0],        0],
            [right[1],          u[1],         view[1],        0],
            [right[2],          u[2],         view[2],        0],
            [-dot(right, eye), -dot(u, eye), -dot(view, eye), 1]
        )
    }

    /// Creates a left-handed perspective projection matrix
    static func proj(
        fovy: Angle,
        aspect: Float32,
        near: Float32,
        far: Float32
    ) -> float4x4 {
        let height = 1 / tan(fovy * 0.5)
        let width  = height * 1 / aspect;
        return projLH(
            x: 0,
            y: 0,
            w: width,
            h: height,
            near: near,
            far: far
        )
    }

    /// Creates a left-handed perspective projection matrix
    static func projLH(
        x: Float32,
        y: Float32,
        w: Float32,
        h: Float32,
        near: Float32,
        far: Float32
    ) -> float4x4 {
        let diff = far - near
        let aa = far / diff
        let bb = near * aa
        return float4x4(
            [w,   0,  0,  0],
            [0,   h,  0,  0],
            [-x, -y,  aa, 1],
            [0,   0, -bb,  0]
        )
    }

    /// Creates a right-handed perspective projection matrix
    static func projRH(
        x: Float,
        y: Float,
        w: Float,
        h: Float,
        near: Float,
        far: Float
    ) -> float4x4 {
        let diff = far - near
        let aa = far / diff
        let bb = near * aa
        return float4x4(
            [w, 0,  0, 0],
            [0, h,  0, 0],
            [x, y,  -aa, -1],
            [0, 0,  -bb, 0]
        )
    }

    /// Creates a left-handed orthographic projection matrix
    static func ortho(
        left: Float,
        right: Float,
        bottom: Float,
        top: Float,
        near: Float,
        far: Float
    ) -> float4x4 {
        orthoLH(
            left: left,
            right: right,
            bottom: bottom,
            top: top,
            near: near,
            far: far
        )
    }

    /// Creates a left-handed orthographic projection matrix
    static func orthoLH(
        left: Float,
        right: Float,
        bottom: Float,
        top: Float,
        near: Float,
        far: Float,
        offset: Float = 0.0
    ) -> float4x4 {
        let aa = 2.0 / (right - left)
        let bb = 2.0 / (top - bottom)
        let cc = 1.0 / (far - near)
        let dd = (left + right) / (left - right)
        let ee = (top + bottom) / (bottom - top)
        let ff = near / (near - far)
        return float4x4(
            [aa,          0,  0,  0],
            [0,           bb, 0,  0],
            [0,           0,  cc, 0],
            [dd + offset, ee, ff, 1]
        )
    }

    /// Creates a right-handed orthographic projection matrix
    static func orthoRH(
        left: Float,
        right: Float,
        bottom: Float,
        top: Float,
        near: Float,
        far: Float,
        offset: Float = 0.0
    ) -> float4x4 {
        let aa = 2.0 / (right - left)
        let bb = 2.0 / (top - bottom)
        let cc = 1.0 / (far - near)
        let dd = (left + right) / (left - right)
        let ee = (top + bottom) / (bottom - top)
        let ff = near / (near - far)
        return float4x4(
            [aa,          0,   0,  0],
            [0,           bb,  0,  0],
            [0,           0,  -cc, 0],
            [dd + offset, ee,  ff, 1]
        )
    }
}

// MARK: - Codable

extension float4x4: Codable {
    private enum CodingKey: String, Swift.CodingKey {
        case column1, column2, column3, column4
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKey.self)
        let c1 = try values.decode(SIMD4<Float>.self, forKey: .column1)
        let c2 = try values.decode(SIMD4<Float>.self, forKey: .column2)
        let c3 = try values.decode(SIMD4<Float>.self, forKey: .column3)
        let c4 = try values.decode(SIMD4<Float>.self, forKey: .column4)

        self.init(c1, c2, c3, c4)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKey.self)
        try container.encode(self.columns.0, forKey: .column1)
        try container.encode(self.columns.1, forKey: .column2)
        try container.encode(self.columns.2, forKey: .column3)
        try container.encode(self.columns.3, forKey: .column4)
    }
}
