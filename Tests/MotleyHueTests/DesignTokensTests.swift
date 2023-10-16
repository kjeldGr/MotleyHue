//
//  DesignTokensTests.swift
//  
//
//  Created by Kjeld Groot on 02/06/2023.
//

import XCTest
import SwiftUI

@testable import MotleyHue

final class DesignTokensTests: XCTestCase {
    
    // MARK: - SUT
    
    private var sut: DesignTokens!
    
    // MARK: - XCTestCase
    
    override func setUp() {
        super.setUp()
        
        sut = .makeDesignTokens(typographyFormat: .typography, borderFormat: .border)
    }
    
    override func tearDown() {
        sut = nil
        
        super.tearDown()
    }
    
    // MARK: - Tests
    
    // MARK: Color
    
    func testColor() {
        XCTAssertEqual(
            sut.color(
                for: DesignContext()
                    .component(.button)
                    .category(.color)
                    .property(.background)
                    .variant(.primary)
                    .state(.default)
            ),
            Color(hex: "#00ff00")
        )
        XCTAssertEqual(
            sut.color(
                for: DesignContext()
                    .component(.item)
                    .category(.color)
                    .property(.background)
                    .variant(.secondary)
            ),
            Color(hex: "#ffff00")
        )
        XCTAssertNil(sut.color(for: DesignContext()))
    }
    
    func testBackground() {
        XCTAssertEqual(
            sut.background(
                for: DesignContext()
                    .component(.button)
                    .category(.color)
                    .variant(.primary)
                    .state(.default)
            ),
            Color(hex: "#00ff00")
        )
        XCTAssertEqual(
            sut.background(
                for: DesignContext()
                    .component(.item)
                    .category(.color)
                    .variant(.secondary)
            ),
            Color(hex: "#ffff00")
        )
        XCTAssertNil(sut.background(for: DesignContext()))
    }
    
    func testTextColor() {
        XCTAssertEqual(
            sut.textColor(
                for: DesignContext()
                    .component(.button)
                    .variant(.primary)
                    .state(.default)
            ),
            Color.white
        )
        XCTAssertEqual(
            sut.textColor(
                for: DesignContext()
                    .component(.item)
            ),
            Color.black
        )
        XCTAssertNil(sut.textColor(for: DesignContext()))
    }
    
    // MARK: Float
    
    func testFloat() {
        XCTAssertEqual(
            sut.float(
                for: DesignContext()
                    .component(.button)
                    .category(.spacing)
                    .variant(.primary)
                    .property(.gap)
            ),
            8
        )
        XCTAssertEqual(
            sut.float(
                for: DesignContext()
                    .component(.item)
                    .category(.spacing)
                    .property(.horizontal)
                    .variant(.secondary)
            ),
            20
        )
        XCTAssertNil(sut.float(for: DesignContext()))
    }
    
    func testSpacing() {
        XCTAssertEqual(
            sut.spacing(
                for: DesignContext()
                    .component(.button)
                    .property(.gap)
                    .variant(.primary)
            ),
            8
        )
        XCTAssertEqual(
            sut.spacing(
                for: DesignContext()
                    .component(.item)
                    .property(.gap)
            ),
            4
        )
        XCTAssertNil(sut.spacing(for: DesignContext()))
    }
    
