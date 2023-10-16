//
//  MHTextTests.swift
//
//
//  Created by Kjeld Groot on 06/09/2023.
//

import XCTest
import SwiftUI

@testable import MotleyHue

final class MHTextTests: SnapshotTestCase {
    override var context: DesignContext {
        DesignContext()
            .component(.item)
    }
    
    func testMHText() {
        assertVariantSnapshots { context in
            MHText(
                "Text",
                context: context
            )
            .fixedSize()
        }
    }
}
