import XCTest
@testable import SIMDTools

class UtilityFunctionTests: XCTestCase {

    func testClamp() {
        XCTAssertEqual(clamp(5, min: 1, max: 10), 5)
        XCTAssertEqual(clamp(15, min: 1, max: 10), 10)
        XCTAssertEqual(clamp(-5, min: 1, max: 10), 1)
    }

    func testSaturate() {
        XCTAssertEqual(saturate(0.5), 0.5)
        XCTAssertEqual(saturate(1.5), 1.0)
        XCTAssertEqual(saturate(-0.5), 0.0)
    }

    func testInterpolate() {
        XCTAssertEqual(interpolate(a: 0.0, b: 10.0, t: 0.5), 5.0)
        XCTAssertEqual(interpolate(a: 0.0, b: 10.0, t: 0.0), 0.0)
        XCTAssertEqual(interpolate(a: 0.0, b: 10.0, t: 1.0), 10.0)
    }
}

