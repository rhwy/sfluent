//
//  File.swift
//  
//
//  Created by Rui Carvalho on 17/07/2021.
//

import Foundation
import XCTest
import sfluent

final class Checking_Integers_tests: XCTestCase {
    func test_when_it_should_be_positive_and_it_is() throws{
        try check(that: 1).isPositive()
    }
    
    
    func test_when_it_should_be_positive_and_it_is_not() throws {
        try checkThatCode {
            try check(that: -42).isPositive()
        }
        .throwsAnError()
        .and
        .error(is: """
=== check fail ===
the actual integer [-42] was expected to be positive but it is not
""")
        
    }
    
    func test_when_it_should_be_negative_and_it_is() throws {
        try check(that: -1).isNegative()
    }
    
    func test_when_it_should_be_negative_and_it_is_not() throws {
        try checkThatCode {
            try check(that: 42).isNegative()
        }
        .throwsAnError()
        .and
        .error(is: """
=== check fail ===

the actual integer [42] was expected to be negative but it is not
""")
    }
    
    func test_chain_many_checks() throws {
        try check(that: 42).isNegative().and
    }
}
