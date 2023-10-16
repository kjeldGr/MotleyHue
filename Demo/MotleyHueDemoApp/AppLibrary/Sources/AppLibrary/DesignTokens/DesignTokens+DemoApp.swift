//
//  DesignTokens+DemoApp.swift
//  
//
//  Created by Kjeld Groot on 10/09/2023.
//

import MotleyHue

public extension DesignTokens {
    static var demo: DesignTokens {
        DesignTokens(
            colors: colors,
            floats: floats,
            strings: strings,
            typographies: typographies,
            borders: borders,
            shadows: shadows
        )
    }
}
