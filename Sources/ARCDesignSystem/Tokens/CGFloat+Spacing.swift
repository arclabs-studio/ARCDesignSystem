//
//  CGFloat+Spacing.swift
//  ARCDesignSystem
//
//  Created by ARC Labs on 4/11/25.
//

import SwiftUI

/// Base spacing tokens for the ARC Design System.
///
/// These spacing values provide a consistent vertical and horizontal rhythm throughout
/// your application. Values are base constants - use `@ScaledMetric` in your views
/// for Dynamic Type support.
///
/// ## Available Spacing Tokens
///
/// | Token | Value | Use Case |
/// |-------|-------|----------|
/// | ``arcSpacingXSmall`` | 4pt | Minimal gaps, tight layouts |
/// | ``arcSpacingSmall`` | 8pt | Compact spacing, list items |
/// | ``arcSpacingMedium`` | 12pt | Standard element spacing |
/// | ``arcSpacingLarge`` | 16pt | Section spacing, card padding |
/// | ``arcSpacingXLarge`` | 24pt | Large gaps between sections |
/// | ``arcSpacingXXLarge`` | 32pt | Maximum spacing, major separators |
///
/// ## Example Usage
///
/// For Dynamic Type support, use `@ScaledMetric`:
///
/// ```swift
/// struct CardView: View {
///     @ScaledMetric(relativeTo: .body) var padding = CGFloat.arcSpacingLarge
///     @ScaledMetric(relativeTo: .body) var spacing = CGFloat.arcSpacingMedium
///
///     var body: some View {
///         VStack(spacing: spacing) {
///             Text("Title")
///             Text("Subtitle")
///         }
///         .padding(padding)
///     }
/// }
/// ```
///
/// For fixed spacing (rare cases):
///
/// ```swift
/// VStack(spacing: .arcSpacingMedium) {
///     Text("Title")
///     Text("Subtitle")
/// }
/// ```
///
/// - Note: Use `@ScaledMetric` to ensure spacing scales with Dynamic Type.
extension CGFloat {
    /// Extra small spacing token (4pt).
    ///
    /// Use for minimal gaps between tightly related elements or when space is limited.
    public static let arcSpacingXSmall: CGFloat = 4

    /// Small spacing token (8pt).
    ///
    /// Ideal for compact layouts, list item spacing, or spacing between related elements.
    public static let arcSpacingSmall: CGFloat = 8

    /// Medium spacing token (12pt).
    ///
    /// Standard spacing for most UI elements. Use as the default gap between components.
    public static let arcSpacingMedium: CGFloat = 12

    /// Large spacing token (16pt).
    ///
    /// Use for section spacing, card padding, or creating clear visual separation.
    public static let arcSpacingLarge: CGFloat = 16

    /// Extra large spacing token (24pt).
    ///
    /// Creates significant visual separation between major sections or content blocks.
    public static let arcSpacingXLarge: CGFloat = 24

    /// Extra extra large spacing token (32pt).
    ///
    /// Maximum spacing for major visual separators or hero sections.
    public static let arcSpacingXXLarge: CGFloat = 32
}
