//
//  ViewFontTests.swift
//
//
//  Created by Kjeld Groot on 05/09/2023.
//

import XCTest
import SwiftUI

@testable import MotleyHue

final class ViewFontTests: SnapshotTestCase {
    override var context: DesignContext {
        DesignContext()
            .component(.item)
    }
    
    func testFont() {
        assertVariantSnapshots { context in
            TestView(font: nil)
                .font(
                    designTokens: designTokens,
                    context: context
                )
        }
    }
}
