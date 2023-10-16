//
//  DesignContextTests.swift
//  
//
//  Created by Kjeld Groot on 01/06/2023.
//

import XCTest

@testable import MotleyHue

final class DesignContextTests: XCTestCase {
    
    // MARK: - SUT
    
    private var sut: DesignContext!
    
    // MARK: - XCTestCase
    
    override func setUp() {
        super.setUp()
        
        sut = DesignContext()
    }
    
    override func tearDown() {
        sut = nil
        
        super.tearDown()
    }
    
    // MARK: - Tests
    
    func testSystem() {
        var system = MHSystem(key: "system")
        sut = sut.system(system)
        XCTAssertEqual(sut.system, system)
        XCTAssertEqual(sut.keys, system.keys)
        
        system = MHSystem(keys: ["system", "sys"])
        sut = sut.system(system)
        XCTAssertEqual(sut.system, system)
        XCTAssertEqual(sut.keys, system.keys)
    }
    
    func testTheme() {
        var theme = MHTheme(key: "theme")
        sut = sut.theme(theme)
        XCTAssertEqual(sut.theme, theme)
        XCTAssertEqual(sut.keys, theme.keys)
        
        theme = MHTheme(keys: ["theme", "thm"])
        sut = sut.theme(theme)
        XCTAssertEqual(sut.theme, theme)
        XCTAssertEqual(sut.keys, theme.keys)
    }
    
    func testDomain() {
        var domain = MHDomain(key: "domain")
        sut = sut.domain(domain)
        XCTAssertEqual(sut.domain, domain)
        XCTAssertEqual(sut.keys, domain.keys)
        
        domain = MHDomain(keys: ["domain", "dom"])
        sut = sut.domain(domain)
        XCTAssertEqual(sut.domain, domain)
        XCTAssertEqual(sut.keys, domain.keys)
    }
    
    func testGroup() {
        var group = MHGroup(key: "group")
        sut = sut.group(group)
        XCTAssertEqual(sut.group, group)
        XCTAssertEqual(sut.keys, group.keys)
        
        group = MHGroup(keys: ["group", "gr"])
        sut = sut.group(group)
        XCTAssertEqual(sut.group, group)
        XCTAssertEqual(sut.keys, group.keys)
    }
    
    func testComponents() {
        var component = MHComponent(key: "component")
        sut = sut.component(component)
        XCTAssertEqual(sut.components, [component])
        XCTAssertEqual(sut.keys, component.keys)
        
        component = MHComponent(keys: ["component", "comp"])
        sut = sut.component(component, override: true)
        XCTAssertEqual(sut.components, [component])
        XCTAssertEqual(sut.keys, component.keys)
        
        let extraComponent = MHComponent(keys: ["component", "comp", "extra"])
        sut = sut.component(extraComponent)
        XCTAssertEqual(sut.components, [component, extraComponent])
        XCTAssertEqual(sut.keys, component.keys + extraComponent.keys)
    }
    
    func testElements() {
        var element = MHElement(key: "element")
        sut = sut.element(element)
        XCTAssertEqual(sut.elements, [element])
        XCTAssertEqual(sut.keys, element.keys)
        
        element = MHElement(keys: ["element", "el"])
        sut = sut.element(element, override: true)
        XCTAssertEqual(sut.elements, [element])
        XCTAssertEqual(sut.keys, element.keys)
        
        let extraElement = MHElement(keys: ["element", "el", "extra"])
        sut = sut.element(extraElement)
        XCTAssertEqual(sut.elements, [element, extraElement])
        XCTAssertEqual(sut.keys, element.keys + extraElement.keys)
    }
    
    func testCategory() {
        var category = MHCategory(key: "category")
        sut = sut.category(category)
        XCTAssertEqual(sut.category, category)
        XCTAssertEqual(sut.keys, category.keys)
        
        category = MHCategory(keys: ["category", "cat"])
        sut = sut.category(category)
        XCTAssertEqual(sut.category, category)
        XCTAssertEqual(sut.keys, category.keys)
    }
    
    func testConcept() {
        var concept = MHConcept(key: "concept")
        sut = sut.concept(concept)
        XCTAssertEqual(sut.concept, concept)
        XCTAssertEqual(sut.keys, concept.keys)
        
        concept = MHConcept(keys: ["concept", "con"])
        sut = sut.concept(concept)
        XCTAssertEqual(sut.concept, concept)
        XCTAssertEqual(sut.keys, concept.keys)
    }
    
