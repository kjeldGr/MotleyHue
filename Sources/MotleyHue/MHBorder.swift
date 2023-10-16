//
//  MHBorder.swift
//  
//
//  Created by Kjeld Groot on 15/02/2023.
//

import SwiftUI

public struct MHBorder: Equatable {
    public let color: Color
    public let width: CGFloat
    
    public init(color: Color, width: CGFloat) {
        self.color = color
        self.width = width
    }
}
