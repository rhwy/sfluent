    import XCTest
    @testable import sfluent

    final class sfluentTests: XCTestCase {
        func testaCheckIsNotNullAndWithRightType() {
            let sut = check(that: 1)
            XCTAssertNotNil(sut)
            
            let checkType = "\(Checkable<Int>.self)"
            let sutType = "\(type(of: sut))"
            XCTAssertEqual(checkType, sutType)
        }
        
        func testCheckCanBeExtendedForIntType() {
            check(that: 1).isGreaterThanZero()
        }
        
        func testCheckCanBeExtendedForStringType() {
            check(that: "hello").isNotEmpty()
        }
    }
