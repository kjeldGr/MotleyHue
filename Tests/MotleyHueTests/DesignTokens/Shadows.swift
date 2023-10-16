//
// Shadows.swift
//

import SwiftUI
import MotleyHue

let shadows = TokenContainer<MHShadow>(
    tokens: [
		"item": [
			"shadow": [
				"primary": MHShadow(color: Color(red: 0.000, green: 0.000, blue: 0.000, opacity: 0.25098039215686274), radius: CGFloat(4), x: CGFloat(0), y: CGFloat(4)),
				"secondary": MHShadow(color: Color(red: 0.000, green: 0.000, blue: 0.000, opacity: 0.25098039215686274), radius: CGFloat(4), x: CGFloat(0), y: CGFloat(8)),
				"hiddenShadow": MHShadow(color: Color(red: 0.000, green: 0.000, blue: 0.000, opacity: 0), radius: CGFloat(4), x: CGFloat(0), y: CGFloat(4))
			] as [String: Any]
		] as [String: Any],
		"button": [
			"shadow": MHShadow(color: Color(red: 0.000, green: 0.000, blue: 0.000, opacity: 0.25098039215686274), radius: CGFloat(4), x: CGFloat(0), y: CGFloat(4))
		] as [String: Any]
	] as [String: Any],
    missingTokenStrategy: .none
)
