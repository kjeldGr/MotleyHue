//
//  SnapshotTestCase.swift
//  
//
//  Created by Kjeld Groot on 05/09/2023.
//

import XCTest
import SwiftUI
import SnapshotTesting

@testable import MotleyHue

class SnapshotTestCase: XCTestCase {
    let designTokens: DesignTokens = .makeDesignTokens(typographyFormat: .typography, borderFormat: .border)
    var context: DesignContext {
        DesignContext()
    }
    
    final func assertVariantSnapshots<Content: View>(
        record: Bool = false,
        @ViewBuilder view: (DesignContext) -> Content,
        file: StaticString = #file,
        testName: String = #function,
        line: UInt = #line
    ) {
        [MHVariant.primary, .secondary, .tertiary].forEach {
            let context = context
                .variant($0)
            assertSnapshot(
                view: view(context),
                named: $0.keys.first,
                record: record,
                file: file,
                testName: testName,
                line: line
            )
        }
    }
    
    final func assertSnapshot<Content: View>(
        view: Content,
        named: String?,
        record: Bool = false,
        file: StaticString = #file,
        testName: String = #function,
        line: UInt = #line
    ) {
        let suffix: String
        #if os(macOS)
        suffix = "macOS"
        #else
        suffix = "iOS@\(Int(UIScreen.main.scale))x"
        #endif
        SnapshotTesting.assertSnapshot(
            of: makeHostingController(
                view: view
                    .padding(24)
                    .environmentObject(designTokens)
            ),
            as: .image,
            named: named.flatMap { "\($0).\(suffix)" } ?? suffix,
            record: record,
            file: file,
            testName: testName,
            line: line
        )
    }
    
    private func makeHostingController<Content: View>(view: Content) -> MHCrossPlatformHostingController<Content> {
        let hostingController = MHCrossPlatformHostingController(rootView: view)
        #if os(macOS)
        hostingController.view.frame = NSRect(origin: .zero, size: hostingController.view.fittingSize)
        #endif
        return hostingController
    }
}
