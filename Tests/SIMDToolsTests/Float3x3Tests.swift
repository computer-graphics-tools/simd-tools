import XCTest
@testable import SIMDTools

class Float3x3Tests: XCTestCase {

    func testIdentityMatrix() {
        let identity = float3x3.identity
        XCTAssertEqual(identity, float3x3(diagonal: SIMD3<Float>(1, 1, 1)))
    }

    func testTranslationMatrix() {
        let translation = float3x3.translate(value: SIMD2<Float>(2.0, 3.0))
        let expected = float3x3(
            [1, 0, 0],
            [0, 1, 0],
            [2, 3, 1]
        )
        XCTAssertEqual(translation, expected)
    }

    func testRotationMatrix() {
        let angle = Angle(degrees: 90)
        let rotation = float3x3.rotate(angle: angle)
        let expected = float3x3(
            [0, -1, 0],
            [1, 0, 0],
            [0, 0, 1]
        )
        XCTAssertEqual(rotation, expected)
    }

    func testScalingMatrix() {
        let scaling = float3x3.scale(value: SIMD2<Float>(2.0, 3.0))
        let expected = float3x3(
            [2.0, 0.0, 0.0],
            [0.0, 3.0, 0.0],
            [0.0, 0.0, 1.0]
        )
        XCTAssertEqual(scaling, expected)
    }
}

