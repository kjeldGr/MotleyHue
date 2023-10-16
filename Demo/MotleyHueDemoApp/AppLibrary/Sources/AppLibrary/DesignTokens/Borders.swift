//
// Borders.swift
//

import SwiftUI
import MotleyHue

let borders = TokenContainer<MHBorder>(
    tokens: [
		"item": [
			"border": [
				"primary": MHBorder(color: Color(red: 1.000, green: 0.753, blue: 0.796, opacity: 1), width: CGFloat(1)),
				"secondary": MHBorder(color: Color(red: 1.000, green: 1.000, blue: 0.000, opacity: 1), width: CGFloat(4))
			] as [String: Any]
		] as [String: Any],
		"button": [
			"border": [
				"primary": MHBorder(color: Color(red: 1.000, green: 0.000, blue: 0.000, opacity: 1), width: CGFloat(1)),
				"secondary": MHBorder(color: Color(red: 1.000, green: 0.000, blue: 0.000, opacity: 1), width: CGFloat(1)),
				"tertiary": MHBorder(color: Color(red: 1.000, green: 0.000, blue: 0.000, opacity: 1), width: CGFloat(1))
			] as [String: Any]
		] as [String: Any]
	] as [String: Any],
    missingTokenStrategy: .none
)
