//
//  View+Shadow.swift
//  
//
//  Created by Kjeld Groot on 07/02/2023.
//

import SwiftUI

public extension View {
    @ViewBuilder
    func shadow(
        _ shadow: MHShadow,
        cornerRadius: CGFloat
    ) -> some View {
        if opacity(for: shadow.color) == 0 {
            self
        } else if cornerRadius == 0 {
            background(
                Rectangle()
                    .shadow(color: shadow.color, radius: shadow.radius, x: shadow.x, y: shadow.y)
            )
        } else if cornerRadius >= 99 {
            background(
                Capsule()
                    .shadow(color: shadow.color, radius: shadow.radius, x: shadow.x, y: shadow.y)
            )
        } else {
            background(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .shadow(color: shadow.color, radius: shadow.radius, x: shadow.x, y: shadow.y)
            )
        }
    }
    
    @ViewBuilder
    func shadow(
        designTokens: DesignTokens,
        context: DesignContext,
        includeCornerRadius: Bool = true
    ) -> some View {
        if let shadow = designTokens.shadow(for: context) {
            let cornerRadius = designTokens.cornerRadius(for: context).flatMap {
                includeCornerRadius ? $0 : nil
            } ?? 0
            self.shadow(shadow, cornerRadius: cornerRadius)
        } else {
            self
        }
    }
    
    private func opacity(for color: Color) -> CGFloat {
        MHCrossPlatformColor(color).cgColor.alpha
    }
}
