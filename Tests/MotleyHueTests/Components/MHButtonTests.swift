//
//  MHButtonTests.swift
//  
//
//  Created by Kjeld Groot on 06/09/2023.
//

import XCTest
import SwiftUI

@testable import MotleyHue

final class MHButtonTests: SnapshotTestCase {
    func testMHButtonDefault() {
        assertVariantSnapshots { context in
            Self.makeButton(selectionStyle: .default, context: context)
        }
    }
    
    func testMHButtonHighlighted() {
        assertVariantSnapshots { context in
            Self.makeButton(selectionStyle: .default, context: context) { context in
                context.state(.highlighted)
            }
        }
    }
    
    func testMHButtonDisabled() {
        assertVariantSnapshots { context in
            Self.makeButton(selectionStyle: .default, context: context)
                .disabled(true)
        }
    }
    
    func testToggleMHButtonDefault() {
        assertVariantSnapshots { context in
            Self.makeButton(selectionStyle: .toggle(isSelected: false), context: context)
        }
    }
    
    func testToggleMHButtonHighlighted() {
        assertVariantSnapshots { context in
            Self.makeButton(selectionStyle: .toggle(isSelected: false), context: context) { context in
                context.state(.highlighted)
            }
        }
    }
    
    func testToggleMHButtonDisabled() {
        assertVariantSnapshots { context in
            Self.makeButton(selectionStyle: .toggle(isSelected: false), context: context)
                .disabled(true)
        }
    }
    
    func testToggleMHButtonSelected() {
        assertVariantSnapshots { context in
            Self.makeButton(selectionStyle: .toggle(isSelected: true), context: context) { context in
                context.state(.highlighted)
            }
        }
    }
    
    @ViewBuilder
    private static func makeButton(
        selectionStyle: MHButton<MHStack<TupleView<(MHIcon, MHText)>>>.SelectionStyle,
        context: DesignContext,
        contextModifier: @escaping (DesignContext) -> DesignContext = { $0 }
    ) -> some View {
        MHButton(
            selectionStyle: selectionStyle,
            context: context,
            content: { context in
                let context = contextModifier(context)
                MHStack(
                    context: context
                ) { context in
                    MHIcon(
                        image: Image(systemName: "circle"),
                        context: context
                    )
                    MHText(
                        "Button",
                        context: context
                            .element(.title)
                    )
                }
            },
            action: {}
        )
    }
}
