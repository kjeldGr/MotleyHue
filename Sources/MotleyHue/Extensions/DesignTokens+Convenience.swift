//
//  DesignTokens+Convenience.swift
//  
//
//  Created by Kjeld Groot on 10/02/2023.
//

import SwiftUI

public extension DesignTokens {
    
    // MARK: - Helper methods
    
    func background(for context: DesignContext) -> Color? {
        color(for: context.property(.background))
    }
    
    func textColor(for context: DesignContext) -> Color? {
        color(for: context.property(.text))
    }
    
    func spacing(for context: DesignContext) -> CGFloat? {
        float(for: context.category(.spacing))
    }
    
    func padding(for context: DesignContext, edges: [Edge] = Edge.allCases) -> EdgeInsets {
        EdgeInsets(
            top: edges.contains(.top) ? padding(for: .top, context: context) : 0,
            leading: edges.contains(.leading) ? padding(for: .leading, context: context) : 0,
            bottom: edges.contains(.bottom) ? padding(for: .bottom, context: context) : 0,
            trailing: edges.contains(.trailing) ? padding(for: .trailing, context: context) : 0
        )
    }
    
    private func padding(for edge: Edge, context: DesignContext) -> CGFloat {
        switch edge {
        case .top:
            return spacing(for: context.property(.top)) ?? 0
        case .leading:
            return spacing(for: context.property(.leading)) ?? 0
        case .bottom:
            return spacing(for: context.property(.bottom)) ?? 0
        case .trailing:
            return spacing(for: context.property(.trailing)) ?? 0
        }
    }
    
    func width(for context: DesignContext) -> CGFloat? {
        float(for: context.category(.size).property(.width))
    }
    
    func height(for context: DesignContext) -> CGFloat? {
        float(for: context.category(.size).property(.height))
    }
    
    func cornerRadius(for context: DesignContext) -> CGFloat? {
        float(for: context.property(.cornerRadius))
    }
    
    func font(for context: DesignContext) -> MHCrossPlatformFont? {
        typography(for: context).flatMap {
            fontProvider.makeFont(typography: $0)
        }
    }
}
