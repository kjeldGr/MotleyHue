//
//  ViewFrameTests.swift
//
//
//  Created by Kjeld Groot on 05/09/2023.
//

import XCTest
import SwiftUI

@testable import MotleyHue

final class ViewFrameTests: SnapshotTestCase {
    override var context: DesignContext {
        DesignContext()
            .component(.item)
    }
    
    func testFrameWidthHeight() {
        assertVariantSnapshots { context in
            TestView()
                .frame(
                    designTokens: designTokens,
                    context: context
                )
        }
    }
    
    func testFrameWidth() {
        assertVariantSnapshots { context in
            TestView()
                .frame(
                    designTokens: designTokens,
                    context: context,
                    dimensions: [.width]
                )
        }
    }
    
    func testFrameHeight() {
        assertVariantSnapshots { context in
            TestView()
                .frame(
                    designTokens: designTokens,
                    context: context,
                    dimensions: [.height]
                )
        }
    }
}
