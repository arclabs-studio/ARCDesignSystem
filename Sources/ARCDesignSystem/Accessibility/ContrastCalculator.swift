//
//  ContrastCalculator.swift
//  ARCDesignSystem
//
//  Created by ARC Labs on 1/24/26.
//

import SwiftUI
#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

/// WCAG 2.1 contrast ratio calculator for accessibility validation.
///
/// This utility calculates contrast ratios between colors according to the
/// Web Content Accessibility Guidelines (WCAG) 2.1 specification.
///
/// ## WCAG Compliance Levels
///
/// | Level | Normal Text (<18pt) | Large Text (≥18pt or 14pt bold) |
/// |-------|--------------------|---------------------------------|
/// | AA    | 4.5:1              | 3.0:1                           |
/// | AAA   | 7.0:1              | 4.5:1                           |
///
/// ## Example Usage
///
/// ```swift
/// // Calculate contrast ratio
/// let ratio = ARCContrastCalculator.contrastRatio(
///     foreground: .arcBrandBurgundy,
///     background: .white
/// )
///
/// // Validate against WCAG AA
/// let passesAA = ARCContrastCalculator.meetsWCAG(
///     foreground: .arcBrandBurgundy,
///     background: .white,
///     level: .AA,
///     isLargeText: false
/// )
/// ```
///
/// - Note: This implementation follows the WCAG 2.1 relative luminance formula.
///   See https://www.w3.org/TR/WCAG21/#dfn-relative-luminance
public struct ARCContrastCalculator: Sendable {
    // MARK: - Types

    /// WCAG compliance level.
    public enum WCAGLevel: Sendable {
        /// Level AA - Minimum acceptable contrast.
        case AA
        /// Level AAA - Enhanced contrast for better accessibility.
        case AAA
    }

    /// Result of a contrast validation.
    public struct ValidationResult: Sendable {
        /// The calculated contrast ratio (e.g., 4.5 for 4.5:1).
        public let ratio: Double
        /// Whether the contrast meets WCAG AA requirements.
        public let meetsAA: Bool
        /// Whether the contrast meets WCAG AAA requirements.
        public let meetsAAA: Bool
        /// Whether the validation was for large text.
        public let isLargeText: Bool

        /// Human-readable description of the ratio.
        public var ratioDescription: String {
            String(format: "%.2f:1", ratio)
        }
    }

    // MARK: - WCAG Constants

    /// Minimum contrast ratio for normal text to meet WCAG AA.
    public static let wcagAANormalText: Double = 4.5

    /// Minimum contrast ratio for large text to meet WCAG AA.
    public static let wcagAALargeText: Double = 3.0

    /// Minimum contrast ratio for normal text to meet WCAG AAA.
    public static let wcagAAANormalText: Double = 7.0

    /// Minimum contrast ratio for large text to meet WCAG AAA.
    public static let wcagAAALargeText: Double = 4.5

    /// Minimum contrast ratio for UI components and graphical objects.
    public static let wcagUIComponents: Double = 3.0

    // MARK: - Luminance Calculation

    /// Calculates the relative luminance of a color.
    ///
    /// The formula follows WCAG 2.1 specification:
    /// L = 0.2126 * R + 0.7152 * G + 0.0722 * B
    ///
    /// Where R, G, B are:
    /// - value / 12.92 if value ≤ 0.03928
    /// - ((value + 0.055) / 1.055) ^ 2.4 otherwise
    ///
    /// - Parameter color: The color to calculate luminance for.
    /// - Returns: Relative luminance value between 0 (black) and 1 (white).
    public static func relativeLuminance(of color: Color) -> Double {
        let components = color.rgbComponents
        return relativeLuminance(
            red: components.red,
            green: components.green,
            blue: components.blue
        )
    }

    /// Calculates relative luminance from RGB components.
    ///
    /// - Parameters:
    ///   - red: Red component (0.0 to 1.0).
    ///   - green: Green component (0.0 to 1.0).
    ///   - blue: Blue component (0.0 to 1.0).
    /// - Returns: Relative luminance value between 0 and 1.
    public static func relativeLuminance(
        red: Double,
        green: Double,
        blue: Double
    ) -> Double {
        let linearRed = linearize(red)
        let linearGreen = linearize(green)
        let linearBlue = linearize(blue)
        return 0.2126 * linearRed + 0.7152 * linearGreen + 0.0722 * linearBlue
    }

    /// Linearizes an sRGB color component for luminance calculation.
    private static func linearize(_ component: Double) -> Double {
        if component <= 0.03928 {
            component / 12.92
        } else {
            pow((component + 0.055) / 1.055, 2.4)
        }
    }

    // MARK: - Contrast Ratio

    /// Calculates the WCAG contrast ratio between two colors.
    ///
    /// The contrast ratio ranges from 1:1 (no contrast) to 21:1 (black on white).
    ///
    /// - Parameters:
    ///   - foreground: The foreground (text) color.
    ///   - background: The background color.
    /// - Returns: The contrast ratio (e.g., 4.5 for 4.5:1).
    public static func contrastRatio(
        foreground: Color,
        background: Color
    ) -> Double {
        let l1 = relativeLuminance(of: foreground)
        let l2 = relativeLuminance(of: background)
        return contrastRatio(luminance1: l1, luminance2: l2)
    }

