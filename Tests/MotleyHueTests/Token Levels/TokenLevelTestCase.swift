//
//  TokenLevelTestCase.swift
//  
//
//  Created by Kjeld Groot on 05/09/2023.
//

import XCTest
import SwiftUI

@testable import MotleyHue

class TokenLevelTestCase<SUT: TokenLevel>: XCTestCase {
    func testDefaultValues() {}
    
    final func testInitializer() {
        let keys = ["Test1", "Test2"]
        XCTAssertEqual(SUT(keys: keys).keys, keys)
        let key = "Test"
        XCTAssertEqual(SUT(key: key).keys, [key])
    }
    
    final func testHashable() {
        let keys = ["Test1", "Test2"]
        let sut = SUT(keys: keys)
        XCTAssertEqual(sut.hashValue, keys.hashValue)
    }
    
    final func testOperators() {
        var sut1 = SUT(key: "Test1")
        let sut2 = SUT(key: "Test2")
        XCTAssertEqual(sut1.keys, ["Test1"])
        XCTAssertEqual(sut2.keys, ["Test2"])
        
        XCTAssertEqual((sut1 + sut2).keys, ["Test1", "Test2"])
        
        sut1 += sut2
        XCTAssertEqual(sut1.keys, ["Test1", "Test2"])
    }
}
