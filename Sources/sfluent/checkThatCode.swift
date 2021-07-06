//
//  checkThatCode.swift
//  
//
//  Created by Rui Carvalho on 07/07/2021.
//

import Foundation
import XCTest

/**
    # Check that code

    It creates a **Checkable** expression around a closure you want to test

     It is mainly used to check if an expression should throw errors or not
        
     ```swift
        checkThatCode {
           throw "it should fail!"
        }.willThrowAnError()
    ```
 
    - parameters :
        - that : the closure you want to test
 
*/
public func checkThatCode(_ that: @escaping () throws -> Void) -> Checkable<() throws ->Void> {
        let systemUnderTest = that
        return Checkable<() throws ->Void>(value: systemUnderTest)
}


public extension Checkable where T == () throws -> Void {
    func willThrowAnError() {
        XCTAssertThrowsError(try value())
    }
}

public extension Checkable where T == () throws -> Void {
    func willNotThrowAnError() {
        XCTAssertNoThrow(try value(), "this code was not expected to throw an error but it was")
    }
}