    /// Calculates contrast ratio from two luminance values.
    ///
    /// - Parameters:
    ///   - luminance1: First luminance value.
    ///   - luminance2: Second luminance value.
    /// - Returns: The contrast ratio.
    public static func contrastRatio(
        luminance1: Double,
        luminance2: Double
    ) -> Double {
        let lighter = max(luminance1, luminance2)
        let darker = min(luminance1, luminance2)
        return (lighter + 0.05) / (darker + 0.05)
    }

    // MARK: - WCAG Validation

    /// Validates whether a color pair meets WCAG contrast requirements.
    ///
    /// - Parameters:
    ///   - foreground: The foreground (text) color.
    ///   - background: The background color.
    ///   - level: The WCAG level to validate against (AA or AAA).
    ///   - isLargeText: Whether the text is considered large (≥18pt or 14pt bold).
    /// - Returns: `true` if the contrast meets the specified requirements.
    public static func meetsWCAG(
        foreground: Color,
        background: Color,
        level: WCAGLevel,
        isLargeText: Bool = false
    ) -> Bool {
        let ratio = contrastRatio(foreground: foreground, background: background)
        let required = requiredRatio(for: level, isLargeText: isLargeText)
        return ratio >= required
    }

    /// Returns the required contrast ratio for a WCAG level.
    ///
    /// - Parameters:
    ///   - level: The WCAG level.
    ///   - isLargeText: Whether the text is considered large.
    /// - Returns: The minimum required contrast ratio.
    public static func requiredRatio(
        for level: WCAGLevel,
        isLargeText: Bool
    ) -> Double {
        switch (level, isLargeText) {
        case (.AA, false):
            wcagAANormalText
        case (.AA, true):
            wcagAALargeText
        case (.AAA, false):
            wcagAAANormalText
        case (.AAA, true):
            wcagAAALargeText
        }
    }

    /// Performs a complete validation and returns detailed results.
    ///
    /// - Parameters:
    ///   - foreground: The foreground (text) color.
    ///   - background: The background color.
    ///   - isLargeText: Whether the text is considered large.
    /// - Returns: A `ValidationResult` with detailed contrast information.
    public static func validate(
        foreground: Color,
        background: Color,
        isLargeText: Bool = false
    ) -> ValidationResult {
        let ratio = contrastRatio(foreground: foreground, background: background)
        let aaRequired = requiredRatio(for: .AA, isLargeText: isLargeText)
        let aaaRequired = requiredRatio(for: .AAA, isLargeText: isLargeText)

        return ValidationResult(
            ratio: ratio,
            meetsAA: ratio >= aaRequired,
            meetsAAA: ratio >= aaaRequired,
            isLargeText: isLargeText
        )
    }

    // MARK: - UI Components

    /// Validates whether a color pair meets WCAG requirements for UI components.
    ///
    /// Non-text UI components and graphical objects require a minimum
    /// contrast ratio of 3:1 against adjacent colors.
    ///
    /// - Parameters:
    ///   - foreground: The UI component color.
    ///   - background: The background color.
    /// - Returns: `true` if the contrast meets UI component requirements.
    public static func meetsUIComponentRequirement(
        foreground: Color,
        background: Color
    ) -> Bool {
        let ratio = contrastRatio(foreground: foreground, background: background)
        return ratio >= wcagUIComponents
    }
}

// MARK: - RGB Components

/// RGB color components for contrast calculations.
struct RGBComponents: Sendable {
    let red: Double
    let green: Double
    let blue: Double
    let alpha: Double

    init(red: Double, green: Double, blue: Double, alpha: Double = 1.0) {
        self.red = red
        self.green = green
        self.blue = blue
        self.alpha = alpha
    }
}

// MARK: - Color Extension for RGB Components

extension Color {
    /// Extracts RGB components from a SwiftUI Color.
    ///
    /// - Note: This uses platform-specific APIs to resolve the color
    ///   in the current environment.
    var rgbComponents: RGBComponents {
        #if canImport(UIKit)
        return uiKitComponents
        #elseif canImport(AppKit)
        return appKitComponents
        #else
        // Fallback for other platforms
        return RGBComponents(red: 0.5, green: 0.5, blue: 0.5)
        #endif
    }

    #if canImport(UIKit)
    private var uiKitComponents: RGBComponents {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0

        // Resolve the color in the current trait collection
        let uiColor = UIColor(self)
        let resolvedColor = uiColor.resolvedColor(with: UITraitCollection.current)
        resolvedColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        return RGBComponents(
            red: Double(red),
            green: Double(green),
            blue: Double(blue),
            alpha: Double(alpha)
        )
    }
    #endif

    #if canImport(AppKit)
    private var appKitComponents: RGBComponents {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0

        let nsColor = NSColor(self)
        // Convert to sRGB color space for consistent results
        if let srgbColor = nsColor.usingColorSpace(.sRGB) {
            srgbColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        } else {
            // Fallback: try to get components directly
            nsColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        }

        return RGBComponents(
            red: Double(red),
            green: Double(green),
            blue: Double(blue),
            alpha: Double(alpha)
        )
    }
    #endif
}
