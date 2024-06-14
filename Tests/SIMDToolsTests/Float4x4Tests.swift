import XCTest
@testable import SIMDTools

class Float4x4Tests: XCTestCase {

    func testIdentityMatrix() {
        let identity = float4x4.identity
        XCTAssertEqual(identity, float4x4(diagonal: SIMD4<Float>(1, 1, 1, 1)))
    }

    func testTranslationMatrix() {
        let translation = float4x4.translate(value: SIMD3<Float>(2.0, 3.0, 4.0))
        let expected = float4x4(
            [1, 0, 0, 0],
            [0, 1, 0, 0],
            [0, 0, 1, 0],
            [2, 3, 4, 1]
        )
        XCTAssertEqual(translation, expected)
    }

    func testRotationMatrixX() {
        let angle = Angle(degrees: 90)
        let rotation = float4x4.rotate(x: angle)
        let expected = float4x4(
            [1, 0, 0, 0],
            [0, 0, -1, 0],
            [0, 1, 0, 0],
            [0, 0, 0, 1]
        )
        XCTAssertEqual(rotation, expected)
    }

    func testRotationMatrixY() {
        let angle = Angle(degrees: 90)
        let rotation = float4x4.rotate(y: angle)
        let expected = float4x4(
            [0, 0, 1, 0],
            [0, 1, 0, 0],
            [-1, 0, 0, 0],
            [0, 0, 0, 1]
        )
        XCTAssertEqual(rotation, expected)
    }

    func testRotationMatrixZ() {
        let angle = Angle(degrees: 90)
        let rotation = float4x4.rotate(z: angle)
        let expected = float4x4(
            [0, -1, 0, 0],
            [1, 0, 0, 0],
            [0, 0, 1, 0],
            [0, 0, 0, 1]
        )
        XCTAssertEqual(rotation, expected)
    }

    func testShearXYMatrix() {
        let shear = float4x4.shear(xy: SIMD2<Float>(1.0, 0.5))
        let expected = float4x4(
            [1, 0.5, 0, 0],
            [1.0, 1, 0, 0],
            [0, 0, 1, 0],
            [0, 0, 0, 1]
        )
        XCTAssertEqual(shear, expected)
    }

    func testShearXZMatrix() {
        let shear = float4x4.shear(xz: SIMD2<Float>(1.0, 0.5))
        let expected = float4x4(
            [1, 0, 0.5, 0],
            [0, 1, 0, 0],
            [1.0, 0, 1, 0],
            [0, 0, 0, 1]
        )
        XCTAssertEqual(shear, expected)
    }

    func testShearYZMatrix() {
        let shear = float4x4.shear(yz: SIMD2<Float>(1.0, 0.5))
        let expected = float4x4(
            [1, 0, 0, 0],
            [0, 1, 0.5, 0],
            [0, 1.0, 1, 0],
            [0, 0, 0, 1]
        )
        XCTAssertEqual(shear, expected)
    }

    func testScalingMatrix() {
        let scaling = float4x4.scale(value: SIMD3<Float>(2.0, 3.0, 4.0))
        let expected = float4x4(
            [2.0, 0.0, 0.0, 0.0],
            [0.0, 3.0, 0.0, 0.0],
            [0.0, 0.0, 4.0, 0.0],
            [0.0, 0.0, 0.0, 1.0]
        )
        XCTAssertEqual(scaling, expected)
    }

}
