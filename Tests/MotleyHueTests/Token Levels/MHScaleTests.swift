//
//  MHScaleTests.swift
//
//
//  Created by Kjeld Groot on 02/06/2023.
//

import XCTest

@testable import MotleyHue

final class MHScaleTests: TokenLevelTestCase<MHScale> {
    override func testDefaultValues() {
        XCTAssertEqual(MHScale.extraExtraSmall, MHScale(keys: ["xxs", "extraExtraSmall"]))
        XCTAssertEqual(MHScale.extraSmall, MHScale(keys: ["xs", "extraSmall"]))
        XCTAssertEqual(MHScale.small, MHScale(keys: ["s", "small"]))
        XCTAssertEqual(MHScale.medium, MHScale(keys: ["m", "medium"]))
        XCTAssertEqual(MHScale.large, MHScale(keys: ["l", "large"]))
        XCTAssertEqual(MHScale.extraLarge, MHScale(keys: ["xl", "extraLarge"]))
        XCTAssertEqual(MHScale.extraExtraLarge, MHScale(keys: ["xxl", "extraExtraLarge"]))
    }
}
