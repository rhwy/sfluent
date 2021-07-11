//
//  checkThatCode.swift
//  
//
//  Created by Rui Carvalho on 07/07/2021.
//

import Foundation
import XCTest

extension String : Error {}

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
        return Checkable<() throws ->Void>(systemUnderTest)
}


public extension Checkable where T == () throws -> Void {
    @discardableResult func throwsAnError() throws -> CheckedResult<T>{
        
        let sutResult: CheckedResult<T>
        do {
            try value()
            sutResult =  CheckedResult<T>(self.value)
        } catch {
            sutResult =  CheckedResult<T>(
                self.value,
                CheckError.ExecutedCode(error))
        }
        switch sutResult.error {
        case .None:
            throw CheckError.FailedTest(
                CheckError.None,
                "it was expected to throw an error but it didn'throws")
            
        default:
            return sutResult
        }

    }
}

public extension Checkable where T == () throws -> Void {
    @discardableResult func dontThrowAnError() throws -> CheckedResult<T>{
        let sutResult: CheckedResult<T>
        do {
            try value()
            sutResult =  CheckedResult<T>(self.value)
        } catch {
            sutResult =  CheckedResult<T>(
                self.value,
                CheckError.ExecutedCode(error))
        }
        switch sutResult.error {
        case .None:
            return sutResult
        default:
            throw CheckError.FailedTest(sutResult.error, "it was not expected to throw an error but it throws")
        }

    }
}

public extension CheckedResult where T == () throws -> Void {
    func error(is: Error) {
        let actual = self.error
        let expected =  CheckError.ExecutedCode(`is`)
        XCTAssertEqual(actual,expected)
    }
}

public enum CheckError: Error,Equatable,CustomStringConvertible {
    public var description: String {
        switch self {
        case .None:
            return "None"
        case .ExecutedCode(let err):
            return String(describing: err)
        case .FailedTest(CheckError.None, let msg):
            let testMessage = """
            ❌
            \(msg)
            """
            return testMessage
        case .FailedTest(let err, let msg):
            let testMessage = """
            ❌
            \(msg) :
            - \(String(describing: err))
            """
            return testMessage
        }
    }
    
    public static func == (lhs: CheckError, rhs: CheckError) -> Bool {
        switch lhs {
        case .ExecutedCode(let lvalue):
            switch rhs {
            case .ExecutedCode(let rvalue):
                return String(describing: lvalue) == String(describing: rvalue)
            default:
                return false
            }
        default:
            return false
        }
    }
    
    case None
    case ExecutedCode(Error)
    case FailedTest(Error,String)
}
