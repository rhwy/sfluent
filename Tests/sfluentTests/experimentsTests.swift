//
//  File.swift
//  
//
//  Created by Rui Carvalho on 18/07/2021.
//

import Foundation
import XCTest
import sfluent

final class experimentsTests: XCTestCase {
    func test_it_should_extend_protocols_with_generics() throws {
        try CheckInit("hello").isEqualTo("hello")
        try
            ensure(that: 42)
            .isPositive()
            .isEqualTo(42)
    }
}
