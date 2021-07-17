//
//  File.swift
//  
//
//  Created by Rui Carvalho on 10/07/2021.
//

import Foundation
import XCTest


public extension Checkable where T == String? {
    func isNotEmpty() throws {
        if value == nil {
            let message = """
the actual String was expected to not be empty but it is actually less than empty, it is NIL
"""
            throw CheckError.FailedTest(CheckError.None, message)
        }
        
        let existingValue = value! as String
        if existingValue.count <= 0 {
            let message = """
the actual String was expected to contain something but it is actually empty
"""
            throw CheckError.FailedTest(CheckError.None, message)
        }
        
    }
}

