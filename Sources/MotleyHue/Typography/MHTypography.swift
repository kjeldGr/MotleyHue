//
//  MHTypography.swift
//  
//
//  Created by Kjeld Groot on 15/02/2023.
//

import SwiftUI

public struct MHTypography: Equatable {
    public let fontFamily: String
    public let fontWeight: String
    public let fontSize: CGFloat
    public let lineHeight: CGFloat
    
    public init(fontFamily: String, fontWeight: String, fontSize: CGFloat, lineHeight: CGFloat) {
        self.fontFamily = fontFamily
        self.fontWeight = fontWeight
        self.fontSize = fontSize
        self.lineHeight = lineHeight
    }
}
