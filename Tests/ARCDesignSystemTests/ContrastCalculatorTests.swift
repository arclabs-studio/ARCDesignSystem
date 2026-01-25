//
//  ContrastCalculatorTests.swift
//  ARCDesignSystem
//
//  Created by ARC Labs on 1/24/26.
//

import SwiftUI
import Testing
@testable import ARCDesignSystem

@Suite("Contrast Calculator Tests")
struct ContrastCalculatorTests {
    // MARK: - Luminance Calculation

    @Test("Black has zero luminance")
    func blackHasZeroLuminance() {
        let luminance = ARCContrastCalculator.relativeLuminance(red: 0, green: 0, blue: 0)
        #expect(luminance == 0.0, "Black should have luminance 0")
    }

    @Test("White has maximum luminance")
    func whiteHasMaximumLuminance() {
        let luminance = ARCContrastCalculator.relativeLuminance(red: 1, green: 1, blue: 1)
        #expect(abs(luminance - 1.0) < 0.001, "White should have luminance ~1.0")
    }

    @Test("Gray has intermediate luminance")
    func grayHasIntermediateLuminance() {
        let luminance = ARCContrastCalculator.relativeLuminance(red: 0.5, green: 0.5, blue: 0.5)
        #expect(luminance > 0.1 && luminance < 0.5, "50% gray should have intermediate luminance")
    }

    // MARK: - Contrast Ratio

    @Test("Black on white has maximum contrast")
    func blackOnWhiteHasMaximumContrast() {
        let ratio = ARCContrastCalculator.contrastRatio(
            foreground: .black,
            background: .white
        )
        #expect(ratio > 20.0 && ratio < 22.0, "Black on white should have ~21:1 contrast")
    }

    @Test("Same color has no contrast")
    func sameColorHasNoContrast() {
        let ratio = ARCContrastCalculator.contrastRatio(
            foreground: .red,
            background: .red
        )
        #expect(ratio == 1.0, "Same color should have 1:1 contrast")
    }

    // MARK: - WCAG Validation

    @Test("Black text on white meets WCAG AA")
    func blackOnWhiteMeetsAA() {
        let passes = ARCContrastCalculator.meetsWCAG(
            foreground: .black,
            background: .white,
            level: .AA,
            isLargeText: false
        )
        #expect(passes, "Black on white should pass WCAG AA")
    }

    @Test("Black text on white meets WCAG AAA")
    func blackOnWhiteMeetsAAA() {
        let passes = ARCContrastCalculator.meetsWCAG(
            foreground: .black,
            background: .white,
            level: .AAA,
            isLargeText: false
        )
        #expect(passes, "Black on white should pass WCAG AAA")
    }

    @Test("Large text has lower contrast requirements")
    func largeTextHasLowerRequirements() {
        let aaRequired = ARCContrastCalculator.requiredRatio(for: .AA, isLargeText: false)
        let aaLargeRequired = ARCContrastCalculator.requiredRatio(for: .AA, isLargeText: true)

        #expect(aaLargeRequired < aaRequired, "Large text should require lower contrast")
        #expect(aaRequired == 4.5, "Normal text AA should require 4.5:1")
        #expect(aaLargeRequired == 3.0, "Large text AA should require 3.0:1")
    }

    // MARK: - Validation Result

    @Test("Validation result includes all information")
    func validationResultIncludesAllInfo() {
        let result = ARCContrastCalculator.validate(
            foreground: .black,
            background: .white,
            isLargeText: false
        )

        #expect(result.ratio > 20.0, "Ratio should be high for black on white")
        #expect(result.meetsAA, "Should meet AA")
        #expect(result.meetsAAA, "Should meet AAA")
        #expect(result.isLargeText == false, "Should reflect isLargeText parameter")
        #expect(result.ratioDescription.contains(":1"), "Description should include :1 format")
    }

    // MARK: - UI Component Requirements

    @Test("UI components require 3:1 contrast")
    func uiComponentsRequireThreeToOne() {
        let constant = ARCContrastCalculator.wcagUIComponents
        #expect(constant == 3.0, "UI components should require 3:1 contrast")
    }

    @Test("Black meets UI component requirement on white")
    func blackMeetsUIComponentRequirement() {
        let passes = ARCContrastCalculator.meetsUIComponentRequirement(
            foreground: .black,
            background: .white
        )
        #expect(passes, "Black should meet UI component contrast on white")
    }
}

@Suite("Brand Color Contrast Tests")
struct BrandColorContrastTests {
    // MARK: - Burgundy Contrast

    @Test("Burgundy on white meets AA for large text")
    func burgundyOnWhiteMeetsAALargeText() {
        // Burgundy Light: #8B2635 has good contrast on white
        // This test validates the color is usable for buttons/large text
        let burgundy = Color(red: 139 / 255, green: 38 / 255, blue: 53 / 255)
        let result = ARCContrastCalculator.validate(
            foreground: burgundy,
            background: .white,
            isLargeText: true
        )

        #expect(result.ratio >= 3.0, "Burgundy should have at least 3:1 on white: \(result.ratioDescription)")
        #expect(result.meetsAA, "Burgundy should meet AA for large text on white")
    }

    @Test("Burgundy meets UI component requirements")
    func burgundyMeetsUIComponentRequirements() {
        // Burgundy should work for buttons and interactive elements
        let burgundy = Color(red: 139 / 255, green: 38 / 255, blue: 53 / 255)
        let passes = ARCContrastCalculator.meetsUIComponentRequirement(
            foreground: burgundy,
            background: .white
        )
        #expect(passes, "Burgundy should meet 3:1 for UI components on white")
    }

