//
//  ViewBorderTests.swift
//
//
//  Created by Kjeld Groot on 05/09/2023.
//

import XCTest
import SwiftUI

@testable import MotleyHue

final class ViewBorderTests: SnapshotTestCase {
    override var context: DesignContext {
        DesignContext()
            .component(.item)
    }
    
    func testBorderWithCornerRadius() {
        assertVariantSnapshots { context in
            TestView()
                .border(
                    designTokens: designTokens,
                    context: context,
                    includeCornerRadius: true
                )
        }
    }
    
    func testBorderWithoutCornerRadius() {
        assertVariantSnapshots { context in
            TestView()
                .border(
                    designTokens: designTokens,
                    context: context,
                    includeCornerRadius: false
                )
        }
    }
}
