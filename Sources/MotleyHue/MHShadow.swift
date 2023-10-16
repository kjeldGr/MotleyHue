//
//  MHShadow.swift
//  
//
//  Created by Kjeld Groot on 07/02/2023.
//

import SwiftUI

public struct MHShadow: Equatable {
    public let color: Color
    public let radius: CGFloat
    public let x: CGFloat
    public let y: CGFloat
    
    public init(color: Color, radius: CGFloat, x: CGFloat, y: CGFloat) {
        self.color = color
        self.radius = radius
        self.x = x
        self.y = y
    }
}
