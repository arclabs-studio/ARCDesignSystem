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
    @Test("Highlight color is yellow")
    func highlightColorIsYellow() {
        let color = Color.arcHighlight

        #expect(color == Color.yellow, "Highlight should be yellow")
    }

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

}
