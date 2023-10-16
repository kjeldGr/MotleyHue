//
//  View+Padding.swift
//  
//
//  Created by Kjeld Groot on 06/06/2023.
//

import SwiftUI

public extension View {
    @ViewBuilder
    func padding(
        designTokens: DesignTokens,
        context: DesignContext,
        edges: [Edge] = Edge.allCases
    ) -> some View {
        padding(designTokens.padding(for: context, edges: edges))
    }
}
