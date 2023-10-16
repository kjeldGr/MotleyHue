//
//  MHText.swift
//  
//
//  Created by Kjeld Groot on 02/06/2023.
//

import SwiftUI

public struct MHText: View {
    
    // MARK: - Private properties
    
    @EnvironmentObject private var designTokens: DesignTokens
    
    private let text: String
    private let context: DesignContext
    
    // MARK: - Initializers
    
    public init(_ text: String, context: DesignContext) {
        self.text = text
        self.context = context
    }
    
    // MARK: - View
    
    public var body: some View {
        Text(text)
            .font(
                designTokens: designTokens,
                context: context
            )
            .foregroundColor(
                designTokens.textColor(for: context)
            )
    }
}
