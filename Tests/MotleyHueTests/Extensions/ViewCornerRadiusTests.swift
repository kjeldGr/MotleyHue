//
//  ViewCornerRadiusTests.swift
//
//
//  Created by Kjeld Groot on 05/09/2023.
//

import XCTest
import SwiftUI

@testable import MotleyHue

final class ViewCornerRadiusTests: SnapshotTestCase {
    override var context: DesignContext {
        DesignContext()
            .component(.item)
    }
    
    func testCornerRadius() {
        assertVariantSnapshots { context in
            TestView()
                .background(
                    designTokens: designTokens,
                    context: context
                )
                .cornerRadius(
                    designTokens: designTokens,
                    context: context
                )
        }
    }
}
