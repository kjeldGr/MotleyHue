//
//  ViewDesignTokensTests.swift
//  
//
//  Created by Kjeld Groot on 05/09/2023.
//

import XCTest
import SwiftUI

@testable import MotleyHue

final class ViewDesignTokensTests: SnapshotTestCase {
    override var context: DesignContext {
        DesignContext()
            .component(.item)
    }
    
    func testDesignTokensAllProperties() {
        assertVariantSnapshots { context in
            TestView(font: nil)
                .apply(
                    designTokens: designTokens,
                    context: context
                )
        }
    }
    
    func testDesignTokensPadding() {
        assertVariantSnapshots { context in
            TestView(font: nil)
                .apply(
                    designTokens: designTokens,
                    context: context,
                    properties: [.padding()]
                )
        }
    }
    
    func testDesignTokensCornerRadius() {
        assertVariantSnapshots { context in
            TestView(font: nil)
                .apply(
                    designTokens: designTokens,
                    context: context,
                    properties: [.cornerRadius]
                )
        }
    }
    
    func testDesignTokensSize() {
        assertVariantSnapshots { context in
            TestView(font: nil)
                .apply(
                    designTokens: designTokens,
                    context: context,
                    properties: [.size()]
                )
        }
    }
    
    func testDesignTokensBackground() {
        assertVariantSnapshots { context in
            TestView(font: nil)
                .apply(
                    designTokens: designTokens,
                    context: context,
                    properties: [.background]
                )
        }
    }
    
    func testDesignTokensBorder() {
        assertVariantSnapshots { context in
            TestView(font: nil)
                .apply(
                    designTokens: designTokens,
                    context: context,
                    properties: [.border]
                )
        }
    }
    
    func testDesignTokensShadow() {
        assertVariantSnapshots { context in
            TestView(font: nil)
                .apply(
                    designTokens: designTokens,
                    context: context,
                    properties: [.shadow]
                )
        }
    }
    
    func testDesignTokensIgnoringPadding() {
        assertVariantSnapshots { context in
            TestView(font: nil)
                .apply(
                    designTokens: designTokens,
                    context: context,
                    ignoring: [.padding()]
                )
        }
    }
    
    func testDesignTokensIgnoringCornerRadius() {
        assertVariantSnapshots { context in
            TestView(font: nil)
                .apply(
                    designTokens: designTokens,
                    context: context,
                    ignoring: [.cornerRadius]
                )
        }
    }
    
    func testDesignTokensIgnoringSize() {
        assertVariantSnapshots { context in
            TestView(font: nil)
                .apply(
                    designTokens: designTokens,
                    context: context,
                    ignoring: [.size()]
                )
        }
    }
    
    func testDesignTokensIgnoringBackground() {
        assertVariantSnapshots { context in
            TestView(font: nil)
                .apply(
                    designTokens: designTokens,
                    context: context,
                    ignoring: [.background]
                )
        }
    }
    
    func testDesignTokensIgnoringBorder() {
        assertVariantSnapshots { context in
            TestView(font: nil)
                .apply(
                    designTokens: designTokens,
                    context: context,
                    ignoring: [.border]
                )
        }
    }
    
    func testDesignTokensIgnoringShadow() {
        assertVariantSnapshots { context in
            TestView(font: nil)
                .apply(
                    designTokens: designTokens,
                    context: context,
                    ignoring: [.shadow]
                )
        }
    }
}
