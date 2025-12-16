//
//  EdgeInsets+Padding.swift
//  ARCDesignSystem
//
//  Created by ARC Labs on 4/11/25.
//

import SwiftUI

/// Adaptive padding presets for the ARC Design System.
///
/// These `EdgeInsets` values provide consistent internal spacing for common layout
/// patterns. All padding values scale proportionally with Dynamic Type to ensure
/// accessibility and visual consistency.
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
/// ```swift
/// VStack {
///     Text("Card Content")
/// }
/// .padding(.arcPaddingCard)
/// .background(.arcBackgroundSecondary)
/// .clipShape(RoundedRectangle(cornerRadius: .arcCornerRadiusMedium))
/// ```
///
/// - Note: All padding values automatically adjust based on the user's
///   Dynamic Type preference via ``ARCLayoutScale/arcScaleFactor``.
public extension EdgeInsets {
    /// Standard card padding (16pt on all sides).
    ///
    /// Use for cards, containers, and general content blocks that need balanced
    /// internal spacing on all edges.
    ///
    /// - Returns: EdgeInsets with 16pt (scaled) on all sides.
    static var arcPaddingCard: EdgeInsets {
        let scaleFactor = ARCLayoutScale.arcScaleFactor
        return EdgeInsets(
            top: 16 * scaleFactor,
            leading: 16 * scaleFactor,
            bottom: 16 * scaleFactor,
            trailing: 16 * scaleFactor
        )
    }

    /// Horizontal-only padding (16pt left/right, 0pt top/bottom).
    ///
    /// Ideal for list items, rows, or content that needs horizontal insets
    /// without vertical spacing.
    ///
    /// - Returns: EdgeInsets with 16pt (scaled) on leading/trailing edges only.
    static var arcPaddingHorizontal: EdgeInsets {
        let scaleFactor = ARCLayoutScale.arcScaleFactor
        return EdgeInsets(
            top: 0,
            leading: 16 * scaleFactor,
            bottom: 0,
            trailing: 16 * scaleFactor
        )
    }

    /// Section padding with extra vertical space (24pt top/bottom, 16pt left/right).
    ///
    /// Use for major content sections, full screens, or areas requiring
    /// generous vertical breathing room.
    ///
    /// - Returns: EdgeInsets with 24pt (scaled) vertical and 16pt (scaled) horizontal.
    static var arcPaddingSection: EdgeInsets {
        let scaleFactor = ARCLayoutScale.arcScaleFactor
        return EdgeInsets(
            top: 24 * scaleFactor,
            leading: 16 * scaleFactor,
            bottom: 24 * scaleFactor,
            trailing: 16 * scaleFactor
        )
    }

    /// Compact padding for small elements (8pt top/bottom, 12pt left/right).
    ///
    /// Perfect for buttons, tags, badges, or other compact UI components
    /// that need minimal internal spacing.
    ///
    /// - Returns: EdgeInsets with 8pt (scaled) vertical and 12pt (scaled) horizontal.
    static var arcPaddingCompact: EdgeInsets {
        let scaleFactor = ARCLayoutScale.arcScaleFactor
        return EdgeInsets(
            top: 8 * scaleFactor,
            leading: 12 * scaleFactor,
            bottom: 8 * scaleFactor,
            trailing: 12 * scaleFactor
        )
    }
}
