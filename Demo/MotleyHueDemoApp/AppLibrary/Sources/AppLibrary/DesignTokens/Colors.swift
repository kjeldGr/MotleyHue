//
// Colors.swift
//

import SwiftUI
import MotleyHue

let colors = TokenContainer<Color>(
    tokens: [
		"item": [
			"icon": [
				"color": Color(red: 1.000, green: 0.000, blue: 1.000, opacity: 1)
			] as [String: Any],
			"border": [
				"color": Color(red: 1.000, green: 0.000, blue: 0.000, opacity: 1)
			] as [String: Any],
			"color": [
				"background": [
					"primary": Color(red: 0.000, green: 0.000, blue: 1.000, opacity: 1),
					"secondary": Color(red: 1.000, green: 1.000, blue: 0.000, opacity: 1)
				] as [String: Any],
				"text": Color(red: 0.000, green: 0.000, blue: 0.000, opacity: 1)
			] as [String: Any]
		] as [String: Any],
		"button": [
			"icon": [
				"color": Color(red: 1.000, green: 1.000, blue: 1.000, opacity: 1)
			] as [String: Any],
			"border": [
				"color": Color(red: 1.000, green: 0.000, blue: 1.000, opacity: 1)
			] as [String: Any],
			"color": [
				"text": Color(red: 1.000, green: 1.000, blue: 1.000, opacity: 1),
				"background": [
					"primary": [
						"default": Color(red: 0.000, green: 1.000, blue: 0.000, opacity: 1),
						"active": Color(red: 0.000, green: 1.000, blue: 0.000, opacity: 0.8),
						"disabled": Color(red: 0.000, green: 1.000, blue: 0.000, opacity: 0.5019607843137255)
					] as [String: Any],
					"secondary": [
						"default": Color(red: 1.000, green: 0.000, blue: 0.000, opacity: 1),
						"active": Color(red: 1.000, green: 0.000, blue: 0.000, opacity: 0.8),
						"disabled": Color(red: 1.000, green: 0.000, blue: 0.000, opacity: 0.5019607843137255)
					] as [String: Any],
					"tertiary": [
						"default": Color(red: 1.000, green: 1.000, blue: 0.000, opacity: 1),
						"active": Color(red: 1.000, green: 1.000, blue: 0.000, opacity: 0.8),
						"disabled": Color(red: 1.000, green: 1.000, blue: 0.000, opacity: 0.5019607843137255)
					] as [String: Any]
				] as [String: Any]
			] as [String: Any]
		] as [String: Any],
		"icon": [
			"color": [
				"palette": [
					"primary": Color(red: 1.000, green: 0.000, blue: 0.000, opacity: 1),
					"secondary": Color(red: 0.000, green: 0.000, blue: 1.000, opacity: 1),
					"tertiary": Color(red: 0.000, green: 1.000, blue: 0.000, opacity: 1)
				] as [String: Any]
			] as [String: Any]
		] as [String: Any]
	] as [String: Any],
    missingTokenStrategy: .none
)
