//
//  SpacingTokensTests.swift
//  ARCDesignSystem
//
//  Created by ARC Labs on 4/11/25.
//

import Foundation
import Testing
@testable import ARCDesignSystem

@Suite("Spacing Tokens Tests")
struct SpacingTokensTests {
    @Test("XSmall spacing has correct base value")
    func xSmallSpacingHasCorrectBaseValue() {
        let spacing = CGFloat.arcSpacingXSmall
        let scaleFactor = ARCLayoutScale.arcScaleFactor
        let expectedValue = 4 * scaleFactor

        #expect(spacing == expectedValue, "XSmall spacing should be 4pt × scale factor")
    }

    @Test("Small spacing has correct base value")
    func smallSpacingHasCorrectBaseValue() {
        let spacing = CGFloat.arcSpacingSmall
        let scaleFactor = ARCLayoutScale.arcScaleFactor
        let expectedValue = 8 * scaleFactor

        #expect(spacing == expectedValue, "Small spacing should be 8pt × scale factor")
    }

    @Test("Medium spacing has correct base value")
    func mediumSpacingHasCorrectBaseValue() {
        let spacing = CGFloat.arcSpacingMedium
        let scaleFactor = ARCLayoutScale.arcScaleFactor
        let expectedValue = 12 * scaleFactor

        #expect(spacing == expectedValue, "Medium spacing should be 12pt × scale factor")
    }

    @Test("Large spacing has correct base value")
    func largeSpacingHasCorrectBaseValue() {
        let spacing = CGFloat.arcSpacingLarge
        let scaleFactor = ARCLayoutScale.arcScaleFactor
        let expectedValue = 16 * scaleFactor

        #expect(spacing == expectedValue, "Large spacing should be 16pt × scale factor")
    }

    @Test("XLarge spacing has correct base value")
    func xLargeSpacingHasCorrectBaseValue() {
        let spacing = CGFloat.arcSpacingXLarge
        let scaleFactor = ARCLayoutScale.arcScaleFactor
        let expectedValue = 24 * scaleFactor

        #expect(spacing == expectedValue, "XLarge spacing should be 24pt × scale factor")
    }

    @Test("XXLarge spacing has correct base value")
    func xxLargeSpacingHasCorrectBaseValue() {
        let spacing = CGFloat.arcSpacingXXLarge
        let scaleFactor = ARCLayoutScale.arcScaleFactor
        let expectedValue = 32 * scaleFactor

        #expect(spacing == expectedValue, "XXLarge spacing should be 32pt × scale factor")
    }

    @Test("Spacing tokens are in ascending order")
    func spacingTokensAreInAscendingOrder() {
        #expect(CGFloat.arcSpacingXSmall < CGFloat.arcSpacingSmall)
        #expect(CGFloat.arcSpacingSmall < CGFloat.arcSpacingMedium)
        #expect(CGFloat.arcSpacingMedium < CGFloat.arcSpacingLarge)
        #expect(CGFloat.arcSpacingLarge < CGFloat.arcSpacingXLarge)
        #expect(CGFloat.arcSpacingXLarge < CGFloat.arcSpacingXXLarge)
    }

    @Test("All spacing tokens are positive")
    func allSpacingTokensArePositive() {
        #expect(CGFloat.arcSpacingXSmall > 0)
        #expect(CGFloat.arcSpacingSmall > 0)
        #expect(CGFloat.arcSpacingMedium > 0)
        #expect(CGFloat.arcSpacingLarge > 0)
        #expect(CGFloat.arcSpacingXLarge > 0)
        #expect(CGFloat.arcSpacingXXLarge > 0)
    }
}
