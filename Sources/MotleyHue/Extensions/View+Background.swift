//
//  View+DesignTokens.swift
//
//
//  Created by Kjeld Groot on 11/02/2023.
//

import SwiftUI

public extension View {
    @ViewBuilder
    func background(
        designTokens: DesignTokens,
        context: DesignContext
    ) -> some View {
        if let color = designTokens.background(for: context) {
            background(color)
        } else {
            self
        }
    }
}
