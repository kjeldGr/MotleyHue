//
//  MHIconTests.swift
//
//
//  Created by Kjeld Groot on 06/09/2023.
//

import XCTest
import SwiftUI

@testable import MotleyHue

final class MHIconTests: SnapshotTestCase {
    func testMHIcon() {
        [MHScale.extraExtraSmall, .extraSmall, .small, .medium, .large, .extraLarge, .extraExtraLarge].forEach {
            let context = context
                .component(.item)
                .scale($0)
            assertSnapshot(
                view: MHIcon(
                    image: Image(systemName: "heart"),
                    context: context
                ),
                named: $0.keys.last
            )
        }
    }
    
    @available(iOS 15.0, macOS 12.0, *)
    func testMHIconWithPalette() {
        let concept = MHConcept(key: "palette")
        let context = context
            .concept(concept)
        assertSnapshot(
            view: MHIcon(
                image: Image(systemName: "person.3.sequence.fill"),
                usePaletteColors: true,
                context: context
            ),
            named: concept.keys.last
        )
    }
}
