//
//  PaddingTokensTests.swift
//  ARCDesignSystem
//
//  Created by ARC Labs on 4/11/25.
//

import SwiftUI
import Testing
@testable import ARCDesignSystem

@Suite("Padding Tokens Tests")
struct PaddingTokensTests {
    @Test("Card padding has correct values")
    func cardPaddingHasCorrectValues() {
        let padding = EdgeInsets.arcPaddingCard
        let scaleFactor = ARCLayoutScale.arcScaleFactor
        let expectedValue = 16 * scaleFactor

        #expect(padding.top == expectedValue)
        #expect(padding.leading == expectedValue)
        #expect(padding.bottom == expectedValue)
        #expect(padding.trailing == expectedValue)
    }

    @Test("Horizontal padding has correct values")
    func horizontalPaddingHasCorrectValues() {
        let padding = EdgeInsets.arcPaddingHorizontal
        let scaleFactor = ARCLayoutScale.arcScaleFactor
        let expectedHorizontal = 16 * scaleFactor

        #expect(padding.top == 0)
        #expect(padding.leading == expectedHorizontal)
        #expect(padding.bottom == 0)
        #expect(padding.trailing == expectedHorizontal)
    }

    @Test("Section padding has correct values")
    func sectionPaddingHasCorrectValues() {
        let padding = EdgeInsets.arcPaddingSection
        let scaleFactor = ARCLayoutScale.arcScaleFactor
        let expectedVertical = 24 * scaleFactor
        let expectedHorizontal = 16 * scaleFactor

        #expect(padding.top == expectedVertical)
        #expect(padding.leading == expectedHorizontal)
        #expect(padding.bottom == expectedVertical)
        #expect(padding.trailing == expectedHorizontal)
    }

    @Test("Compact padding has correct values")
    func compactPaddingHasCorrectValues() {
        let padding = EdgeInsets.arcPaddingCompact
        let scaleFactor = ARCLayoutScale.arcScaleFactor
        let expectedVertical = 8 * scaleFactor
        let expectedHorizontal = 12 * scaleFactor

        #expect(padding.top == expectedVertical)
        #expect(padding.leading == expectedHorizontal)
        #expect(padding.bottom == expectedVertical)
        #expect(padding.trailing == expectedHorizontal)
    }

    @Test("All padding values are non-negative")
    func allPaddingValuesAreNonNegative() {
        let paddings = [
            EdgeInsets.arcPaddingCard,
            EdgeInsets.arcPaddingHorizontal,
            EdgeInsets.arcPaddingSection,
            EdgeInsets.arcPaddingCompact,
        ]

        for padding in paddings {
            #expect(padding.top >= 0)
            #expect(padding.leading >= 0)
            #expect(padding.bottom >= 0)
            #expect(padding.trailing >= 0)
        }
    }
}
