//
//  DesignTokens.swift
//
//
//  Created by Kjeld Groot on 07/02/2023.
//

import SwiftUI

public final class DesignTokens: ObservableObject {
    
    // MARK: - FontFormat
    
    public enum TypographyFormat {
        case typography
        case components
    }
    
    // MARK: - BorderFormat
    
    public enum BorderFormat {
        case border
        case components
    }
    
    // MARK: - Public properties
    
    public let fontProvider: FontProvider
    
    // MARK: - Internal properties
    
    let typographyFormat: TypographyFormat
    let borderFormat: BorderFormat
    
    let colors: TokenContainer<Color>
    let floats: TokenContainer<CGFloat>
    let strings: TokenContainer<String>
    let typographies: TokenContainer<MHTypography>
    let borders: TokenContainer<MHBorder>
    let shadows: TokenContainer<MHShadow>
    
    // MARK: - Initializers
    
    public init(
        fontProvider: FontProvider = DefaultFontProvider(),
        typographyFormat: TypographyFormat = .typography,
        borderFormat: BorderFormat = .border,
        colors: TokenContainer<Color>,
        floats: TokenContainer<CGFloat>,
        strings: TokenContainer<String>,
        typographies: TokenContainer<MHTypography>,
        borders: TokenContainer<MHBorder>,
        shadows: TokenContainer<MHShadow>
    ) {
        self.fontProvider = fontProvider
        self.typographyFormat = typographyFormat
        self.borderFormat = borderFormat
        self.colors = colors
        self.floats = floats
        self.strings = strings
        self.typographies = typographies
        self.borders = borders
        self.shadows = shadows
    }
    
    // MARK: - Public methods
    
    public func color(for context: DesignContext) -> Color? {
        colors.value(for: context.category(.color))
    }
    
    public func float(for context: DesignContext) -> CGFloat? {
        floats.value(for: context)
    }
    
    public func string(for context: DesignContext) -> String? {
        strings.value(for: context)
    }
    
    public func typography(for context: DesignContext) -> MHTypography? {
        let context = context.category(.typography)
        switch typographyFormat {
        case .typography:
            return typographies.value(for: context)
        case .components:
            guard let fontFamily = string(for: context.category(.typography).property(.fontFamily)),
                  let fontSize = float(for: context.category(.typography).property(.fontSize)) else {
                return nil
            }
            return MHTypography(
                fontFamily: fontFamily,
                fontWeight: string(for: context.category(.typography).property(.fontWeight)) ?? "Regular",
                fontSize: fontSize,
                lineHeight: float(for: context.category(.typography).property(.lineHeight)) ?? 1
            )
        }
    }
    
    public func border(for context: DesignContext) -> MHBorder? {
        let context = context.element(.border)
        switch borderFormat {
        case .border:
            return borders.value(for: context)
        case .components:
            guard let color = color(for: context),
                  let width = float(for: context.property(.borderWidth)) else {
                return nil
            }
            return MHBorder(color: color, width: width)
        }
        
    }
    
    public func shadow(for context: DesignContext) -> MHShadow? {
        shadows.value(for: context.category(.shadow))
    }
    
    public func clearCache() {
        colors.clearCache()
        floats.clearCache()
        strings.clearCache()
        typographies.clearCache()
        borders.clearCache()
        shadows.clearCache()
    }
}
