//
//  View+DesignTokens.swift
//  
//
//  Created by Kjeld Groot on 16/06/2023.
//

import SwiftUI

public enum DesignTokenProperty: Equatable, Hashable, CaseIterable {
    case padding([Edge] = Edge.allCases)
    case cornerRadius
    case size([MHDimension] = MHDimension.allCases)
    case background
    case border
    case shadow
    
    public static let allCases: [DesignTokenProperty] = [
        .padding(), .cornerRadius, .size(), .background, .border, .shadow
    ]
}

public extension View {
    func apply(
        designTokens: DesignTokens,
        context: DesignContext,
        properties: [DesignTokenProperty] = DesignTokenProperty.allCases
    ) -> some View {
        let edges = properties.flatMap {
            if case let .padding(edges) = $0 {
                return edges
            } else {
                return []
            }
        }
        var view: AnyView = AnyView(padding(
            designTokens: designTokens,
            context: context,
            edges: edges
        ))
        let dimensions = properties.flatMap {
            if case let .size(dimensions) = $0 {
                return dimensions
            } else {
                return []
            }
        }
        view = AnyView(view.frame(
            designTokens: designTokens,
            context: context,
            dimensions: dimensions
        ))
        if properties.contains(.background) {
            view = AnyView(view.background(
                designTokens: designTokens,
                context: context
            ))
        }
        if properties.contains(.cornerRadius) {
            view = AnyView(view.cornerRadius(
                designTokens: designTokens,
                context: context
            ))
        }
        if properties.contains(.border) {
            view = AnyView(view.border(
                designTokens: designTokens,
                context: context,
                includeCornerRadius: properties.contains(.cornerRadius)
            ))
        }
        if properties.contains(.shadow) {
            view = AnyView(view.shadow(
                designTokens: designTokens,
                context: context,
                includeCornerRadius: properties.contains(.cornerRadius)
            ))
        }
        
        return view
    }
    
    func apply(
        designTokens: DesignTokens,
        context: DesignContext,
        ignoring: [DesignTokenProperty]
    ) -> some View {
        apply(
            designTokens: designTokens,
            context: context,
            properties: DesignTokenProperty.allCases.filter { !ignoring.contains($0) }
        )
    }
}
