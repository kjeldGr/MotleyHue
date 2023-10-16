//
//  MHPropertyTests.swift
//
//
//  Created by Kjeld Groot on 02/06/2023.
//

import XCTest

@testable import MotleyHue

final class MHPropertyTests: TokenLevelTestCase<MHProperty> {
    override func testDefaultValues() {
        XCTAssertEqual(MHProperty.text, MHProperty(key: "text"))
        XCTAssertEqual(MHProperty.background, MHProperty(key: "background"))
        XCTAssertEqual(MHProperty.width, MHProperty(key: "width"))
        XCTAssertEqual(MHProperty.height, MHProperty(key: "height"))
        XCTAssertEqual(MHProperty.gap, MHProperty(key: "gap"))
        XCTAssertEqual(MHProperty.horizontal, MHProperty(key: "horizontal"))
        XCTAssertEqual(MHProperty.vertical, MHProperty(key: "vertical"))
        XCTAssertEqual(MHProperty.leading, MHProperty(keys: ["horizontal", "leading"]))
        XCTAssertEqual(MHProperty.trailing, MHProperty(keys: ["horizontal", "trailing"]))
        XCTAssertEqual(MHProperty.top, MHProperty(keys: ["vertical", "top"]))
        XCTAssertEqual(MHProperty.bottom, MHProperty(keys: ["vertical", "bottom"]))
        XCTAssertEqual(MHProperty.cornerRadius, MHProperty(keys: ["cornerRadius", "borderRadius", "radius"]))
    }
}
