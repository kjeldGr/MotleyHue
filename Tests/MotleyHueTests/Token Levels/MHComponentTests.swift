//
//  MHComponentTests.swift
//  
//
//  Created by Kjeld Groot on 02/06/2023.
//

import XCTest

@testable import MotleyHue

final class MHComponentTests: TokenLevelTestCase<MHComponent> {
    override func testDefaultValues() {
        XCTAssertEqual(MHComponent.bar, MHComponent(key: "bar"))
        XCTAssertEqual(MHComponent.button, MHComponent(key: "button"))
        XCTAssertEqual(MHComponent.textField, MHComponent(key: "textField"))
        XCTAssertEqual(MHComponent.list, MHComponent(key: "list"))
        XCTAssertEqual(MHComponent.item, MHComponent(key: "item"))
    }
}
