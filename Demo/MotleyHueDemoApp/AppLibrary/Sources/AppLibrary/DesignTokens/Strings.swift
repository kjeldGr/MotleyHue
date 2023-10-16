//
// Strings.swift
//

import SwiftUI
import MotleyHue

let strings = TokenContainer<String>(
    tokens: [
		"item": [
			"font": [
				"family": "Arial",
				"weight": "Regular"
			] as [String: Any]
		] as [String: Any],
		"button": [
			"font": [
				"family": "System",
				"weight": "Bold"
			] as [String: Any]
		] as [String: Any]
	] as [String: Any],
    missingTokenStrategy: .none
)
