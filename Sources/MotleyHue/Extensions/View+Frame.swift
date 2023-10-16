//
//  View+Size.swift
//
//
//  Created by Kjeld Groot on 06/02/2023.
//

import SwiftUI

public enum MHDimension: CaseIterable {
    case width
    case height
}

public extension View {
    func frame(
        designTokens: DesignTokens,
        context: DesignContext,
        dimensions: [MHDimension] = MHDimension.allCases,
        alignment: Alignment = .center
    ) -> some View {
        frame(
            width: dimensions.contains(.width) ? designTokens.width(for: context) : nil,
            height: dimensions.contains(.height) ? designTokens.height(for: context) : nil,
            alignment: alignment
        )
    }
}
