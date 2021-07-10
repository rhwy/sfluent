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
    func test_it_should_allow_to_verify_that_it_doesnt_throw(){
        checkThatCode {
            throw "this should fail!"
        }.willThrowAnError()
    }
    
    func test_it_should_allow_to_verify_thrown_of_errors(){
        checkThatCode {
            //do nothing and not throw error
        }.willNotThrowAnError()
    }
    
    func test_it_should_have_a_continuation_option() {
        checkThatCode {
            throw "this should fail!"
        }.willThrowAnError().and
        
    }
    
    
    
//    func test_it_should_allow_to_verify_error_messages(){
//        checkThatCode {
//            throw "error"
//        }.willThrowAnError().and.message(is:"hello error!")
//    }
    
}




//design:
//the check should return a checkresult
//which should be also a linkable check that should
//allow to continue with another check
//here : .willThrowAnError().with(message:"this should fail")
//the with is contextual to the type
//the with carry the initial sut too

extension String : Error {}

