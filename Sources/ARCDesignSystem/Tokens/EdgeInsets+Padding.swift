//
//  EdgeInsets+Padding.swift
//  ARCDesignSystem
//
//  Created by ARC Labs on 4/11/25.
//

import SwiftUI

/// Base padding presets for the ARC Design System.
///
/// These `EdgeInsets` values provide consistent internal spacing for common layout
/// patterns. Values are base constants - use `@ScaledMetric` in your views for
/// Dynamic Type support when needed.
///
/// ## Available Padding Tokens
///
/// | Token | Values (T/L/B/R) | Use Case |
/// |-------|------------------|----------|
/// | ``arcPaddingCard`` | 16/16/16/16pt | Cards, containers |
/// | ``arcPaddingHorizontal`` | 0/16/0/16pt | Horizontal-only padding |
/// | ``arcPaddingSection`` | 24/16/24/16pt | Major sections, screens |
/// | ``arcPaddingCompact`` | 8/12/8/12pt | Buttons, small elements |
///
/// ## Example Usage
///
/// For fixed padding:
///
/// ```swift
/// VStack {
///     Text("Card Content")
/// }
/// .padding(.arcPaddingCard)
/// .background(.regularMaterial)
/// .clipShape(RoundedRectangle(cornerRadius: .arcCornerRadiusMedium))
/// ```
///
/// For Dynamic Type support, use individual `@ScaledMetric` values:
///
/// ```swift
/// struct AdaptiveCard: View {
///     @ScaledMetric(relativeTo: .body) var verticalPadding: CGFloat = 16
///     @ScaledMetric(relativeTo: .body) var horizontalPadding: CGFloat = 16
///
///     var body: some View {
///         VStack { ... }
///             .padding(.vertical, verticalPadding)
///             .padding(.horizontal, horizontalPadding)
///     }
/// }
/// ```
extension EdgeInsets {
    /// Standard card padding (16pt on all sides).
    ///
    /// Use for cards, containers, and general content blocks that need balanced
    /// internal spacing on all edges.
    public static let arcPaddingCard = EdgeInsets(
        top: 16,
        leading: 16,
        bottom: 16,
        trailing: 16
    )

    /// Horizontal-only padding (16pt left/right, 0pt top/bottom).
    ///
    /// Ideal for list items, rows, or content that needs horizontal insets
    /// without vertical spacing.
    public static let arcPaddingHorizontal = EdgeInsets(
        top: 0,
        leading: 16,
        bottom: 0,
        trailing: 16
    )

    /// Section padding with extra vertical space (24pt top/bottom, 16pt left/right).
    ///
    /// Use for major content sections, full screens, or areas requiring
    /// generous vertical breathing room.
    public static let arcPaddingSection = EdgeInsets(
        top: 24,
        leading: 16,
        bottom: 24,
        trailing: 16
    )

    /// Compact padding for small elements (8pt top/bottom, 12pt left/right).
    ///
    /// Perfect for buttons, tags, badges, or other compact UI components
    /// that need minimal internal spacing.
    public static let arcPaddingCompact = EdgeInsets(
        top: 8,
        leading: 12,
        bottom: 8,
        trailing: 12
    )
}
