//
//  File.swift
//  
//
//  Created by Rui Carvalho on 10/07/2021.
//

import Foundation
import XCTest

public extension Checkable where T == Int {
    func isGreaterThanZero() {
        XCTAssertGreaterThan(value,0)
    }
}
