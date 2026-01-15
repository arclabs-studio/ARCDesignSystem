//
//  Vibrancy+Effects.swift
//  ARCDesignSystem
//
//  Created by ARC Labs on 12/19/25.
//

import SwiftUI

// MARK: - Vibrancy Effects

/// Vibrancy effects make text and symbols appear vibrant when placed over
/// materials, creating a sense of depth and helping content blend naturally
/// with the underlying material.
///
/// ## Vibrancy Levels
///
/// | Level | Modifier | Use Case |
/// |-------|----------|----------|
/// | Label | `arcVibrancyLabel()` | Main content, titles |
/// | Secondary | `arcVibrancySecondary()` | Supporting text, subtitles |
/// | Tertiary | `arcVibrancyTertiary()` | Hints, timestamps, metadata |
/// | Quaternary | `arcVibrancyQuaternary()` | Watermarks, decorative elements |
///
/// ## Material Compatibility (Apple HIG)
///
/// | Material | Label | Secondary | Tertiary | Quaternary |
/// |----------|-------|-----------|----------|------------|
/// | `.ultraThick` | ✅ | ✅ | ✅ | ✅ |
/// | `.thick` | ✅ | ✅ | ✅ | ✅ |
/// | `.regular` | ✅ | ✅ | ✅ | ✅ |
/// | `.thin` | ✅ | ✅ | ✅ | ⚠️ Low contrast |
/// | `.ultraThin` | ✅ | ✅ | ✅ | ⚠️ Low contrast |
///
/// - Important: **Avoid using quaternary vibrancy on thin and ultraThin materials**
///   because the contrast is too low for comfortable reading (Apple HIG).
///
/// ## Example Usage
///
/// ```swift
/// VStack {
///     Text("Title").arcVibrancyLabel()
///     Text("Subtitle").arcVibrancySecondary()
///     Text("Details").arcVibrancyTertiary()
/// }
/// .background(.regularMaterial)
/// ```
///
/// - Note: Vibrancy only has visible effect when content is placed over materials.

extension View {
    /// Applies primary vibrancy effect (label level).
    ///
    /// Use for main content, titles, and important text that should
    /// have maximum emphasis when placed over materials.
    ///
    /// - Returns: A view with primary foreground style.
    ///
    /// ```swift
    /// Text("Main Title")
    ///     .arcVibrancyLabel()
    /// ```
    public func arcVibrancyLabel() -> some View {
        foregroundStyle(.primary)
    }

    /// Applies secondary vibrancy effect.
    ///
    /// Use for supporting content that should be visible but less
    /// prominent than primary content.
    ///
    /// - Returns: A view with secondary foreground style.
    ///
    /// ```swift
    /// Text("Supporting text")
    ///     .arcVibrancySecondary()
    /// ```
    public func arcVibrancySecondary() -> some View {
        foregroundStyle(.secondary)
    }

    /// Applies tertiary vibrancy effect.
    ///
    /// Use for subtle content like hints, timestamps, or metadata
    /// that shouldn't compete with main content.
    ///
    /// - Returns: A view with tertiary foreground style.
    ///
    /// ```swift
    /// Text("Last updated 5 min ago")
    ///     .arcVibrancyTertiary()
    /// ```
    public func arcVibrancyTertiary() -> some View {
        foregroundStyle(.tertiary)
    }

    /// Applies quaternary vibrancy effect.
    ///
    /// Use for the least prominent content like watermarks,
    /// decorative elements, or very subtle indicators.
    ///
    /// - Warning: **Avoid using on `.thin` and `.ultraThin` materials.**
    ///   According to Apple's Human Interface Guidelines, the contrast
    ///   between quaternary text and thin/ultraThin materials is too low
    ///   for comfortable reading. Use on `.regular`, `.thick`, or
    ///   `.ultraThick` materials only.
    ///
    /// - Returns: A view with quaternary foreground style.
    ///
    /// ```swift
    /// // ✅ Good: quaternary on regular material
    /// Text("Watermark")
    ///     .arcVibrancyQuaternary()
    ///     .background(.regularMaterial)
    ///
    /// // ⚠️ Avoid: quaternary on thin material (low contrast)
    /// Text("Watermark")
    ///     .arcVibrancyQuaternary()
    ///     .background(.thinMaterial)
    /// ```
    public func arcVibrancyQuaternary() -> some View {
        foregroundStyle(.quaternary)
    }
}

// MARK: - Hierarchical Foreground Styles

extension View {
    /// Applies a hierarchical foreground style for use over materials.
    ///
    /// This modifier sets both primary and secondary foreground styles,
    /// useful for views containing mixed-emphasis content.
    ///
    /// - Parameters:
    ///   - primary: The style for primary content.
    ///   - secondary: The style for secondary content.
    /// - Returns: A view with hierarchical foreground styles applied.
    ///
    /// ```swift
    /// Label("Title", systemImage: "star")
    ///     .arcVibrancyHierarchical(primary: .primary, secondary: .secondary)
    /// ```
    public func arcVibrancyHierarchical(
        primary: some ShapeStyle,
        secondary: some ShapeStyle
    ) -> some View {
        foregroundStyle(primary, secondary)
    }
}
