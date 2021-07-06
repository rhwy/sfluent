//
//  File.swift
//  
//
//  Created by Rui Carvalho on 06/07/2021.
//

import Foundation
import XCTest
@testable import sfluent

final class errorHandlingDesignTests: XCTestCase {
    func testCodeExecutionThatShouldThrowAnError(){
        checkThatCode {
            throw "this should fail!"
        }.willThrowAnError()
    }
    
    func testCodeExecutionThatShouldNotThrowErrors(){
        checkThatCode {
            //do nothing and not throw error
        }.willNotThrowAnError()
    }
}

extension String : Error {}

