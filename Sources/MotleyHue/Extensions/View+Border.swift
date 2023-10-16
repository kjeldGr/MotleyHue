//
//  View+Border.swift
//  
//
//  Created by Kjeld Groot on 02/06/2023.
//

import SwiftUI

public extension View {
    @ViewBuilder
    func border(
        _ border: MHBorder,
        cornerRadius: CGFloat
    ) -> some View {
        if cornerRadius == 0 {
            overlay(Rectangle().strokeBorder(border.color, lineWidth: border.width))
        } else if cornerRadius >= 99 {
            overlay(Capsule().strokeBorder(border.color, lineWidth: border.width))
        } else {
            overlay(RoundedRectangle(cornerRadius: cornerRadius).strokeBorder(border.color, lineWidth: border.width))
        }
    }
    
    @ViewBuilder
    func border(
        designTokens: DesignTokens,
        context: DesignContext,
        includeCornerRadius: Bool = true
    ) -> some View {
        if let border = designTokens.border(for: context) {
            let cornerRadius = designTokens.cornerRadius(for: context).flatMap {
                includeCornerRadius ? $0 : nil
            } ?? 0
            self.border(border, cornerRadius: cornerRadius)
        } else {
            self
        }
    }
}
