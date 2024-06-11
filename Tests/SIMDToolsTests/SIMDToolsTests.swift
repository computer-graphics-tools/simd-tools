import XCTest
import SwiftMath
@testable import SIMDTools

final class SIMDToolsTests: XCTestCase {
    func testMacro() throws {
        let simd4Value = SIMD4<Float32>(1, 2, 3, 4)

        XCTAssertEqual(simd4Value.wxyz, SIMD4(4, 1, 2, 3))
    }

    func testMatrix() throws {
        XCTAssertEqual(float3x3.identity, float3x3(Matrix3x3f.identity))
        XCTAssertEqual(float3x3.translate(value: [1, 2]), float3x3(Matrix3x3f.translate(tx: 1, ty: 2)))
        XCTAssertEqual(float3x3.scale(value: [2, 3]), float3x3(Matrix3x3f.scale(sx: 2, sy: 3)))
        XCTAssertEqual(float3x3.rotate(angle: Angle(degrees: 80)), float3x3(Matrix3x3f.rotate(angle: Angle(degrees: 80))))

        XCTAssertEqual(float4x4.identity, float4x4(Matrix4x4f.identity))
        XCTAssertEqual(float4x4.translate(value: [1, 2, 3]), float4x4(Matrix4x4f.translate(tx: 1, ty: 2, tz: 3)))
        XCTAssertEqual(float4x4.scale(value: [2, 3, 4]), float4x4(Matrix4x4f.scale(sx: 2, sy: 3, sz: 4)))

        XCTAssertEqual(float4x4.rotate(y: Angle(degrees: 80)), float4x4(Matrix4x4f.rotate(y: Angle(degrees: 80))))
        XCTAssertEqual(float4x4.rotate(z: Angle(degrees: 80)), float4x4(Matrix4x4f.rotate(z: Angle(degrees: 80))))
        XCTAssertEqual(
            float4x4.rotate(x: Angle(degrees: 10), y: Angle(degrees: 20), z: Angle(degrees: 30)),
            float4x4(Matrix4x4f.rotate(x: Angle(degrees: 10), y: Angle(degrees: 20), z: Angle(degrees: 30)))
        )

        XCTAssertEqual(
            float4x4.scaleRotateTranslate(
                scale: [0.5, 0.3, 0.2],
                ax: Angle(degrees: 10),
                ay: Angle(degrees: 20),
                az: Angle(degrees: 30),
                translate: [1, 2, 3]
            ),
            float4x4(Matrix4x4f.scaleRotateTranslate(
                sx: 0.5,
                sy: 0.3,
                sz: 0.2,
                ax: Angle(degrees: 10),
                ay: Angle(degrees: 20),
                az: Angle(degrees: 30),
                tx: 1,
                ty: 2,
                tz: 3
            ))
        )

    }
}
