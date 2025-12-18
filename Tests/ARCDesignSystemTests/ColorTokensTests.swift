//
//  ColorTokensTests.swift
//  ARCDesignSystem
//
//  Created by ARC Labs on 4/11/25.
//

import SwiftUI
import Testing
@testable import ARCDesignSystem

@Suite("Color Tokens Tests")
struct ColorTokensTests {
    // MARK: - Accent Colors

    @Test("Accent color uses system accent")
    func accentColorUsesSystemAccent() {
        let color = Color.arcAccent

        #expect(color == Color.accentColor, "Accent should use system accent color")
    }

    // MARK: - Shadow Colors

    @Test("Shadow light color has correct opacity")
    func shadowLightColorHasCorrectOpacity() {
        let color = Color.arcShadowLight
        let expected = Color.black.opacity(0.08)

        #expect(color == expected, "Shadow light should be black with 8% opacity")
    }

    @Test("Shadow medium color has correct opacity")
    func shadowMediumColorHasCorrectOpacity() {
        let color = Color.arcShadowMedium
        let expected = Color.black.opacity(0.15)

        #expect(color == expected, "Shadow medium should be black with 15% opacity")
    }

    @Test("Shadow strong color has correct opacity")
    func shadowStrongColorHasCorrectOpacity() {
        let color = Color.arcShadowStrong
        let expected = Color.black.opacity(0.25)

        #expect(color == expected, "Shadow strong should be black with 25% opacity")
    }

    // MARK: - Background Colors

    @Test("Primary background color is accessible")
    func primaryBackgroundColorIsAccessible() {
        let color = Color.arcBackgroundPrimary
        // Color should be non-nil and accessible
        #expect(color.description.isEmpty == false)
    }

    @Test("Secondary background color is accessible")
    func secondaryBackgroundColorIsAccessible() {
        let color = Color.arcBackgroundSecondary
        #expect(color.description.isEmpty == false)
    }

    @Test("Tertiary background color is accessible")
    func tertiaryBackgroundColorIsAccessible() {
        let color = Color.arcBackgroundTertiary
        #expect(color.description.isEmpty == false)
    }

    // MARK: - Text Colors

    @Test("Primary text color uses SwiftUI primary")
    func primaryTextColorUsesPrimary() {
        let color = Color.arcTextPrimary
        #expect(color == Color.primary)
    }

    @Test("Secondary text color uses SwiftUI secondary")
    func secondaryTextColorUsesSecondary() {
        let color = Color.arcTextSecondary
        #expect(color == Color.secondary)
    }

    @Test("Tertiary text color is accessible")
    func tertiaryTextColorIsAccessible() {
        let color = Color.arcTextTertiary
        #expect(color.description.isEmpty == false)
    }

    @Test("Quaternary text color is accessible")
    func quaternaryTextColorIsAccessible() {
        let color = Color.arcTextQuaternary
        #expect(color.description.isEmpty == false)
    }

    @Test("Disabled text color is accessible")
    func disabledTextColorIsAccessible() {
        let color = Color.arcTextDisabled
        #expect(color.description.isEmpty == false)
    }

    // MARK: - Interactive Colors

    @Test("Link color is accessible")
    func linkColorIsAccessible() {
        let color = Color.arcLink
        #expect(color.description.isEmpty == false)
    }

    @Test("Placeholder color is accessible")
    func placeholderColorIsAccessible() {
        let color = Color.arcPlaceholder
        #expect(color.description.isEmpty == false)
    }

    // MARK: - Separator Colors

    @Test("Separator color is accessible")
    func separatorColorIsAccessible() {
        let color = Color.arcSeparator
        #expect(color.description.isEmpty == false)
    }

    @Test("Opaque separator color is accessible")
    func opaqueSeparatorColorIsAccessible() {
        let color = Color.arcSeparatorOpaque
        #expect(color.description.isEmpty == false)
    }

    // MARK: - Legacy Aliases

    @Test("Legacy highlight alias matches accent")
    func legacyHighlightMatchesAccent() {
        #expect(Color.arcHighlight == Color.arcAccent)
    }
}
