//
//  CGFloat+CornerRadius.swift
//  ARCDesignSystem
//
//  Created by ARC Labs on 4/11/25.
//

import SwiftUI

/// Adaptive corner radius tokens for the ARC Design System.
///
/// These corner radius values ensure consistent roundness across all UI elements
/// while maintaining Apple's Human Interface Guidelines. All values scale with
/// Dynamic Type (multiplied by 0.8 to avoid excessive roundness at large text sizes).
///
/// ## Available Corner Radius Tokens
///
/// | Token | Base Value | Use Case |
/// |-------|------------|----------|
/// | ``arcCornerRadiusSmall`` | 6.4pt | Buttons, small cards, tags |
/// | ``arcCornerRadiusMedium`` | 12.8pt | Cards, containers, modals |
/// | ``arcCornerRadiusLarge`` | 19.2pt | Large cards, hero sections |
/// | ``arcCornerRadiusXLarge`` | 25.6pt | Full-screen cards, sheets |
///
/// ## Example Usage
///
/// ```swift
/// RoundedRectangle(cornerRadius: .arcCornerRadiusMedium)
///     .fill(.arcBackgroundSecondary)
///     .frame(width: 200, height: 100)
/// ```
///
/// - Note: Corner radius values are scaled by Dynamic Type × 0.8 to maintain
///   reasonable roundness even with large accessibility text sizes.
extension CGFloat {
    /// Small corner radius token (6.4pt base).
    ///
    /// Suitable for small elements like buttons, tags, badges, or compact cards.
    ///
    /// - Returns: 8pt × scale factor × 0.8.
    public static var arcCornerRadiusSmall: CGFloat { 8 * ARCLayoutScale.arcScaleFactor * 0.8 }

    /// Medium corner radius token (12.8pt base).
    ///
    /// Standard corner radius for cards, containers, input fields, and modals.
    ///
    /// - Returns: 16pt × scale factor × 0.8.
    public static var arcCornerRadiusMedium: CGFloat { 16 * ARCLayoutScale.arcScaleFactor * 0.8 }

    /// Large corner radius token (19.2pt base).
    ///
    /// Creates prominent rounded corners for large cards, hero sections, or featured content.
    ///
    /// - Returns: 24pt × scale factor × 0.8.
    public static var arcCornerRadiusLarge: CGFloat { 24 * ARCLayoutScale.arcScaleFactor * 0.8 }

    /// Extra large corner radius token (25.6pt base).
    ///
    /// Maximum roundness for full-screen cards, bottom sheets, or immersive UI elements.
    ///
    /// - Returns: 32pt × scale factor × 0.8.
    public static var arcCornerRadiusXLarge: CGFloat { 32 * ARCLayoutScale.arcScaleFactor * 0.8 }
}
