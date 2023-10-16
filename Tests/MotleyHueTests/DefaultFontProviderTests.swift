//
//  DefaultFontProviderTests.swift
//  
//
//  Created by Kjeld Groot on 02/06/2023.
//

import XCTest

@testable import MotleyHue

final class DefaultFontProviderTests: XCTestCase {
    
    // MARK: - SUT
    
    private var sut: DefaultFontProvider!
    
    // MARK: - XCTestCase
    
    override func setUp() {
        super.setUp()
        
        sut = DefaultFontProvider()
    }
    
    override func tearDown() {
        sut = nil
        
        super.tearDown()
    }
    
    // MARK: - Tests
    
    func testMakeFont() {
        let sut = DefaultFontProvider()
        
        var font = sut.makeFont(family: "Arial", weight: "Regular", size: 16)
        XCTAssertEqual(font, MHCrossPlatformFont(name: "Arial", size: 16))
        
        font = sut.makeFont(family: "Arial", weight: "Bold", size: 12)
        XCTAssertEqual(font, MHCrossPlatformFont(name: "Arial Bold", size: 12))
        
        font = sut.makeFont(family: "Avenir", weight: "Light", size: 12)
        XCTAssertEqual(font, MHCrossPlatformFont(name: "Avenir Light", size: 12))
    }
    
    func testMakeFontFallbackToSystemFont() {
        let sut = DefaultFontProvider()
        
        var font = sut.makeFont(family: "Unknown", weight: "UltraLight", size: 16)
        XCTAssertEqual(font, .systemFont(ofSize: 16, weight: .ultraLight))
        
        font = sut.makeFont(family: "Unknown", weight: "Light", size: 12)
        XCTAssertEqual(font, .systemFont(ofSize: 12, weight: .light))
        
        font = sut.makeFont(family: "Unknown", weight: "Thin", size: 12)
        XCTAssertEqual(font, .systemFont(ofSize: 12, weight: .thin))
        
        font = sut.makeFont(family: "Unknown", weight: "Regular", size: 12)
        XCTAssertEqual(font, .systemFont(ofSize: 12))
        
        font = sut.makeFont(family: "Unknown", weight: "Medium", size: 12)
        XCTAssertEqual(font, .systemFont(ofSize: 12, weight: .medium))
        
        font = sut.makeFont(family: "Unknown", weight: "Semibold", size: 12)
        XCTAssertEqual(font, .systemFont(ofSize: 12, weight: .semibold))
        
        font = sut.makeFont(family: "Unknown", weight: "Bold", size: 12)
        XCTAssertEqual(font, .systemFont(ofSize: 12, weight: .bold))
        
        font = sut.makeFont(family: "Unknown", weight: "Black", size: 12)
        XCTAssertEqual(font, .systemFont(ofSize: 12, weight: .black))
        
        font = sut.makeFont(family: "Unknown", weight: "Heavy", size: 12)
        XCTAssertEqual(font, .systemFont(ofSize: 12, weight: .heavy))
        
        font = sut.makeFont(family: "Unknown", weight: "ExtraBold", size: 12)
        XCTAssertEqual(font, .systemFont(ofSize: 12, weight: .heavy))
    }
}
