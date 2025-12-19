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
    @Test("XSmall spacing has correct value")
    func xSmallSpacingHasCorrectValue() {
        #expect(CGFloat.arcSpacingXSmall == 4, "XSmall spacing should be 4pt")
    }

    @Test("Small spacing has correct value")
    func smallSpacingHasCorrectValue() {
        #expect(CGFloat.arcSpacingSmall == 8, "Small spacing should be 8pt")
    }

    @Test("Medium spacing has correct value")
    func mediumSpacingHasCorrectValue() {
        #expect(CGFloat.arcSpacingMedium == 12, "Medium spacing should be 12pt")
    }

    @Test("Large spacing has correct value")
    func largeSpacingHasCorrectValue() {
        #expect(CGFloat.arcSpacingLarge == 16, "Large spacing should be 16pt")
    }

    @Test("XLarge spacing has correct value")
    func xLargeSpacingHasCorrectValue() {
        #expect(CGFloat.arcSpacingXLarge == 24, "XLarge spacing should be 24pt")
    }

    @Test("XXLarge spacing has correct value")
    func xxLargeSpacingHasCorrectValue() {
        #expect(CGFloat.arcSpacingXXLarge == 32, "XXLarge spacing should be 32pt")
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
