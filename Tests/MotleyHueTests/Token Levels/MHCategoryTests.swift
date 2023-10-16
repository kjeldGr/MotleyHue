//
//  MHCategoryTests.swift
//  
//
//  Created by Kjeld Groot on 02/06/2023.
//

import XCTest

@testable import MotleyHue

final class MHCategoryTests: TokenLevelTestCase<MHCategory> {
    override func testDefaultValues() {
        XCTAssertEqual(MHCategory.color, MHCategory(key: "color"))
        XCTAssertEqual(MHCategory.typography, MHCategory(keys: ["typography", "font"]))
        XCTAssertEqual(MHCategory.spacing, MHCategory(keys: ["spacing", "padding"]))
        XCTAssertEqual(MHCategory.size, MHCategory(keys: ["size", "sizing"]))
        XCTAssertEqual(MHCategory.shadow, MHCategory(key: "shadow"))
    }
}
