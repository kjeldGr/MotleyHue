//
// Floats.swift
//

import SwiftUI
import MotleyHue

let floats = TokenContainer<CGFloat>(
    tokens: [
		"item": [
			"icon": [
				"size": [
					"xxs": CGFloat(4),
					"xs": CGFloat(8),
					"s": CGFloat(12),
					"m": CGFloat(16),
					"l": CGFloat(24),
					"xl": CGFloat(32),
					"xxl": CGFloat(40)
				] as [String: Any]
			] as [String: Any],
			"border": [
				"width": CGFloat(1)
			] as [String: Any],
			"spacing": [
				"horizontal": [
					"primary": CGFloat(10),
					"secondary": CGFloat(20)
				] as [String: Any],
				"vertical": [
					"primary": CGFloat(10),
					"secondary": CGFloat(20)
				] as [String: Any],
				"gap": CGFloat(4)
			] as [String: Any],
			"cornerRadius": [
				"primary": CGFloat(8),
				"secondary": CGFloat(99)
			] as [String: Any],
			"size": [
				"width": [
					"primary": CGFloat(150),
					"secondary": CGFloat(200)
				] as [String: Any],
				"height": [
					"primary": CGFloat(150),
					"secondary": CGFloat(200)
				] as [String: Any]
			] as [String: Any],
			"font": [
				"size": CGFloat(18)
			] as [String: Any]
		] as [String: Any],
		"button": [
			"icon": [
				"size": CGFloat(16)
			] as [String: Any],
			"border": [
				"width": CGFloat(1)
			] as [String: Any],
			"font": [
				"size": CGFloat(16)
			] as [String: Any],
			"spacing": [
				"horizontal": CGFloat(16),
				"vertical": CGFloat(8),
				"gap": CGFloat(8)
			] as [String: Any],
			"size": [
				"width": CGFloat(150),
				"height": CGFloat(44)
			] as [String: Any],
			"cornerRadius": CGFloat(8)
		] as [String: Any],
		"icon": [
			"size": [
				"palette": CGFloat(24)
			] as [String: Any]
		] as [String: Any]
	] as [String: Any],
    missingTokenStrategy: .none
)