    func testProperties() {
        var property = MHProperty(key: "property")
        sut = sut.property(property)
        XCTAssertEqual(sut.properties, [property])
        XCTAssertEqual(sut.keys, property.keys)
        
        property = MHProperty(keys: ["property", "prop"])
        sut = sut.property(property, override: true)
        XCTAssertEqual(sut.properties, [property])
        XCTAssertEqual(sut.keys, property.keys)
        
        let extraProperty = MHProperty(keys: ["property", "prop", "extra"])
        sut = sut.property(extraProperty)
        XCTAssertEqual(sut.properties, [property, extraProperty])
        XCTAssertEqual(sut.keys, property.keys + extraProperty.keys)
    }
    
    func testVariant() {
        var variant = MHVariant(key: "variant")
        sut = sut.variant(variant)
        XCTAssertEqual(sut.variant, variant)
        XCTAssertEqual(sut.keys, variant.keys)
        
        variant = MHVariant(keys: ["variant", "var"])
        sut = sut.variant(variant)
        XCTAssertEqual(sut.variant, variant)
        XCTAssertEqual(sut.keys, variant.keys)
    }
    
    func testState() {
        var state = MHState(key: "state")
        sut = sut.state(state)
        XCTAssertEqual(sut.state, state)
        XCTAssertEqual(sut.keys, state.keys)
        
        state = MHState(keys: ["state", "st"])
        sut = sut.state(state)
        XCTAssertEqual(sut.state, state)
        XCTAssertEqual(sut.keys, state.keys)
    }
    
    func testScale() {
        var scale = MHScale(key: "scale")
        sut = sut.scale(scale)
        XCTAssertEqual(sut.scale, scale)
        XCTAssertEqual(sut.keys, scale.keys)
        
        scale = MHScale(keys: ["scale", "sc"])
        sut = sut.scale(scale)
        XCTAssertEqual(sut.scale, scale)
        XCTAssertEqual(sut.keys, scale.keys)
    }
    
    func testMode() {
        var mode = MHMode(key: "mode")
        sut = sut.mode(mode)
        XCTAssertEqual(sut.mode, mode)
        XCTAssertEqual(sut.keys, mode.keys)
        
        mode = MHMode(keys: ["mode", "mod"])
        sut = sut.mode(mode)
        XCTAssertEqual(sut.mode, mode)
        XCTAssertEqual(sut.keys, mode.keys)
    }
    
    func testAddition() {
        let system = MHSystem(key: "system")
        let theme = MHTheme(key: "theme")
        let domain = MHDomain(key: "domain")
        let group = MHGroup(key: "group")
        let component = MHComponent(key: "component")
        let element = MHElement(key: "element")
        let category = MHCategory(key: "category")
        let concept = MHConcept(key: "concept")
        let property = MHProperty(key: "property")
        let variant = MHVariant(key: "variant")
        let state = MHState(key: "state")
        let scale = MHScale(key: "scale")
        let mode = MHMode(key: "mode")
        sut += DesignContext()
            .system(system)
            .theme(theme)
            .domain(domain)
            .group(group)
            .component(component)
            .element(element)
            .category(category)
            .concept(concept)
            .property(property)
            .variant(variant)
            .state(state)
            .scale(scale)
            .mode(mode)
        
        XCTAssertEqual(sut.system, system)
        XCTAssertEqual(sut.theme, theme)
        XCTAssertEqual(sut.domain, domain)
        XCTAssertEqual(sut.group, group)
        XCTAssertEqual(sut.components, [component])
        XCTAssertEqual(sut.elements, [element])
        XCTAssertEqual(sut.category, category)
        XCTAssertEqual(sut.concept, concept)
        XCTAssertEqual(sut.properties, [property])
        XCTAssertEqual(sut.variant, variant)
        XCTAssertEqual(sut.state, state)
        XCTAssertEqual(sut.scale, scale)
        XCTAssertEqual(sut.mode, mode)
        
        let anotherSystem = MHSystem(key: "anotherSystem")
        let anotherComponent = MHComponent(key: "anotherComponent")
        sut += DesignContext()
            .system(anotherSystem)
            .component(anotherComponent)
        
        XCTAssertEqual(sut.system, anotherSystem)
        XCTAssertEqual(sut.theme, theme)
        XCTAssertEqual(sut.domain, domain)
        XCTAssertEqual(sut.group, group)
        XCTAssertEqual(sut.components, [component, anotherComponent])
        XCTAssertEqual(sut.elements, [element])
        XCTAssertEqual(sut.category, category)
        XCTAssertEqual(sut.concept, concept)
        XCTAssertEqual(sut.properties, [property])
        XCTAssertEqual(sut.variant, variant)
        XCTAssertEqual(sut.state, state)
        XCTAssertEqual(sut.scale, scale)
        XCTAssertEqual(sut.mode, mode)
    }
}
