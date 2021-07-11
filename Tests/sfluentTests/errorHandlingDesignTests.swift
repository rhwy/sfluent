//
//  File.swift
//  
//
//  Created by Rui Carvalho on 06/07/2021.
//

import Foundation
import XCTest
@testable import sfluent

final class WhenCheckingSomeCodeToExecute: XCTestCase {
    func test_it_should_allow_to_verify_that_it_doesnt_throw() throws{
        try checkThatCode {
            throw "this should fail!"
        }.throwsAnError()
    }
    func test_it_should_allow_to_verify_that_it_doesnt_throw_double_check() throws{
        try checkThatCode {
            try checkThatCode {
                //because we're supposed to throw and error and it we don't throw, it should catch that error
            }.throwsAnError()
        }.throwsAnError()
        
    }
    
    func test_it_should_allow_to_verify_thrown_of_errors() throws {
        try checkThatCode {
            //do nothing and not throw error
            //...but uncomment below to make it red to verify
            //throw "you should not pass!"
        }.dontThrowAnError()
    }
    
    func test_it_should_allow_to_verify_thrown_of_error_double_check() throws {
        try checkThatCode {
            try checkThatCode {
                throw "you should not pass!"
            }.dontThrowAnError()
        }.throwsAnError()
    }
    
    
    func test_it_should_be_able_to_verify_the_error_message() throws {
        try checkThatCode {
            throw "this should fail!"
        }
        .throwsAnError()
        .and
        .error(is:"this should fail!")
        
    }
    
    func test_it_should_catch_other_types_of_errors() throws {
        try checkThatCode {
            throw FakeError.A
        }
        .throwsAnError()
        .and
        .error(is: FakeError.A)
    }
}

public enum FakeError : Error {
    case A, B
}


//design:
//the check should return a checkresult
//which should be also a linkable check that should
//allow to continue with another check
//here : .willThrowAnError().with(message:"this should fail")
//the with is contextual to the type
//the with carry the initial sut too



