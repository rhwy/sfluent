//
//  File.swift
//  
//
//  Created by Rui Carvalho on 18/07/2021.
//

import Foundation
import XCTest

public protocol FluentSut {
    associatedtype T: Comparable
    var sut: T { get }
    init(_ value: T)
}

public protocol ErrorDescription {
    var message: String {get}
}

public struct CheckInit<SutType: Comparable> : FluentSut {
   
    public typealias T = SutType
    var value : SutType
    public init(_ value: SutType) {
        self.value = value
    }
    public var sut: SutType {
        get {
            return value
    }}
}

public struct CheckLink<SutType: Comparable> : FluentSut {
   
    public typealias T = SutType
    var value : SutType
    public init(_ value: SutType) {
        self.value = value
    }
    public var sut: SutType {
        get {
            return value
    }}
}

public extension FluentSut {
    func test() -> T {
        return sut
    }
    
   @discardableResult func isEqualTo(_ other: T) throws -> CheckLink<T> {
        if(other != sut) {
            throw "actual [\(sut)] was expected to be equal to expected [\(other)] but it is not"
        }
        return CheckLink(sut)
    }
}

public extension FluentSut where T == Int {
    @discardableResult func isPositive() throws -> CheckLink<T>{
        if sut <= 0 {
            let message = """
the actual integer [\(sut)] was expected to be positive but it is not
"""
            throw CheckError.FailedTest(CheckError.None, message)
        }
        return CheckLink(sut)
    }
}

public func ensure<T: Comparable>(that: T) -> CheckInit<T> {
        let systemUnderTest = that
        return CheckInit<T>(systemUnderTest)
}
