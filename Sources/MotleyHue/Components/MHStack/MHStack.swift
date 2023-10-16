//
//  MHStack.swift
//  
//
//  Created by Kjeld Groot on 02/06/2023.
//

import SwiftUI

public struct MHStack<Content: View>: View {
    
    // MARK: - Axis
    
    public enum Axis: Equatable {
        case horizontal(VerticalAlignment = .center)
        case vertical(HorizontalAlignment = .center)
        
        var property: MHProperty {
            switch self {
            case .horizontal:
                return .horizontal
            case .vertical:
                return .vertical
            }
        }
    }
    
    // MARK: - Public properties
    
    public let axis: Axis
    public let lazy: Bool
    
    // MARK: - Private properties
    
    @EnvironmentObject private var designTokens: DesignTokens
    
    private let properties: [DesignTokenProperty]
    private let context: DesignContext
    private let content: (DesignContext) -> Content
    
    // MARK: - Computed properties
    
    private var gapSpacing: CGFloat {
        designTokens.spacing(
            for: context
                .property(.gap)
                .property(axis.property)
        ) ?? 0
    }
    
    // MARK: - Initializers
    
    public init(
        axis: Axis = .horizontal(),
        lazy: Bool = false,
        properties: [DesignTokenProperty] = DesignTokenProperty.allCases,
        context: DesignContext,
        @ViewBuilder content: @escaping (DesignContext) -> Content
    ) {
        self.axis = axis
        self.lazy = lazy
        self.properties = properties
        self.context = context
        self.content = content
    }
    
    public init(
        axis: Axis = .horizontal(),
        lazy: Bool = false,
        ignoring: [DesignTokenProperty],
        context: DesignContext,
        @ViewBuilder content: @escaping (DesignContext) -> Content
    ) {
        self.init(
            axis: axis,
            lazy: lazy,
            properties: DesignTokenProperty.allCases.filter {
                !ignoring.contains($0)
            },
            context: context,
            content: content
        )
    }
    
    // MARK: - View
    
    public var body: some View {
        ZStack {
            switch (axis, lazy) {
            case let (.horizontal(alignment), false):
                HStack(
                    alignment: alignment,
                    spacing: gapSpacing
                ) {
                    content(context)
                }
            case let (.horizontal(alignment), true):
                LazyHStack(
                    alignment: alignment,
                    spacing: gapSpacing
                ) {
                    content(context)
                }
            case let (.vertical(alignment), false):
                VStack(
                    alignment: alignment,
                    spacing: gapSpacing
                ) {
                    content(context)
                }
            case let (.vertical(alignment), true):
                LazyVStack(
                    alignment: alignment,
                    spacing: gapSpacing
                ) {
                    content(context)
                }
            }
        }
        .apply(
            designTokens: designTokens,
            context: context,
            properties: properties
        )
    }
}
