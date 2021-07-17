//
//  File.swift
//  
//
//  Created by Rui Carvalho on 10/07/2021.
//

import Foundation
import XCTest

public extension Checkable where T == Int {
    func isGreaterThanZero() throws {
        if value <= 0 {
            let message = """
the actual integer [\(value)] was expected to be positive but it is not
"""
            throw CheckError.FailedTest(CheckError.None, message)
        }
        
    }
    
    
}
