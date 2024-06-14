import XCTest
@testable import SIMDTools

class AngleTests: XCTestCase {

    func testDegreesToRadians() {
        let angle = Angle(degrees: 180)
        XCTAssertEqual(angle.radians, Float32.pi, accuracy: 0.0001)
    }

    func testRadiansToDegrees() {
        let angle = Angle(radians: Float32.pi)
        XCTAssertEqual(angle.degrees, 180, accuracy: 0.0001)
    }
}
