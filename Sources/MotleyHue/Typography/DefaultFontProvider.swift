//
//  DefaultFontProvider.swift
//  
//
//  Created by Kjeld Groot on 02/06/2023.
//

#if os(macOS)
import AppKit
#else
import UIKit
#endif

public struct DefaultFontProvider: FontProvider {
    public let isFontScalingEnabled: Bool
    
    public init(isFontScalingEnabled: Bool = true) {
        self.isFontScalingEnabled = isFontScalingEnabled
    }
    
    public func makeFont(family: String, weight: String, size: CGFloat) -> MHCrossPlatformFont? {
        let family = family.replacingOccurrences(of: " ", with: "")
        for separator in ["-", " ", ""] {
            let name = "\(family)\(separator)\(weight)"
            if let font = MHCrossPlatformFont(name: name, size: size) {
                return font
            } else if MHCrossPlatformFont.Weight(rawValue: weight) == .regular,
                      let font = MHCrossPlatformFont(name: family, size: size) {
                return font
            }
        }
        return .systemFont(ofSize: size, weight: MHCrossPlatformFont.Weight(rawValue: weight))
    }
}

// MARK: - Weight+String

private extension MHCrossPlatformFont.Weight {
    init(rawValue: String) {
        switch rawValue.lowercased() {
        case "ultralight":
            self = .ultraLight
        case "light":
            self = .light
        case "thin":
            self = .thin
        case "regular":
            self = .regular
        case "medium":
            self = .medium
        case "semibold":
            self = .semibold
        case "bold":
            self = .bold
        case "black":
            self = .black
        case "extrabold", "heavy":
            self = .heavy
        default:
            assertionFailure("Invalid system font weight: \(rawValue)")
            self = .regular
        }
    }
}
