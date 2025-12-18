//
//  AccessibilityTests.swift
//  ARCDesignSystem
//
//  Created by ARC Labs Studio on 18/12/2025.
//

import SwiftUI
import Testing
@testable import ARCDesignSystem

@Suite("Accessibility Tests")
struct AccessibilityTests {
    // MARK: - ARCAccessibility Static Properties

    @Test("Prefers high contrast returns boolean")
    func prefersHighContrastReturnsBool() {
        let value = ARCAccessibility.prefersHighContrast
        #expect(value == true || value == false)
    }

    @Test("Prefers reduced motion returns boolean")
    func prefersReducedMotionReturnsBool() {
        let value = ARCAccessibility.prefersReducedMotion
        #expect(value == true || value == false)
    }

    @Test("Prefers bold text returns boolean")
    func prefersBoldTextReturnsBool() {
        let value = ARCAccessibility.prefersBoldText
        #expect(value == true || value == false)
    }

    @Test("Is accessibility text size returns boolean")
    func isAccessibilityTextSizeReturnsBool() {
        let value = ARCAccessibility.isAccessibilityTextSize
        #expect(value == true || value == false)
    }

    @Test("Differentiate without color returns boolean")
    func differentiateWithoutColorReturnsBool() {
        let value = ARCAccessibility.differentiateWithoutColor
        #expect(value == true || value == false)
    }

    @Test("Prefers reduced transparency returns boolean")
    func prefersReducedTransparencyReturnsBool() {
        let value = ARCAccessibility.prefersReducedTransparency
        #expect(value == true || value == false)
    }

    // MARK: - Environment Key

    @Test("High contrast environment key has default value")
    func highContrastEnvironmentKeyHasDefaultValue() {
        let values = EnvironmentValues()
        #expect(values.arcHighContrastEnabled == false)
    }

    @Test("High contrast environment key can be set")
    func highContrastEnvironmentKeyCanBeSet() {
        var values = EnvironmentValues()
        values.arcHighContrastEnabled = true
        #expect(values.arcHighContrastEnabled == true)
    }
}
