//
//  MHStateTests.swift
//
//
//  Created by Kjeld Groot on 02/06/2023.
//

import XCTest

@testable import MotleyHue

final class MHStateTests: TokenLevelTestCase<MHState> {
    override func testDefaultValues() {
        XCTAssertEqual(MHState.default, MHState(key: "default"))
        XCTAssertEqual(MHState.highlighted, MHState(keys: ["highlighted", "active"]))
        XCTAssertEqual(MHState.disabled, MHState(key: "disabled"))
    }
}