    func testPadding() {
        XCTAssertEqual(
            sut.padding(
                for: DesignContext()
                    .component(.button)
                    .variant(.primary)
            ),
            EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16)
        )
        XCTAssertEqual(
            sut.padding(
                for: DesignContext()
                    .component(.button)
                    .variant(.primary),
                edges: [.leading, .trailing, .top, .bottom]
            ),
            EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16)
        )
        XCTAssertEqual(
            sut.padding(
                for: DesignContext()
                    .component(.button)
                    .variant(.primary),
                edges: [.trailing, .top, .bottom]
            ),
            EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 16)
        )
        XCTAssertEqual(
            sut.padding(
                for: DesignContext()
                    .component(.button)
                    .variant(.primary),
                edges: [.leading, .top, .bottom]
            ),
            EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 0)
        )
        XCTAssertEqual(
            sut.padding(
                for: DesignContext()
                    .component(.button)
                    .variant(.primary),
                edges: [.leading, .trailing, .bottom]
            ),
            EdgeInsets(top: 0, leading: 16, bottom: 8, trailing: 16)
        )
        XCTAssertEqual(
            sut.padding(
                for: DesignContext()
                    .component(.button)
                    .variant(.primary),
                edges: [.leading, .trailing, .top]
            ),
            EdgeInsets(top: 8, leading: 16, bottom: 0, trailing: 16)
        )
        XCTAssertEqual(
            sut.padding(
                for: DesignContext()
                    .component(.button)
                    .variant(.primary),
                edges: []
            ),
            EdgeInsets()
        )
        XCTAssertEqual(
            sut.padding(
                for: DesignContext()
                    .component(.item)
                    .variant(.secondary)
            ),
            EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
        )
        XCTAssertEqual(
            sut.padding(
                for: DesignContext()
            ),
            EdgeInsets()
        )
        
        sut = DesignTokens(
            colors: TokenContainer(tokens: [:], missingTokenStrategy: .none),
            floats: TokenContainer(
                tokens: [
                    "button": [
                        "spacing": [
                            "leading": CGFloat(4),
                            "trailing": CGFloat(8),
                            "top": CGFloat(12),
                            "bottom": CGFloat(16)
                        ]
                    ]
                ],
                missingTokenStrategy: .none
            ),
            strings: TokenContainer(tokens: [:], missingTokenStrategy: .none),
            typographies: TokenContainer(tokens: [:], missingTokenStrategy: .none),
            borders: TokenContainer(tokens: [:], missingTokenStrategy: .none),
            shadows: TokenContainer(tokens: [:], missingTokenStrategy: .none)
        )
        XCTAssertEqual(
            sut.padding(
                for: DesignContext()
                    .component(.button)
                    .variant(.primary)
            ),
            EdgeInsets(top: 12, leading: 4, bottom: 16, trailing: 8)
        )
        XCTAssertEqual(sut.padding(for: DesignContext()), EdgeInsets())
    }
    
    func testWidth() {
        XCTAssertEqual(
            sut.width(
                for: DesignContext()
                    .component(.item)
                    .element(.icon)
                    .scale(.medium)
            ),
            16
        )
        XCTAssertEqual(
            sut.width(
                for: DesignContext()
                    .component(.item)
                    .variant(.secondary)
            ),
            200
        )
        XCTAssertNil(sut.width(for: DesignContext()))
    }
    
    func testHeight() {
        XCTAssertEqual(
            sut.height(
                for: DesignContext()
                    .component(.item)
                    .element(.icon)
                    .scale(.medium)
            ),
            16
        )
        XCTAssertEqual(
            sut.height(
                for: DesignContext()
                    .component(.item)
                    .variant(.secondary)
            ),
            200
        )
        XCTAssertNil(sut.height(for: DesignContext()))
    }
    
    func testCornerRadius() {
        XCTAssertEqual(
            sut.cornerRadius(
                for: DesignContext()
                    .component(.button)
                    .variant(.primary)
            ),
            8
        )
        XCTAssertEqual(
            sut.cornerRadius(
                for: DesignContext()
                    .component(.item)
                    .variant(.secondary)
            ),
            99
        )
        XCTAssertNil(sut.cornerRadius(for: DesignContext()))
    }
    
    // MARK: String
    
    func testString() {
        XCTAssertEqual(
            sut.string(for: DesignContext()
                .component(.button)
                .category(.typography)
                .property(.fontFamily)
                .variant(.primary)
            ),
            "System"
        )
        XCTAssertEqual(
            sut.string(
                for: DesignContext()
                    .component(.item)
                    .category(.typography)
                    .property(.fontFamily)
            ),
            "Arial"
        )
        XCTAssertNil(sut.string( for: DesignContext()))
    }
    
    // MARK: Border
    
    func testBorder() throws {
        let red = try XCTUnwrap(Color(hex: "#ff0000"))
        XCTAssertEqual(
            sut.border(
                for: DesignContext()
                    .component(.button)
                    .variant(.primary)
            ),
            MHBorder(color: red, width: 1)
        )
        let orange = try XCTUnwrap(Color(hex: "#ffff00"))
        XCTAssertEqual(
            sut.border(
                for: DesignContext()
                    .component(.item)
                    .variant(.secondary)
            ),
            MHBorder(color: orange, width: 4)
        )
        XCTAssertNil(sut.border(for: DesignContext()))
        
        let pink = try XCTUnwrap(Color(hex: "#ff00ff"))
        sut = .makeDesignTokens(typographyFormat: .typography, borderFormat: .components)
        XCTAssertEqual(
            sut.border(
                for: DesignContext()
                    .component(.button)
                    .variant(.primary)
            ),
            MHBorder(color: pink, width: 1)
        )
        XCTAssertEqual(
            sut.border(
                for: DesignContext()
                    .component(.item)
            ),
            MHBorder(color: red, width: 1)
        )
        XCTAssertNil(sut.border(for: DesignContext()))
        
        sut = DesignTokens(
            borderFormat: .components,
            colors: TokenContainer(tokens: [
                "button": [
                    "border": [
                        "color": Color.white
                    ]
                ],
                "test": [
                    "border": [
                        "color": Color.blue
                    ]
                ]
            ], missingTokenStrategy: .none),
            floats: TokenContainer(
                tokens: [
                    "button": [
                        "border": [
                            "width": CGFloat(1)
                        ]
                    ]
                ],
                missingTokenStrategy: .none
            ),
            strings: TokenContainer(tokens: [:], missingTokenStrategy: .none),
            typographies: TokenContainer(tokens: [:], missingTokenStrategy: .none),
            borders: TokenContainer(tokens: [:], missingTokenStrategy: .none),
            shadows: TokenContainer(tokens: [:], missingTokenStrategy: .none)
        )
        XCTAssertEqual(
            sut.border(
                for: DesignContext()
                    .component(.button)
                    .variant(.primary)
            ),
            MHBorder(color: .white, width: 1)
        )
        XCTAssertNil(sut.border(for: DesignContext().component(MHComponent(key: "test"))))
        XCTAssertNil(sut.border(for: DesignContext()))
    }
    
    // MARK: Typography
    
    func testTypography() {
        XCTAssertEqual(
            sut.typography(
                for: DesignContext()
                    .component(.button)
                    .variant(.primary)
            ),
            MHTypography(fontFamily: "Arial", fontWeight: "Regular", fontSize: 18, lineHeight: 1)
        )
        XCTAssertEqual(
            sut.typography(
                for: DesignContext()
                    .component(.item)
                    .variant(.secondary)
            ),
            MHTypography(fontFamily: "System", fontWeight: "Bold", fontSize: 16, lineHeight: 1.4)
        )
        XCTAssertNil(sut.typography(for: DesignContext()))
        
        sut = .makeDesignTokens(typographyFormat: .components, borderFormat: .border)
        XCTAssertEqual(
            sut.typography(
                for: DesignContext()
                    .component(.button)
                    .variant(.primary)
            ),
            MHTypography(fontFamily: "System", fontWeight: "Bold", fontSize: 16, lineHeight: 1)
        )
        XCTAssertEqual(
            sut.typography(
                for: DesignContext()
                    .component(.item)
                    .variant(.secondary)
            ),
            MHTypography(fontFamily: "Arial", fontWeight: "Regular", fontSize: 18, lineHeight: 1)
        )
        XCTAssertNil(sut.typography(for: DesignContext()))
        
        sut = DesignTokens(
            typographyFormat: .components,
            colors: TokenContainer(tokens: [:], missingTokenStrategy: .none),
            floats: TokenContainer(
                tokens: [
                    "title": [
                        "font": [
                            "size": CGFloat(18)
                        ]
                    ],
                    "button": [
                        "font": [
                            "size": CGFloat(16)
                        ]
                    ]
                ],
                missingTokenStrategy: .none
            ),
            strings: TokenContainer(
                tokens: [
                    "title": [
                        "font":[
                            "family": "Arial"
                        ]
                    ],
                    "button": [
                        "font": [
                            "family": "System",
                            "weight": "Bold"
                        ]
                    ],
                    "test": [
                        "font":[
                            "family": "Arial"
                        ]
                    ],
                ],
                missingTokenStrategy: .none
            ),
            typographies: TokenContainer(tokens: [:], missingTokenStrategy: .none),
            borders: TokenContainer(tokens: [:], missingTokenStrategy: .none),
            shadows: TokenContainer(tokens: [:], missingTokenStrategy: .none)
        )
        XCTAssertEqual(
            sut.typography(
                for: DesignContext()
                    .component(.button)
                    .variant(.primary)
            ),
            MHTypography(fontFamily: "System", fontWeight: "Bold", fontSize: 16, lineHeight: 1)
        )
        XCTAssertEqual(
            sut.typography(
                for: DesignContext()
                    .element(.title)
            ),
            MHTypography(fontFamily: "Arial", fontWeight: "Regular", fontSize: 18, lineHeight: 1)
        )
        XCTAssertNil(sut.typography(for: DesignContext().component(MHComponent(key: "test"))))
        XCTAssertNil(sut.typography(for: DesignContext()))
    }
    
    func testFont() {
        XCTAssertEqual(
            sut.font(
                for: DesignContext()
                    .component(.button)
                    .variant(.primary)
            ),
            MHCrossPlatformFont(name: "Arial", size: 18)
        )
        XCTAssertEqual(
            sut.font(
                for: DesignContext()
                    .component(.item)
                    .variant(.secondary)
            ),
            .systemFont(ofSize: 16, weight: .bold)
        )
        XCTAssertNil(sut.font(for: DesignContext()))
    }
    
    // MARK: Shadow
    
    func testShadow() throws {
        let shadowColor = try XCTUnwrap(Color(hex: "#00000040"))
        XCTAssertEqual(
            sut.shadow(
                for: DesignContext()
                    .component(.button)
                    .variant(.primary)
            ),
            MHShadow(color: shadowColor, radius: 4, x: 0, y: 4)
        )
        XCTAssertEqual(
            sut.shadow(
                for: DesignContext()
                    .component(.item)
                    .variant(.secondary)
            ),
            MHShadow(color: shadowColor, radius: 4, x: 0, y: 8)
        )
        XCTAssertNil(sut.shadow(for: DesignContext()))
    }
    
    func testClearCache() {
        sut.clearCache()
        XCTAssert(sut.colors.cache.isEmpty)
        XCTAssert(sut.floats.cache.isEmpty)
        XCTAssert(sut.strings.cache.isEmpty)
        XCTAssert(sut.typographies.cache.isEmpty)
        XCTAssert(sut.borders.cache.isEmpty)
        XCTAssert(sut.shadows.cache.isEmpty)
        
        _ = sut.color(
            for: DesignContext()
                .component(.item)
                .category(.color)
                .property(.background)
                .variant(.secondary)
        )
        _ = sut.float(
            for: DesignContext()
                .component(.item)
                .category(.spacing)
                .property(.horizontal)
                .variant(.secondary)
        )
        _ = sut.string(
            for: DesignContext()
                .component(.item)
                .category(.typography)
                .property(.fontFamily)
        )
        _ = sut.typography(
            for: DesignContext()
                .component(.item)
                .variant(.secondary)
        )
        _ = sut.border(
            for: DesignContext()
                .component(.item)
                .variant(.secondary)
        )
        _ = sut.shadow(
            for: DesignContext()
                .component(.item)
                .variant(.secondary)
        )
        
        XCTAssertFalse(sut.colors.cache.isEmpty)
        XCTAssertFalse(sut.floats.cache.isEmpty)
        XCTAssertFalse(sut.strings.cache.isEmpty)
        XCTAssertFalse(sut.typographies.cache.isEmpty)
        XCTAssertFalse(sut.borders.cache.isEmpty)
        XCTAssertFalse(sut.shadows.cache.isEmpty)
        
        sut.clearCache()
        XCTAssert(sut.colors.cache.isEmpty)
        XCTAssert(sut.floats.cache.isEmpty)
        XCTAssert(sut.strings.cache.isEmpty)
        XCTAssert(sut.typographies.cache.isEmpty)
        XCTAssert(sut.borders.cache.isEmpty)
        XCTAssert(sut.shadows.cache.isEmpty)
    }
}
