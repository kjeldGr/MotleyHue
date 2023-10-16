//
//  DesignContext.swift
//
//
//  Created by Kjeld Groot on 07/02/2023.
//

import Foundation

public struct DesignContext: Equatable {
    
    // MARK: - Internal properties
    
    var keys: [String] {
        let values: [[(any TokenLevel)?]] = [
            [system],
            [theme],
            [domain],
            [group],
            components,
            elements,
            [category],
            [concept],
            properties,
            [variant],
            [state],
            [scale],
            [mode]
        ]
        return values.flatMap({ $0 }).flatMap { $0?.keys ?? [] }
    }
    
    // MARK: - Initializers
    
    public init() {}
    
    // MARK: - Token levels
    
    public private(set) var system: MHSystem?
    public private(set) var theme: MHTheme?
    public private(set) var domain: MHDomain?
    public private(set) var group: MHGroup?
    public private(set) var components: [MHComponent] = []
    public private(set) var elements: [MHElement] = []
    public private(set) var category: MHCategory?
    public private(set) var concept: MHConcept?
    public private(set) var properties: [MHProperty] = []
    public private(set) var variant: MHVariant?
    public private(set) var state: MHState?
    public private(set) var scale: MHScale?
    public private(set) var mode: MHMode?
    
    public func system(_ system: MHSystem) -> Self {
        var context = self
        context.system = system
        return context
    }
    
    public func theme(_ theme: MHTheme) -> Self {
        var context = self
        context.theme = theme
        return context
    }
    
    public func domain(_ domain: MHDomain) -> Self {
        var context = self
        context.domain = domain
        return context
    }
    
    public func group(_ group: MHGroup) -> Self {
        var context = self
        context.group = group
        return context
    }
    
    public func component(_ component: MHComponent, override: Bool = false) -> Self {
        var context = self
        if override {
            context.components = [component]
        } else if !context.components.contains(component) {
            context.components.append(component)
        }
        return context
    }
    
    public func element(_ element: MHElement, override: Bool = false) -> Self {
        var context = self
        if override {
            context.elements = [element]
        } else if !context.elements.contains(element) {
            context.elements.append(element)
        }
        return context
    }
    
    public func category(_ category: MHCategory) -> Self {
        var context = self
        context.category = category
        return context
    }
    
    public func concept(_ concept: MHConcept?) -> Self {
        var context = self
        context.concept = concept
        return context
    }
    
    public func property(_ property: MHProperty, override: Bool = false) -> Self {
        var context = self
        if override {
            context.properties = [property]
        } else if !context.properties.contains(property) {
            context.properties.append(property)
        }
        return context
    }
    
    public func variant(_ variant: MHVariant) -> Self {
        var context = self
        context.variant = variant
        return context
    }
    
    public func state(_ state: MHState) -> Self {
        var context = self
        context.state = state
        return context
    }
    
    public func scale(_ scale: MHScale) -> Self {
        var context = self
        context.scale = scale
        return context
    }
    
    public func mode(_ mode: MHMode) -> Self {
        var context = self
        context.mode = mode
        return context
    }
}

// MARK: - Operators

public extension DesignContext {
    static func +(lhs: Self, rhs: Self) -> Self {
        var context = lhs
        if let system = rhs.system {
            context = context.system(system)
        }
        if let theme = rhs.theme {
            context = context.theme(theme)
        }
        if let domain = rhs.domain {
            context = context.domain(domain)
        }
        if let group = rhs.group {
            context = context.group(group)
        }
        for component in rhs.components {
            context = context.component(component)
        }
        for element in rhs.elements {
            context = context.element(element)
        }
        if let category = rhs.category {
            context = context.category(category)
        }
        if let concept = rhs.concept {
            context = context.concept(concept)
        }
        for property in rhs.properties {
            context = context.property(property)
        }
        if let variant = rhs.variant {
            context = context.variant(variant)
        }
        if let state = rhs.state {
            context = context.state(state)
        }
        if let scale = rhs.scale {
            context = context.scale(scale)
        }
        if let mode = rhs.mode {
            context = context.mode(mode)
        }
        return context
    }
    
    static func +=(lhs: inout Self, rhs: Self) {
        lhs = lhs + rhs
    }
}
