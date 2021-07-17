import XCTest
import sfluent

final class sfluentInitialDesignTests: XCTestCase {
    func testaCheckIsNotNullAndWithRightType() {
        let sut = check(that: 1)
        XCTAssertNotNil(sut)
        
        let checkType = "\(Checkable<Int>.self)"
        let sutType = "\(type(of: sut))"
        XCTAssertEqual(checkType, sutType)
    }
    
    func testCheckCanBeExtendedForIntType() throws{
        try check(that: 1).isGreaterThanZero()
    }
    
    func testCheckCanBeExtendedForIntType_WhenError() throws {
        try checkThatCode {
            try check(that: -42).isGreaterThanZero()
        }
        .throwsAnError()
        .and
        .error(is: """
=== check fail ===
the actual integer [-42] was expected to be positive but it is not
""")
        
    }
        
    
    func testCheckCanBeExtendedForStringType() throws{
        try check(that: "hello").isNotEmpty()
    }
    
    func testCheckCanBeExtendedForStringType_WhenError() throws {
        try checkThatCode {
            try check(that: nil).isNotEmpty()
        }
        .throwsAnError()
        .and
        .error(is: """
=== check fail ===
the actual String was expected to not be empty but it is actually less than empty, it is NIL
""")
    }
    
    func testCheckCanBeExtendedForStringType_WhenError2() throws {
        try checkThatCode {
            try check(that: "").isNotEmpty()
        }
        .throwsAnError()
        .and
        .error(is: """
=== check fail ===
the actual String was expected to contain something but it is actually empty
""")
    }
}
