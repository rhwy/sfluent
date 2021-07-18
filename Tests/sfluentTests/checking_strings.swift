//
//  File.swift
//  
//
//  Created by Rui Carvalho on 17/07/2021.
//

import Foundation
import XCTest
import sfluent

final class Checking_Strings_Tests: XCTestCase {
    func testCheckCanBeExtendedForStringType() throws{
        try check(that: "hello").isNotEmpty()
    }
    
    func testCheckCanBeExtendedForStringType_WhenError() throws {
        try checkThatCode {
            try check(that: nil).isNotEmpty()
        }
        .throwsAnError()
        .and
        .error(is: """
=== check fail ===
the actual String was expected to not be empty but it is actually less than empty, it is NIL
""")
    }
    
    func testCheckCanBeExtendedForStringType_WhenError2() throws {
        try checkThatCode {
            try check(that: "").isNotEmpty()
        }
        .throwsAnError()
        .and
        .error(is: """
=== check fail ===
the actual String was expected to contain something but it is actually empty
""")
    }
}
