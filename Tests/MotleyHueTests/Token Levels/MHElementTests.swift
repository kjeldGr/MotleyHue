//
//  MHElementTests.swift
//
//
//  Created by Kjeld Groot on 02/06/2023.
//

import XCTest

@testable import MotleyHue

final class MHElementTests: TokenLevelTestCase<MHElement> {
    override func testDefaultValues() {
        XCTAssertEqual(MHElement.border, MHElement(key: "border"))
        XCTAssertEqual(MHElement.indicator, MHElement(key: "indicator"))
        XCTAssertEqual(MHElement.separator, MHElement(key: "separator"))
        XCTAssertEqual(MHElement.title, MHElement(key: "title"))
        XCTAssertEqual(MHElement.subtitle, MHElement(key: "subtitle"))
        XCTAssertEqual(MHElement.description, MHElement(key: "description"))
        XCTAssertEqual(MHElement.icon, MHElement(key: "icon"))
        XCTAssertEqual(MHElement.image, MHElement(key: "image"))
    }
}
