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

        #expect(padding.top == 16)
        #expect(padding.leading == 16)
        #expect(padding.bottom == 16)
        #expect(padding.trailing == 16)
    }

    @Test("Horizontal padding has correct values")
    func horizontalPaddingHasCorrectValues() {
        let padding = EdgeInsets.arcPaddingHorizontal

        #expect(padding.top == 0)
        #expect(padding.leading == 16)
        #expect(padding.bottom == 0)
        #expect(padding.trailing == 16)
    }

    @Test("Section padding has correct values")
    func sectionPaddingHasCorrectValues() {
        let padding = EdgeInsets.arcPaddingSection

        #expect(padding.top == 24)
        #expect(padding.leading == 16)
        #expect(padding.bottom == 24)
        #expect(padding.trailing == 16)
    }

    @Test("Compact padding has correct values")
    func compactPaddingHasCorrectValues() {
        let padding = EdgeInsets.arcPaddingCompact

        #expect(padding.top == 8)
        #expect(padding.leading == 12)
        #expect(padding.bottom == 8)
        #expect(padding.trailing == 12)
    }

    @Test("All padding values are non-negative")
    func allPaddingValuesAreNonNegative() {
        let paddings = [
            EdgeInsets.arcPaddingCard,
            EdgeInsets.arcPaddingHorizontal,
            EdgeInsets.arcPaddingSection,
            EdgeInsets.arcPaddingCompact
        ]

        for padding in paddings {
            #expect(padding.top >= 0)
            #expect(padding.leading >= 0)
            #expect(padding.bottom >= 0)
            #expect(padding.trailing >= 0)
        }
    }
}
