//
//  MHButtonStyle.swift
//
//
//  Created by Kjeld Groot on 04/02/2023.
//

import SwiftUI

public struct MHButtonStyle<Content: View>: ButtonStyle {

    // MARK: - Private properties
    
    @Environment(\.isEnabled) private var isEnabled
    private let body: (MHState) -> Content
    
    // MARK: - Initializers
    
    public init(
        @ViewBuilder body: @escaping (MHState) -> Content
    ) {
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
                return .default
            }
        }()
        return body(state)
    }
}
