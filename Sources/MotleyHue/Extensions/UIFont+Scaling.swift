//
//  UIFont+Scaling.swift
//  
//
//  Created by Kjeld Groot on 02/06/2023.
//

#if !os(macOS)
import UIKit

public extension MHCrossPlatformFont {
    var scaled: MHCrossPlatformFont {
        UIFontMetrics(forTextStyle: textStyle).scaledFont(for: self)
    }
    private var textStyle: MHCrossPlatformFont.TextStyle {
        switch pointSize {
        case ...11:
            return .caption2
        case 12:
            return .caption1
        case 13...14:
            return .footnote
        case 15:
            return .subheadline
        case 16:
            return .callout
        case 17:
            return .body
        case 18...19:
            return .headline
        case 20...21:
            return .title3
        case 22...28:
            return .title2
        case 28...34:
            return .title1
        case 34...:
            return .largeTitle
        default:
            return .body
        }
    }
}
#endif
