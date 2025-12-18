//
//  CGFloat+Spacing.swift
//  ARCDesignSystem
//
//  Created by ARC Labs on 4/11/25.
//

import SwiftUI

/// Adaptive spacing tokens for the ARC Design System.
///
/// These spacing values provide a consistent vertical and horizontal rhythm throughout
/// your application. All values automatically scale based on the user's Dynamic Type
/// settings via ``ARCLayoutScale/arcScaleFactor``.
///
/// ## Available Spacing Tokens
///
/// | Token | Base Value | Use Case |
/// |-------|------------|----------|
/// | ``arcSpacingXSmall`` | 4pt | Minimal gaps, tight layouts |
/// | ``arcSpacingSmall`` | 8pt | Compact spacing, list items |
/// | ``arcSpacingMedium`` | 12pt | Standard element spacing |
/// | ``arcSpacingLarge`` | 16pt | Section spacing, card padding |
/// | ``arcSpacingXLarge`` | 24pt | Large gaps between sections |
/// | ``arcSpacingXXLarge`` | 32pt | Maximum spacing, major separators |
///
/// ## Example Usage
///
/// ```swift
/// VStack(spacing: .arcSpacingMedium) {
///     Text("Title")
///     Text("Subtitle")
/// }
/// .padding(.arcSpacingLarge)
/// ```
///
/// - Note: All spacing values scale proportionally with Dynamic Type to maintain
///   consistent visual hierarchy across accessibility settings.
extension CGFloat {
    /// Extra small spacing token (4pt base).
    ///
    /// Use for minimal gaps between tightly related elements or when space is limited.
    ///
    /// - Returns: 4pt multiplied by the current Dynamic Type scale factor.
    public static var arcSpacingXSmall: CGFloat { 4 * ARCLayoutScale.arcScaleFactor }

    /// Small spacing token (8pt base).
    ///
    /// Ideal for compact layouts, list item spacing, or spacing between related elements.
    ///
    /// - Returns: 8pt multiplied by the current Dynamic Type scale factor.
    public static var arcSpacingSmall: CGFloat { 8 * ARCLayoutScale.arcScaleFactor }

    /// Medium spacing token (12pt base).
    ///
    /// Standard spacing for most UI elements. Use as the default gap between components.
    ///
    /// - Returns: 12pt multiplied by the current Dynamic Type scale factor.
    public static var arcSpacingMedium: CGFloat { 12 * ARCLayoutScale.arcScaleFactor }

    /// Large spacing token (16pt base).
    ///
    /// Use for section spacing, card padding, or creating clear visual separation.
    ///
    /// - Returns: 16pt multiplied by the current Dynamic Type scale factor.
    public static var arcSpacingLarge: CGFloat { 16 * ARCLayoutScale.arcScaleFactor }

    /// Extra large spacing token (24pt base).
    ///
    /// Creates significant visual separation between major sections or content blocks.
    ///
    /// - Returns: 24pt multiplied by the current Dynamic Type scale factor.
    public static var arcSpacingXLarge: CGFloat { 24 * ARCLayoutScale.arcScaleFactor }

    /// Extra extra large spacing token (32pt base).
    ///
    /// Maximum spacing for major visual separators or hero sections.
    ///
    /// - Returns: 32pt multiplied by the current Dynamic Type scale factor.
    public static var arcSpacingXXLarge: CGFloat { 32 * ARCLayoutScale.arcScaleFactor }
}
