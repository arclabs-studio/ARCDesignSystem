//
//  ARCLayoutScaleTests.swift
//  ARCDesignSystem
//
//  Created by ARC Labs on 4/11/25.
//

import Testing
@testable import ARCDesignSystem

@Suite("ARC Layout Scale Tests")
struct ARCLayoutScaleTests {
    @Test("Scale factor returns valid value")
    func scaleFactorReturnsValidValue() {
        let scaleFactor = ARCLayoutScale.arcScaleFactor

        #expect(scaleFactor >= 0.9, "Scale factor should be at least 0.9")
        #expect(scaleFactor <= 1.7, "Scale factor should be at most 1.7")
    }

    @Test("Scale factor is positive")
    func scaleFactorIsPositive() {
        let scaleFactor = ARCLayoutScale.arcScaleFactor

        #expect(scaleFactor > 0, "Scale factor must be positive")
    }
}
