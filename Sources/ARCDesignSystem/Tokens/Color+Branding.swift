//
//  Color+Branding.swift
//  ARCDesignSystem
//
//  Created by ARC Labs on 1/15/26.
//

import SwiftUI

/// ARC Labs Studio branding colors.
///
/// These are the official brand colors for ARC Labs Studio. They automatically
/// adapt to Light/Dark Mode and support High Contrast accessibility settings.
///
/// ## Colors
///
/// - ``arcBrandBurgundy``: Primary brand color (deep red)
/// - ``arcBrandGold``: Secondary brand color (warm gold)
/// - ``arcBrandBlack``: Tertiary brand color (black/white adaptive)
///
/// ## Correct Usage
///
/// Use brand colors **ONLY** for:
/// - Prominent buttons (`.borderedProminent`)
/// - Selected toggle/tab states
/// - Status icons and badges
/// - Short highlights (1-2 words)
///
/// ```swift
/// // Prominent action button
/// Button("Reserve Now") { }
///     .buttonStyle(.borderedProminent)
///     .tint(.arcBrandBurgundy)
///
/// // App accent color
/// ContentView()
///     .tint(.arcBrandGold)
///
/// // Status indicator
/// Image(systemName: "checkmark.circle.fill")
///     .foregroundStyle(.arcBrandGold)
/// ```
///
/// ## Incorrect Usage
///
/// **Never** use brand colors for:
/// - Body text or long-form content
/// - Large background areas
/// - Non-interactive UI elements
///
/// ```swift
/// // BAD: Poor contrast for reading
/// Text("This is a long paragraph...")
///     .foregroundStyle(.arcBrandGold)
///
/// // GOOD: Use semantic label colors
/// Text("This is a long paragraph...")
///     .foregroundStyle(.arcLabel)
/// ```
///
/// ## Color Values
///
/// | Color | Light Mode | Dark Mode |
/// |-------|------------|-----------|
/// | Burgundy | #8B2635 | #B23850 |
/// | Gold | #FFB42E | #FFAE1F |
/// | Black | #000000 | #FFFFFF |
///
/// - Important: These colors now support automatic adaptation. Use semantic
///   colors like ``arcBackgroundPrimary`` for general UI elements.
extension Color {
    // MARK: - Brand Colors

    /// ARC Labs Studio primary brand color (Burgundy).
    ///
    /// A deep, rich burgundy red that serves as the primary brand color.
    /// Automatically adapts to Light/Dark Mode and High Contrast settings.
    ///
    /// - Light Mode: #8B2635 (RGB: 139, 38, 53)
    /// - Dark Mode: #B23850 (RGB: 178, 56, 80)
    ///
    /// - Note: Use for prominent buttons, selected states, and brand accents only.
    public static let arcBrandBurgundy = Color("Brand/ArcBurgundy", bundle: .module)

    /// ARC Labs Studio secondary brand color (Gold).
    ///
    /// A warm, vibrant gold that serves as the secondary brand color.
    /// Automatically adapts to Light/Dark Mode and High Contrast settings.
    ///
    /// - Light Mode: #FFB42E (RGB: 255, 180, 46)
    /// - Dark Mode: #FFAE1F (RGB: 255, 174, 31)
    ///
    /// - Warning: Gold has low contrast on white backgrounds. Use only for
    ///   interactive elements, icons, or highlights—never for body text.
    public static let arcBrandGold = Color("Brand/ArcGold", bundle: .module)

    /// ARC Labs Studio tertiary brand color (Black).
    ///
    /// Pure black in Light Mode, pure white in Dark Mode. Use for text
    /// and high-contrast elements that need maximum readability.
    ///
    /// - Light Mode: #000000 (Black)
    /// - Dark Mode: #FFFFFF (White)
    ///
    /// - Tip: For most text, prefer ``arcLabel`` which uses system colors
    ///   with proper opacity levels.
    public static let arcBrandBlack = Color("Brand/ArcBlack", bundle: .module)
}
