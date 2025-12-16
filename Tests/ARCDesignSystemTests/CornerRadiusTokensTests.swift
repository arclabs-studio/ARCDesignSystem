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
    @Test("Small corner radius has correct base value")
    func smallCornerRadiusHasCorrectBaseValue() {
        let radius = CGFloat.arcCornerRadiusSmall
        let scaleFactor = ARCLayoutScale.arcScaleFactor
        let expectedValue = 8 * scaleFactor * 0.8

        #expect(radius == expectedValue, "Small corner radius should be 8pt × scale × 0.8")
    }

    @Test("Medium corner radius has correct base value")
    func mediumCornerRadiusHasCorrectBaseValue() {
        let radius = CGFloat.arcCornerRadiusMedium
        let scaleFactor = ARCLayoutScale.arcScaleFactor
        let expectedValue = 16 * scaleFactor * 0.8

        #expect(radius == expectedValue, "Medium corner radius should be 16pt × scale × 0.8")
    }

    @Test("Large corner radius has correct base value")
    func largeCornerRadiusHasCorrectBaseValue() {
        let radius = CGFloat.arcCornerRadiusLarge
        let scaleFactor = ARCLayoutScale.arcScaleFactor
        let expectedValue = 24 * scaleFactor * 0.8

        #expect(radius == expectedValue, "Large corner radius should be 24pt × scale × 0.8")
    }

    @Test("XLarge corner radius has correct base value")
    func xLargeCornerRadiusHasCorrectBaseValue() {
        let radius = CGFloat.arcCornerRadiusXLarge
        let scaleFactor = ARCLayoutScale.arcScaleFactor
        let expectedValue = 32 * scaleFactor * 0.8

        #expect(radius == expectedValue, "XLarge corner radius should be 32pt × scale × 0.8")
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
