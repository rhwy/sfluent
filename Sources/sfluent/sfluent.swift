import XCTest

public func check<T>(that: T) -> Checkable<T> {
        let systemUnderTest = that
        return Checkable<T>(value: systemUnderTest)
}


public struct Checkable<T> {
    var value: T
    init(value: T) {
        self.value = value
    }
}


public extension Checkable where T == Int {
    func isGreaterThanZero() {
        XCTAssertGreaterThan(value,0)
    }
}

public extension Checkable where T == String {
    func isNotEmpty() {
        XCTAssertNotNil(value)
        XCTAssertGreaterThan(value.count,0)
    }
}
