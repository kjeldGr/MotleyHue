//
//  ViewBackgroundTests.swift
//  
//
//  Created by Kjeld Groot on 05/09/2023.
//

import XCTest
import SwiftUI

@testable import MotleyHue

final class ViewBackgroundTests: SnapshotTestCase {
    override var context: DesignContext {
        DesignContext()
            .component(.item)
    }
    
    func testBackground() {
        assertVariantSnapshots { context in
            TestView()
                .background(
                    designTokens: designTokens,
                    context: context
                )
        }
    }
}
