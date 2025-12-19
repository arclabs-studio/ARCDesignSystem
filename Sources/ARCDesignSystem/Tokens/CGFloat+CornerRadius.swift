//
//  CGFloat+CornerRadius.swift
//  ARCDesignSystem
//
//  Created by ARC Labs on 4/11/25.
//

import SwiftUI

/// Corner radius tokens for the ARC Design System.
///
/// These corner radius values ensure consistent roundness across all UI elements
/// following Apple Human Interface Guidelines. Values are fixed and do not scale
/// with Dynamic Type (corner radius scaling is not an Apple practice).
///
/// ## Available Corner Radius Tokens
///
/// | Token | Value | Use Case |
/// |-------|-------|----------|
/// | ``arcCornerRadiusSmall`` | 8pt | Buttons, small cards, tags |
/// | ``arcCornerRadiusMedium`` | 16pt | Cards, containers, modals |
/// | ``arcCornerRadiusLarge`` | 24pt | Large cards, hero sections |
/// | ``arcCornerRadiusXLarge`` | 32pt | Full-screen cards, sheets |
///
/// ## Example Usage
///
/// ```swift
/// RoundedRectangle(cornerRadius: .arcCornerRadiusMedium)
///     .fill(.regularMaterial)
///     .frame(width: 200, height: 100)
/// ```
///
/// With clip shape:
///
/// ```swift
/// Image("hero")
///     .clipShape(RoundedRectangle(cornerRadius: .arcCornerRadiusLarge))
/// ```
extension CGFloat {
    /// Small corner radius token (8pt).
    ///
    /// Suitable for small elements like buttons, tags, badges, or compact cards.
    public static let arcCornerRadiusSmall: CGFloat = 8

    /// Medium corner radius token (16pt).
    ///
    /// Standard corner radius for cards, containers, input fields, and modals.
    public static let arcCornerRadiusMedium: CGFloat = 16

    /// Large corner radius token (24pt).
    ///
    /// Creates prominent rounded corners for large cards, hero sections, or featured content.
    public static let arcCornerRadiusLarge: CGFloat = 24

    /// Extra large corner radius token (32pt).
    ///
    /// Maximum roundness for full-screen cards, bottom sheets, or immersive UI elements.
    public static let arcCornerRadiusXLarge: CGFloat = 32
}
