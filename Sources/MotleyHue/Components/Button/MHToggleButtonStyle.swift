//
//  MHToggleButtonStyle.swift
//  
//
//  Created by Kjeld Groot on 18/09/2023.
//

import SwiftUI

public struct MHToggleButtonStyle<Content: View>: ButtonStyle {

    // MARK: - Private properties
    
    @Environment(\.isEnabled) private var isEnabled
    private let isSelected: Bool
    private let body: (MHState) -> Content
    
    // MARK: - Initializers
    
    public init(
        isSelected: Bool = false,
        @ViewBuilder body: @escaping (MHState) -> Content
    ) {
        self.isSelected = isSelected
        self.body = body
    }
    
    // MARK: - ButtonStyle
    
    public func makeBody(configuration: Self.Configuration) -> some View {
        let state: MHState = {
            if !isEnabled {
                return .disabled
            } else if configuration.isPressed {
                return .highlighted
            } else {
                return isSelected ? .selected : .default
            }
        }()
        return body(state)
    }
}
