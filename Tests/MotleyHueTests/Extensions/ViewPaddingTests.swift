//
//  ViewPaddingTests.swift
//
//
//  Created by Kjeld Groot on 05/09/2023.
//

import XCTest
import SwiftUI

@testable import MotleyHue

final class ViewPaddingTests: SnapshotTestCase {
    override var context: DesignContext {
        DesignContext()
            .component(.item)
    }
    
    func testPaddingLeadingTopTrailingBottom() {
        assertVariantSnapshots { context in
            TestView()
                .padding(
                    designTokens: designTokens,
                    context: context,
                    edges: [.leading, .top, .trailing, .bottom]
                )
        }
    }
    
    func testPaddingLeading() {
        assertVariantSnapshots { context in
            TestView()
                .padding(
                    designTokens: designTokens,
                    context: context,
                    edges: [.leading]
                )
        }
    }
    
    func testPaddingTop() {
        assertVariantSnapshots { context in
            TestView()
                .padding(
                    designTokens: designTokens,
                    context: context,
                    edges: [.top]
                )
        }
    }
    
    func testPaddingTrailing() {
        assertVariantSnapshots { context in
            TestView()
                .padding(
                    designTokens: designTokens,
                    context: context,
                    edges: [.trailing]
                )
        }
    }
    
    func testPaddingBottom() {
        assertVariantSnapshots { context in
            TestView()
                .padding(
                    designTokens: designTokens,
                    context: context,
                    edges: [.bottom]
                )
        }
    }
}
