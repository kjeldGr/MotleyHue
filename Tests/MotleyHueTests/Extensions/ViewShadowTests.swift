//
//  ViewShadowTests.swift
//
//
//  Created by Kjeld Groot on 05/09/2023.
//

import XCTest
import SwiftUI

@testable import MotleyHue

final class ViewShadowTests: SnapshotTestCase {
    override var context: DesignContext {
        DesignContext()
            .component(.item)
    }
    
    func testShadowWithCornerRadius() {
        assertVariantSnapshots { context in
            TestView()
                .shadow(
                    designTokens: designTokens,
                    context: context,
                    includeCornerRadius: true
                )
        }
    }
    
    func testShadowWithoutCornerRadius() {
        assertVariantSnapshots { context in
            TestView()
                .shadow(
                    designTokens: designTokens,
                    context: context,
                    includeCornerRadius: false
                )
        }
    }
    
    func testHiddenShadow() {
        let variant = MHVariant(key: "hiddenShadow")
        let context = context
            .variant(variant)
        assertSnapshot(
            view: TestView()
                .shadow(
                    designTokens: designTokens,
                    context: context
                ),
            named: variant.keys.first
        )
    }
}
