//
//  CornerRadiusTokensTests.swift
//  ARCDesignSystem
//
//  Created by ARC Labs on 4/11/25.
//

import Foundation
import Testing
@testable import ARCDesignSystem

@Suite("Corner Radius Tokens Tests")
struct CornerRadiusTokensTests {
    @Test("Small corner radius has correct value")
    func smallCornerRadiusHasCorrectValue() {
        #expect(CGFloat.arcCornerRadiusSmall == 8, "Small corner radius should be 8pt")
    }

    @Test("Medium corner radius has correct value")
    func mediumCornerRadiusHasCorrectValue() {
        #expect(CGFloat.arcCornerRadiusMedium == 16, "Medium corner radius should be 16pt")
    }

    @Test("Large corner radius has correct value")
    func largeCornerRadiusHasCorrectValue() {
        #expect(CGFloat.arcCornerRadiusLarge == 24, "Large corner radius should be 24pt")
    }

    @Test("XLarge corner radius has correct value")
    func xLargeCornerRadiusHasCorrectValue() {
        #expect(CGFloat.arcCornerRadiusXLarge == 32, "XLarge corner radius should be 32pt")
    }

    @Test("Corner radius tokens are in ascending order")
    func cornerRadiusTokensAreInAscendingOrder() {
        #expect(CGFloat.arcCornerRadiusSmall < CGFloat.arcCornerRadiusMedium)
        #expect(CGFloat.arcCornerRadiusMedium < CGFloat.arcCornerRadiusLarge)
        #expect(CGFloat.arcCornerRadiusLarge < CGFloat.arcCornerRadiusXLarge)
    }

    @Test("All corner radius tokens are positive")
    func allCornerRadiusTokensArePositive() {
        #expect(CGFloat.arcCornerRadiusSmall > 0)
        #expect(CGFloat.arcCornerRadiusMedium > 0)
        #expect(CGFloat.arcCornerRadiusLarge > 0)
        #expect(CGFloat.arcCornerRadiusXLarge > 0)
    }
}
