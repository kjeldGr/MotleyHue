//
//  MHIcon.swift
//
//
//  Created by Kjeld Groot on 04/02/2023.
//

import SwiftUI

public struct MHIcon: View {
    
    // MARK: - Public properties
    
    public let image: Image
    
    // MARK: - Private properties
    
    @EnvironmentObject private var designTokens: DesignTokens
    
    private let usePaletteColors: Bool
    private let context: DesignContext
    
    // MARK: - Initializers
    
    public init(
        image: Image,
        context: DesignContext
    ) {
        self.image = image
        self.usePaletteColors = false
        self.context = context
            .element(.icon)
    }
    
    @available(iOS 15.0, macOS 12.0, *)
    public init(
        image: Image,
        usePaletteColors: Bool,
        context: DesignContext
    ) {
        self.image = image
        self.usePaletteColors = usePaletteColors
        self.context = context
            .element(.icon)
    }
    
    // MARK: - View
    
    public var body: some View {
        image
            .apply(
                designTokens: designTokens,
                context: context,
                usePaletteColors: usePaletteColors
            )
    }
}

private extension Image {
    @ViewBuilder
    func apply(
        designTokens: DesignTokens,
        context: DesignContext,
        usePaletteColors: Bool
    ) -> some View {
        if #available(iOS 15.0, macOS 12.0, *),
           usePaletteColors {
            applyPaletteColors(
                designTokens: designTokens,
                context: context
            )
        } else {
            apply(
                color: designTokens.color(for: context),
                designTokens: designTokens,
                context: context
            )
        }
    }
    
    @ViewBuilder
    private func apply(
        color: Color?,
        designTokens: DesignTokens,
        context: DesignContext
    ) -> some View {
        resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(color)
            .frame(designTokens: designTokens, context: context)
    }
    
    @available(iOS 15.0, macOS 12.0, *)
    @ViewBuilder
    private func applyPaletteColors(
        designTokens: DesignTokens,
        context: DesignContext
    ) -> some View {
        let primary = designTokens.color(
            for: context
                .variant(.primary)
        )
        let secondary = designTokens.color(
            for: context
                .variant(.secondary)
        )
        let tertiary = designTokens.color(
            for: context
                .variant(.tertiary)
        )
        let fontSize: CGFloat? = {
            let width = designTokens.width(for: context)
            let height = designTokens.height(for: context)
            switch (width, height) {
            case let (width?, height?):
                return max(width, height)
            case let (width?, .none):
                return width
            case let (.none, height?):
                return height
            case (.none, .none):
                return nil
            }
        }()
        let font = fontSize.flatMap { Font.system(size: $0) }
        let view = symbolRenderingMode(.palette).font(font)
        switch (primary, secondary, tertiary) {
        case let (primary?, secondary?, tertiary?):
            view
                .foregroundStyle(primary, secondary, tertiary)
        case let (primary?, secondary?, .none):
            view
                .foregroundStyle(primary, secondary)
        case let (primary?, .none, .none):
            view
                .foregroundStyle(primary)
        default:
            apply(
                color: designTokens.color(for: context),
                designTokens: designTokens,
                context: context
            )
        }
    }
}
