//
//  View+CornerRadius.swift
//  
//
//  Created by Kjeld Groot on 04/08/2023.
//

import SwiftUI

public extension View {
    @ViewBuilder
    func cornerRadius(
        designTokens: DesignTokens,
        context: DesignContext
    ) -> some View {
        if let cornerRadius = designTokens.cornerRadius(for: context), cornerRadius > 0 {
            if cornerRadius >= 99 {
                clipShape(Capsule())
            } else {
                clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            }
        } else {
            self
        }
    }
}
