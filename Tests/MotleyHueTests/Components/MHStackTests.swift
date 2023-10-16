//
//  MHStackTests.swift
//
//
//  Created by Kjeld Groot on 06/09/2023.
//

import XCTest
import SwiftUI

@testable import MotleyHue

final class MHStackTests: SnapshotTestCase {
    override var context: DesignContext {
        DesignContext()
            .component(.item)
            .scale(.medium)
    }
    
    func testMHStackHorizontal() {
        assertVariantSnapshots { context in
            MHStack(
                context: context
            ) { context in
                MHIcon(
                    image: Image(systemName: "plus"),
                    context: context
                )
                MHText(
                    "Stack",
                    context: context
                )
            }
        }
    }
    
    func testMHStackHorizontalLazy() {
        assertVariantSnapshots { context in
            MHStack(
                lazy: true,
                context: context
            ) { context in
                MHIcon(
                    image: Image(systemName: "plus"),
                    context: context
                )
                MHText(
                    "Stack",
                    context: context
                )
            }
        }
    }
    
    func testMHStackVertical() {
        assertVariantSnapshots { context in
            MHStack(
                axis: .vertical(),
                context: context
            ) { context in
                MHIcon(
                    image: Image(systemName: "plus"),
                    context: context
                )
                MHText(
                    "Stack",
                    context: context
                )
            }
        }
    }
    
    func testMHStackVerticalLazy() {
        assertVariantSnapshots { context in
            MHStack(
                axis: .vertical(),
                lazy: true,
                context: context
            ) { context in
                MHIcon(
                    image: Image(systemName: "plus"),
                    context: context
                )
                MHText(
                    "Stack",
                    context: context
                )
            }
        }
    }
}
