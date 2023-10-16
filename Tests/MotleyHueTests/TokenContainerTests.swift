//
//  TokenContainerTests.swift
//  
//
//  Created by Kjeld Groot on 01/06/2023.
//

import XCTest

@testable import MotleyHue

final class TokenContainerTests: XCTestCase {
    
    private var sut: TokenContainer<CGFloat>!
    
    override func setUp() {
        super.setUp()
        
        sut = floats
        sut.clearCache()
    }
    
    override func tearDown() {
        sut = nil
        
        super.tearDown()
    }
    
    func testValue() {
        let context = DesignContext()
            .component(.button)
            .category(.spacing)
        
        XCTAssertEqual(sut.value(for: context.property(.leading)), 16)
        XCTAssertEqual(sut.value(for: context.property(.trailing)), 16)
        XCTAssertEqual(sut.value(for: context.property(.horizontal)), 16)
        XCTAssertEqual(sut.value(for: context.property(.gap)), 8)
        XCTAssertEqual(sut.value(for: context.property(.top)), 8)
        XCTAssertEqual(sut.value(for: context.property(.bottom)), 8)
        
        XCTAssertEqual(sut.value(for: context.property(.leading).keys), 16)
        XCTAssertEqual(sut.value(for: context.property(.trailing).keys), 16)
        XCTAssertEqual(sut.value(for: context.property(.horizontal).keys), 16)
        XCTAssertEqual(sut.value(for: context.property(.gap).keys), 8)
        XCTAssertEqual(sut.value(for: context.property(.top).keys), 8)
        XCTAssertEqual(sut.value(for: context.property(.bottom).keys), 8)
        
        XCTAssertNil(sut.value(for: context.variant(.primary).keys))
    }
    
    func testCache() {
        XCTAssert(sut.cache.isEmpty)
        
        let context = DesignContext()
            .component(.button)
            .category(.spacing)
        
        XCTAssertNil(sut.value(for: context.variant(.primary).keys))
        XCTAssertFalse(sut.cache.isEmpty)
        XCTAssertEqual(sut.cache.keys.count, 1)
        XCTAssert(sut.cache.keys.contains("button,spacing,padding,primary"))
        XCTAssertNil(sut.cache["button,spacing,padding,primary"].flatMap { $0 })
        
        XCTAssertEqual(sut.value(for: context.property(.leading)), 16)
        XCTAssertEqual(sut.cache.keys.count, 2)
        XCTAssert(sut.cache.keys.contains("button,spacing,padding,horizontal,leading"))
        XCTAssertEqual(sut.cache["button,spacing,padding,horizontal,leading"], 16)
        
        XCTAssertFalse(sut.cache.isEmpty)
        sut.clearCache()
        XCTAssert(sut.cache.isEmpty)
    }
}
