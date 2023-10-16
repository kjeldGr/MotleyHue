//
//  MHButton.swift
//
//
//  Created by Kjeld Groot on 04/02/2023.
//

import SwiftUI

public struct MHButton<Content: View>: View {
    
    // MARK: - SelectionStyle
    
    public enum SelectionStyle: Equatable {
        case `default`
        case toggle(isSelected: Bool = false)
        
        var isSelected: Bool {
            switch self {
            case .default:
                return false
            case let .toggle(isSelected):
                return isSelected
            }
        }
    }
    
    // MARK: - Private properties
    
    @State private var isSelected: Bool
    private let selectionStyle: SelectionStyle
    private let context: DesignContext
    private let content: (DesignContext) -> Content
    private let action: () -> Void
    
    // MARK: - Initializers
    
    public init(
        selectionStyle: SelectionStyle = .default,
        context: DesignContext = DesignContext(),
        @ViewBuilder content: @escaping (DesignContext) -> Content,
        action: @escaping () -> Void
    ) {
        self.isSelected = selectionStyle.isSelected
        self.selectionStyle = selectionStyle
        self.context = context
            .component(.button)
        self.content = content
        self.action = action
    }
    
    // MARK: - View
    
    public var body: some View {
        switch selectionStyle {
        case .default:
            Button(
                action: action,
                label: { EmptyView() }
            )
            .buttonStyle(MHButtonStyle { state in
                content(context.state(state))
            })
        case .toggle:
            let buttonStyle = MHToggleButtonStyle(
                isSelected: isSelected
            ) { state in
                content(context.state(state))
            }
            Button(
                action: {
                    action()
                    isSelected.toggle()
                },
                label: { EmptyView() }
            )
            .buttonStyle(buttonStyle)
        }
    }
}
