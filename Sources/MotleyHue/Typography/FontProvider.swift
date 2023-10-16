//
//  FontProvider.swift
//  
//
//  Created by Kjeld Groot on 02/06/2023.
//

#if os(macOS)
import AppKit
#else
import UIKit
#endif

public protocol FontProvider {
    var isFontScalingEnabled: Bool { get }
    
    func makeFont(family: String, weight: String, size: CGFloat) -> MHCrossPlatformFont?
}

public extension FontProvider {
    func makeFont(typography: MHTypography) -> MHCrossPlatformFont? {
        makeFont(family: typography.fontFamily, weight: typography.fontWeight, size: typography.fontSize)
    }
}