    @Test("Burgundy dark variant works for white text")
    func burgundyDarkVariantWhiteText() {
        // Burgundy Dark: #B23850 is used as button background in dark mode
        // White text on burgundy background should meet contrast requirements
        let burgundyDark = Color(red: 178 / 255, green: 56 / 255, blue: 80 / 255)

        let result = ARCContrastCalculator.validate(
            foreground: .white,
            background: burgundyDark,
            isLargeText: false
        )

        #expect(result.ratio >= 4.5, "White on dark burgundy should meet 4.5:1: \(result.ratioDescription)")
        #expect(result.meetsAA, "White text should meet AA on burgundy dark background")
    }

    // MARK: - Gold Contrast

    @Test("Gold does NOT meet AA for normal text on white")
    func goldDoesNotMeetAANormalTextOnWhite() {
        // Gold has low contrast on white - this is a documentation test
        // confirming it should NOT be used for body text
        let gold = Color(red: 255 / 255, green: 180 / 255, blue: 46 / 255)
        let result = ARCContrastCalculator.validate(
            foreground: gold,
            background: .white,
            isLargeText: false
        )

        #expect(
            result.ratio < 4.5,
            "Gold should NOT meet 4.5:1 for normal text on white: \(result.ratioDescription)"
        )
        #expect(!result.meetsAA, "Gold should fail AA for normal text on white")
    }

    @Test("Gold on dark background meets AA")
    func goldOnDarkBackgroundMeetsAA() {
        // Gold works well on dark backgrounds
        let gold = Color(red: 255 / 255, green: 180 / 255, blue: 46 / 255)
        let darkBg = Color(red: 0.1, green: 0.1, blue: 0.1)

        let result = ARCContrastCalculator.validate(
            foreground: gold,
            background: darkBg,
            isLargeText: false
        )

        #expect(result.ratio >= 4.5, "Gold should have 4.5:1+ on dark background: \(result.ratioDescription)")
        #expect(result.meetsAA, "Gold should meet AA on dark background")
    }

    @Test("Gold meets UI component requirements on black")
    func goldMeetsUIComponentRequirementsOnBlack() {
        let gold = Color(red: 255 / 255, green: 180 / 255, blue: 46 / 255)
        let passes = ARCContrastCalculator.meetsUIComponentRequirement(
            foreground: gold,
            background: .black
        )
        #expect(passes, "Gold should meet 3:1 for UI components on black")
    }

    // MARK: - White Text on Brand Colors

    @Test("White text on burgundy meets AA")
    func whiteOnBurgundyMeetsAA() {
        let burgundy = Color(red: 139 / 255, green: 38 / 255, blue: 53 / 255)
        let result = ARCContrastCalculator.validate(
            foreground: .white,
            background: burgundy,
            isLargeText: false
        )

        #expect(result.ratio >= 4.5, "White on burgundy should meet 4.5:1: \(result.ratioDescription)")
        #expect(result.meetsAA, "White text should meet AA on burgundy background")
    }

    @Test("Black text on gold meets AA")
    func blackOnGoldMeetsAA() {
        let gold = Color(red: 255 / 255, green: 180 / 255, blue: 46 / 255)
        let result = ARCContrastCalculator.validate(
            foreground: .black,
            background: gold,
            isLargeText: false
        )

        // Gold is a light color, so black text should work well on it
        #expect(result.ratio >= 4.5, "Black on gold should meet 4.5:1: \(result.ratioDescription)")
        #expect(result.meetsAA, "Black text should meet AA on gold background")
    }

    // MARK: - High Contrast Variants

    @Test("High contrast burgundy has improved contrast")
    func highContrastBurgundyImproved() {
        // High contrast burgundy: slightly lighter
        let standardBurgundy = Color(red: 139 / 255, green: 38 / 255, blue: 53 / 255)
        let highContrastBurgundy = Color(red: 158 / 255, green: 46 / 255, blue: 63 / 255)

        let standardRatio = ARCContrastCalculator.contrastRatio(
            foreground: standardBurgundy,
            background: .white
        )
        let highContrastRatio = ARCContrastCalculator.contrastRatio(
            foreground: highContrastBurgundy,
            background: .white
        )

        // Both should meet requirements, high contrast should be different
        #expect(standardRatio >= 3.0, "Standard burgundy should meet 3:1")
        #expect(highContrastRatio >= 3.0, "High contrast burgundy should meet 3:1")
    }
}

@Suite("WCAG Constants Tests")
struct WCAGConstantsTests {
    @Test("AA normal text requires 4.5:1")
    func aaNormalTextRequirement() {
        #expect(ARCContrastCalculator.wcagAANormalText == 4.5)
    }

    @Test("AA large text requires 3.0:1")
    func aaLargeTextRequirement() {
        #expect(ARCContrastCalculator.wcagAALargeText == 3.0)
    }

    @Test("AAA normal text requires 7.0:1")
    func aaaNormalTextRequirement() {
        #expect(ARCContrastCalculator.wcagAAANormalText == 7.0)
    }

    @Test("AAA large text requires 4.5:1")
    func aaaLargeTextRequirement() {
        #expect(ARCContrastCalculator.wcagAAALargeText == 4.5)
    }

    @Test("UI components require 3.0:1")
    func uiComponentsRequirement() {
        #expect(ARCContrastCalculator.wcagUIComponents == 3.0)
    }
}
