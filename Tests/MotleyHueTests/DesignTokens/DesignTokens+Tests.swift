//
//  DesignTokens+Tests.swift
//  
//
//  Created by Kjeld Groot on 10/09/2023.
//

import MotleyHue

extension DesignTokens {
    static func makeDesignTokens(
        typographyFormat: TypographyFormat,
        borderFormat: BorderFormat
    ) -> DesignTokens {
        DesignTokens(
            fontProvider: DefaultFontProvider(isFontScalingEnabled: false),
            typographyFormat: typographyFormat,
            borderFormat: borderFormat,
            colors: colors,
            floats: floats,
            strings: strings,
            typographies: typographies,
            borders: borders,
            shadows: shadows
        )
    }
}
