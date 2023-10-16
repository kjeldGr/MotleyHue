//
//  MHVariantTests.swift
//
//
//  Created by Kjeld Groot on 02/06/2023.
//

import XCTest

@testable import MotleyHue

final class MHVariantTests: TokenLevelTestCase<MHVariant> {
    override func testDefaultValues() {
        XCTAssertEqual(MHVariant.primary, MHVariant(key: "primary"))
        XCTAssertEqual(MHVariant.secondary, MHVariant(key: "secondary"))
        XCTAssertEqual(MHVariant.tertiary, MHVariant(key: "tertiary"))
    }
}
