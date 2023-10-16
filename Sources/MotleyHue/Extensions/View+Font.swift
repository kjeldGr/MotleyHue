//
//  View+Font.swift
//  
//
//  Created by Kjeld Groot on 02/06/2023.
//

import SwiftUI

public extension View {
    @ViewBuilder
    func font(
        designTokens: DesignTokens,
        context: DesignContext
    ) -> some View {
        if let typography = designTokens.typography(for: context),
           let font = designTokens.fontProvider.makeFont(typography: typography) {
            #if os(macOS)
            self
                .font(Font(font))
            #else
            modifier(
                ScaledFont(
                    font: font,
                    lineHeightMultiplier: typography.lineHeight,
                    scaled: designTokens.fontProvider.isFontScalingEnabled
                )
            )
            #endif
        } else {
            self
        }
    }
}

#if !os(macOS)
private struct ScaledFont: ViewModifier {
    private let font: MHCrossPlatformFont
    private let lineHeightMultiplier: CGFloat
    private let scaled: Bool
    
    @Environment(\.sizeCategory) private var sizeCategory
    
    init(font: MHCrossPlatformFont, lineHeightMultiplier: CGFloat, scaled: Bool) {
        self.font = font
        self.lineHeightMultiplier = lineHeightMultiplier
        self.scaled = scaled
    }
    
    @ViewBuilder
    func body(content: Content) -> some View {
        let view = content
            .font(Font(scaled ? font.scaled : font))
        if lineHeightMultiplier > 1 {
            view
                .lineSpacing(CGFloat((font.pointSize * lineHeightMultiplier) - font.lineHeight))
        } else {
            view
        }
    }
}
#endif
