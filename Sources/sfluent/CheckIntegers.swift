//
//  File.swift
//  
//
//  Created by Rui Carvalho on 10/07/2021.
//

import Foundation
import XCTest

public extension Checkable where T == Int {
    func isPositive() throws {
        if value <= 0 {
            let message = """
the actual integer [\(value)] was expected to be positive but it is not
"""
            throw CheckError.FailedTest(CheckError.None, message)
        }
        
    }
    
    @discardableResult func isNegative() throws -> CheckedResult<T> {
        if value >= 0 {
            let message = """

the actual integer [\(value)] was expected to be negative but it is not
"""
            
           throw CheckError.FailedTest(CheckError.None, message)
        }
        
        return CheckedResult<T>(self.value)
    }
    
    @discardableResult func isEven() throws -> CheckedResult<T> {
        if (value % 2) != 0 {
            let message = """

the actual integer [\(value)] was expected to be EVEN but it is ODD
"""
            
           throw CheckError.FailedTest(CheckError.None, message)
        }
        
        return CheckedResult<T>(self.value)
    }
    
    
}
