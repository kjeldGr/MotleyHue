//
// Typographies.swift
//

import SwiftUI
import MotleyHue

let typographies = TokenContainer<MHTypography>(
    tokens: [
		"item": [
			"typography": [
				"primary": MHTypography(fontFamily: "Avenir", fontWeight: "Medium", fontSize: CGFloat(18), lineHeight: CGFloat(1)),
				"secondary": MHTypography(fontFamily: "System", fontWeight: "Bold", fontSize: CGFloat(16), lineHeight: CGFloat(1.4))
			] as [String: Any]
		] as [String: Any],
		"button": [
			"typography": [
				"primary": MHTypography(fontFamily: "Arial", fontWeight: "Regular", fontSize: CGFloat(18), lineHeight: CGFloat(1))
			] as [String: Any]
		] as [String: Any]
	] as [String: Any],
    missingTokenStrategy: .none
)
