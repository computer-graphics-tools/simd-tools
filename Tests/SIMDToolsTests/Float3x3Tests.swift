import XCTest
import simd
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

    func testShearX() {
        let sx: Float32 = 1.5
        let shearMatrix = float3x3.shear(x: sx)
        let expectedMatrix = float3x3(
            [1, 0,  0],
            [sx, 1, 0],
            [0, 0,  1]
        )

        XCTAssertEqual(shearMatrix, expectedMatrix)
    }

    func testShearY() {
        let sy: Float32 = 2.5
        let shearMatrix = float3x3.shear(y: sy)
        let expectedMatrix = float3x3(
            [1, sy, 0],
            [0, 1,  0],
            [0, 0,  1]
        )

        XCTAssertEqual(shearMatrix, expectedMatrix)
    }

    func testAspectFitScale() {
        let originalSize = SIMD2<Float32>(100, 50)
        let boundingSize = SIMD2<Float32>(200, 200)
        let scaleMatrix = float3x3.aspectFitScale(originalSize: originalSize, boundingSize: boundingSize)
        let expectedScale = SIMD2<Float32>(2, 2)
        let expectedMatrix = float3x3.scale(value: expectedScale)

        XCTAssertEqual(scaleMatrix, expectedMatrix)
    }

    func testAspectFillScale() {
        let originalSize = SIMD2<Float32>(100, 50)
        let boundingSize = SIMD2<Float32>(200, 200)
        let scaleMatrix = float3x3.aspectFillScale(originalSize: originalSize, boundingSize: boundingSize)
        let expectedScale = SIMD2<Float32>(4, 4)
        let expectedMatrix = float3x3.scale(value: expectedScale)

        XCTAssertEqual(scaleMatrix, expectedMatrix)
    }

    func testFillScale() {
        let originalSize = SIMD2<Float32>(100, 50)
        let boundingSize = SIMD2<Float32>(200, 300)
        let scaleMatrix = float3x3.fillScale(originalSize: originalSize, boundingSize: boundingSize)
        let expectedScale = SIMD2<Float32>(2, 6)
        let expectedMatrix = float3x3.scale(value: expectedScale)

        XCTAssertEqual(scaleMatrix, expectedMatrix)
    }

}
