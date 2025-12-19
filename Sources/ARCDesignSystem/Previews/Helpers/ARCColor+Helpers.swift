//
//  ARCColor+Helpers.swift
//  ARCDesignSystem
//
//  Created by ARC Labs on 4/11/25.
//

import SwiftUI
#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

// MARK: - ARC Color Cross-Platform Helpers

/// Cross-platform color helper for the ARC Design System.
///
/// `ARCColorHelper` provides a unified API to access design system colors
/// across both UIKit (iOS/tvOS/watchOS) and AppKit (macOS) environments.
/// It eliminates compile-time errors caused by platform-specific color types
/// and ensures consistent appearance across all Apple platforms.
///
/// ## When to Use
///
/// Use `ARCColorHelper` in cross-platform preview code. In production views,
/// prefer using SwiftUI's native colors directly:
/// - `.primary`, `.secondary` for text
/// - `.tint` or `.accentColor` for highlights
/// - `.arcBackgroundPrimary`, `.arcBackgroundSecondary` for backgrounds
///
/// ## Available Colors
///
/// ### Text Colors
/// - ``textPrimary``: Primary text color (wraps `.primary`)
/// - ``textSecondary``: Secondary/caption text color (wraps `.secondary`)
///
/// ### Background Colors
/// - ``backgroundPrimary``: Main screen background
/// - ``backgroundSecondary``: Cards and elevated surfaces
/// - ``backgroundTertiary``: Subtle separation backgrounds
///
/// ### Brand Colors
/// - ``accent``: Accent/emphasis color (wraps `.tint`)
///
/// ### Shadow Colors
/// - ``shadowMedium``: Standard elevation shadow
///
/// ## Example Usage
///
/// ```swift
/// // For previews and cross-platform code
/// Text("Hello")
///     .foregroundStyle(ARCColorHelper.textPrimary)
///     .padding()
///     .background(ARCColorHelper.backgroundSecondary)
/// ```
///
/// - Note: All colors automatically adapt to light/dark mode and respect
///   system appearance settings on each platform.
public enum ARCColorHelper {
    // MARK: Text Colors

    /// Primary text color that adapts to the current platform.
    ///
    /// Returns SwiftUI's native `.primary` color which provides appropriate
    /// contrast on all platforms.
    ///
    /// - Note: In production code, use `.foregroundStyle(.primary)` directly.
    public static var textPrimary: Color {
        Color.primary
    }

    /// Secondary text color for captions, hints, and supporting content.
    ///
    /// Returns SwiftUI's native `.secondary` color which provides appropriate
    /// reduced contrast on all platforms.
    ///
    /// - Note: In production code, use `.foregroundStyle(.secondary)` directly.
    public static var textSecondary: Color {
        Color.secondary
    }

    // MARK: - Background Colors

    /// Primary background color for screens and main content areas.
    ///
    /// Returns the appropriate primary background color for the platform:
    /// - iOS/tvOS/watchOS: `UIColor.systemBackground`
    /// - macOS: `NSColor.windowBackgroundColor`
    ///
    /// This is the base layer for your application's views. It automatically
    /// adapts between light and dark mode.
    public static var backgroundPrimary: Color {
        #if canImport(UIKit)
        return .arcBackgroundPrimary
        #elseif canImport(AppKit)
        return Color(NSColor.windowBackgroundColor)
        #else
        return Color.white
        #endif
    }

    /// Secondary background color for cards, containers, and elevated surfaces.
    ///
    /// Returns the appropriate secondary background color for the platform:
    /// - iOS/tvOS/watchOS: `UIColor.secondarySystemBackground`
    /// - macOS: `NSColor.controlBackgroundColor`
    ///
    /// Use this color for cards, containers, and any UI elements that should
    /// appear elevated above the primary background.
    public static var backgroundSecondary: Color {
        #if canImport(UIKit)
        return .arcBackgroundSecondary
        #elseif canImport(AppKit)
        return Color(NSColor.controlBackgroundColor)
        #else
        return Color.gray.opacity(0.15)
        #endif
    }

    /// Tertiary background color for subtle visual separation.
    ///
    /// Returns the appropriate tertiary background color for the platform:
    /// - iOS/tvOS/watchOS: `UIColor.tertiarySystemBackground`
    /// - macOS: `NSColor.underPageBackgroundColor`
    ///
    /// This color provides the most subtle background variation, ideal for
    /// grouped content, sidebars, or sections requiring minimal visual weight.
    public static var backgroundTertiary: Color {
        #if canImport(UIKit)
        return .arcBackgroundTertiary
        #elseif canImport(AppKit)
        return Color(NSColor.underPageBackgroundColor)
        #else
        return Color.gray.opacity(0.1)
        #endif
    }

    // MARK: - Brand Colors

    /// Accent color for emphasis and branding.
    ///
    /// Returns SwiftUI's native accent color which automatically adapts
    /// to the app's accent color setting.
    ///
    /// - Note: In production code, use `.tint` or `.accentColor` directly.
    public static var accent: Color {
        Color.accentColor
    }

    // MARK: - Shadows

    /// Medium-level shadow color for creating elevation and depth.
    ///
    /// Returns a consistent shadow color across all platforms (black with 15% opacity).
    ///
    /// Use this color with SwiftUI's `.shadow()` modifier to add depth
    /// to cards, buttons, and floating UI elements.
    public static var shadowMedium: Color {
        #if canImport(UIKit)
        return .arcShadowMedium
        #elseif canImport(AppKit)
        return Color.black.opacity(0.15)
        #else
        return Color.black.opacity(0.15)
        #endif
    }
}
