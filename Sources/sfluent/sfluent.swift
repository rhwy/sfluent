import XCTest

public func check<T>(that: T) -> Checkable<T> {
        let systemUnderTest = that
        return Checkable<T>(systemUnderTest)
}

public protocol CheckProtocol {
    
}

public struct Checkable<T> : CheckProtocol {
    var value: T
    init(_ value: T) {
        self.value = value
    }
}

public struct CheckedResult<T>: CheckProtocol{
    public var and: CheckedResult<T> {
        return self
    }
    var value: T
    var error: CheckError
    init(_ value: T, _ error: CheckError = CheckError.None) {
        self.value = value
        self.error = error
    }
    
}
