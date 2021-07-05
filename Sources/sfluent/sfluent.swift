import XCTest
func check<T>(that: T) -> Checkable<T> {
        let systemUnderTest = that
        return Checkable<T>(value: systemUnderTest)
    }

struct Checkable<T> {
    var value: T
    init(value: T) {
        self.value = value
    }
}

extension Checkable where T == Int {
    func isGreaterThanZero() {
        XCTAssertGreaterThan(value,0)
    }
}

extension Checkable where T == String {
    func isNotEmpty() {
        XCTAssertNotNil(value)
        XCTAssertGreaterThan(value.count,0)
    }
}
