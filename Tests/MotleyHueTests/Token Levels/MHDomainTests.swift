//
//  MHDomainTests.swift
//
//
//  Created by Kjeld Groot on 02/06/2023.
//

import XCTest

@testable import MotleyHue

final class MHDomainTests: TokenLevelTestCase<MHDomain> {
    override func testDefaultValues() {
        XCTAssertEqual(MHDomain.tab, MHDomain(key: "tab"))
        XCTAssertEqual(MHDomain.navigation, MHDomain(key: "navigation"))
    }
}
