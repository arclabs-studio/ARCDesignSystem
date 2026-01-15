//
//  Color+Branding.swift
//  ARCDesignSystem
//
//  Created by ARC Labs on 1/15/26.
//

import SwiftUI

/// ARC Labs Studio branding colors.
///
/// These are the official brand colors for ARC Labs Studio. They are static
/// colors that do not change with light/dark mode, as they represent the
/// brand identity.
///
/// ## Colors
///
/// - ``arcBrandBurgundy``: Primary brand color (deep red)
/// - ``arcBrandGold``: Secondary brand color (warm gold)
/// - ``arcBrandBlack``: Tertiary brand color (pure black)
///
/// ## Example Usage
///
/// ```swift
/// // Logo or brand accent
/// Image("logo")
///     .foregroundStyle(.arcBrandBurgundy)
///
/// // Highlight or call-to-action
/// Button("Get Started") { }
///     .tint(.arcBrandGold)
///
/// // Text on light backgrounds
/// Text("ARC Labs Studio")
///     .foregroundStyle(.arcBrandBlack)
/// ```
///
/// - Important: These colors are fixed brand colors. For UI elements that
///   should adapt to light/dark mode, use semantic colors like
///   ``arcBackgroundPrimary`` instead.
extension Color {
    // MARK: - Brand Colors

    /// ARC Labs Studio primary brand color (Burgundy).
    ///
    /// A deep, rich burgundy red that serves as the primary brand color.
    ///
    /// - HEX: #541311
    /// - RGB: 84, 19, 17
    public static let arcBrandBurgundy = Color(
        red: 84 / 255,
        green: 19 / 255,
        blue: 17 / 255
    )

    /// ARC Labs Studio secondary brand color (Gold).
    ///
    /// A warm, vibrant gold that serves as the secondary brand color.
    ///
    /// - HEX: #FFB42E
    /// - RGB: 255, 180, 46
    public static let arcBrandGold = Color(
        red: 255 / 255,
        green: 180 / 255,
        blue: 46 / 255
    )

    /// ARC Labs Studio tertiary brand color (Black).
    ///
    /// Pure black for text and high-contrast elements.
    ///
    /// - HEX: #000000
    /// - RGB: 0, 0, 0
    public static let arcBrandBlack = Color(
        red: 0 / 255,
        green: 0 / 255,
        blue: 0 / 255
    )
}
