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

// =====================================================
// MARK: - ARC Color Cross-Platform Helpers

// =====================================================

/// Cross-platform color helper for the ARC Design System.
///
/// `ARCColorHelper` provides a unified API to access design system colors
/// across both UIKit (iOS/tvOS/watchOS) and AppKit (macOS) environments.
/// It eliminates compile-time errors caused by platform-specific color types
/// and ensures consistent appearance across all Apple platforms.
///
/// ## Why Use ARCColorHelper?
///
/// When building SwiftUI views that target multiple platforms, directly using
/// `UIColor` or `NSColor` can cause compilation issues. This helper abstracts
/// those differences and provides safe, adaptive colors that work everywhere.
///
/// ## Available Colors
///
/// ### Text Colors
/// - ``textPrimary``: Primary text color
/// - ``textSecondary``: Secondary/caption text color
///
/// ### Background Colors
/// - ``backgroundPrimary``: Main screen background
/// - ``backgroundSecondary``: Cards and elevated surfaces
/// - ``backgroundTertiary``: Subtle separation backgrounds
///
/// ### Brand Colors
/// - ``highlight``: Accent/emphasis color
///
/// ### Shadow Colors
/// - ``shadowMedium``: Standard elevation shadow
///
/// ## Example Usage
///
/// ```swift
/// // Safe to use on any platform
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
    /// Returns the appropriate primary text color for the platform:
    /// - iOS/tvOS/watchOS: ``Color/arcTextPrimary``
    /// - macOS: `Color.primary`
    /// - Fallback: `Color.white`
    ///
    /// Use this for all primary content, headings, and labels to ensure
    /// maximum contrast and readability.
    ///
    /// ## Example
    ///
    /// ```swift
    /// Text("Welcome")
    ///     .font(.arcFontTitleLarge)
    ///     .foregroundStyle(ARCColorHelper.textPrimary)
    /// ```
    ///
    /// - Returns: A platform-appropriate primary text color.
    public static var textPrimary: Color {
        #if canImport(UIKit)
        return .arcTextPrimary
        #elseif canImport(AppKit)
        return Color.primary
        #else
        return Color.white
        #endif
    }

    /// Secondary text color for captions, hints, and supporting content.
    ///
    /// Returns the appropriate secondary text color for the platform:
    /// - iOS/tvOS/watchOS: ``Color/arcTextSecondary``
    /// - macOS: `Color.secondary`
    /// - Fallback: `Color.gray`
    ///
    /// This color has reduced contrast compared to ``textPrimary`` and should
    /// be used for supporting text, placeholders, and metadata.
    ///
    /// ## Example
    ///
    /// ```swift
    /// Text("Last updated: 2 hours ago")
    ///     .font(.arcFontBodySmall)
    ///     .foregroundStyle(ARCColorHelper.textSecondary)
    /// ```
    ///
    /// - Returns: A platform-appropriate secondary text color.
    public static var textSecondary: Color {
        #if canImport(UIKit)
        return .arcTextSecondary
        #elseif canImport(AppKit)
        return Color.secondary
        #else
        return Color.gray
        #endif
    }

    // MARK: - Background Colors

    /// Primary background color for screens and main content areas.
    ///
    /// Returns the appropriate primary background color for the platform:
    /// - iOS/tvOS/watchOS: ``Color/arcBackgroundPrimary`` (maps to `UIColor.systemBackground`)
    /// - macOS: `NSColor.windowBackgroundColor`
    /// - Fallback: `Color.white`
    ///
    /// This is the base layer for your application's views. It automatically
    /// adapts between light and dark mode.
    ///
    /// ## Example
    ///
    /// ```swift
    /// VStack {
    ///     // Your content
    /// }
    /// .background(ARCColorHelper.backgroundPrimary)
    /// ```
    ///
    /// - Returns: A platform-appropriate primary background color.
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
    /// - iOS/tvOS/watchOS: ``Color/arcBackgroundSecondary`` (maps to `UIColor.secondarySystemBackground`)
    /// - macOS: `NSColor.controlBackgroundColor`
    /// - Fallback: `Color.gray` with 15% opacity
    ///
    /// Use this color for cards, containers, and any UI elements that should
    /// appear elevated above the primary background.
    ///
    /// ## Example
    ///
    /// ```swift
    /// VStack {
    ///     Text("Card Content")
    /// }
    /// .padding(.arcPaddingCard)
    /// .background(ARCColorHelper.backgroundSecondary)
    /// .clipShape(RoundedRectangle(cornerRadius: .arcCornerRadiusMedium))
    /// ```
    ///
    /// - Returns: A platform-appropriate secondary background color.
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
    /// - iOS/tvOS/watchOS: ``Color/arcBackgroundTertiary`` (maps to `UIColor.tertiarySystemBackground`)
    /// - macOS: `NSColor.underPageBackgroundColor`
    /// - Fallback: `Color.gray` with 10% opacity
    ///
    /// This color provides the most subtle background variation, ideal for
    /// grouped content, sidebars, or sections requiring minimal visual weight.
    ///
    /// ## Example
    ///
    /// ```swift
    /// List {
    ///     Section {
    ///         // List items
    ///     }
    ///     .listRowBackground(ARCColorHelper.backgroundTertiary)
    /// }
    /// ```
    ///
    /// - Returns: A platform-appropriate tertiary background color.
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

    /// Accent or highlight color for emphasis and branding.
    ///
    /// Returns the appropriate highlight color for the platform:
    /// - iOS/tvOS/watchOS: ``Color/arcHighlight`` (currently yellow)
    /// - macOS: `Color.accentColor`
    /// - Fallback: `Color.yellow`
    ///
    /// Use this color sparingly for important UI elements, call-to-action
    /// buttons, or to draw attention to key content.
    ///
    /// ## Example
    ///
    /// ```swift
    /// Button("Get Started") {
    ///     // Action
    /// }
    /// .foregroundStyle(.white)
    /// .padding(.arcPaddingCompact)
    /// .background(ARCColorHelper.highlight)
    /// .clipShape(RoundedRectangle(cornerRadius: .arcCornerRadiusSmall))
    /// ```
    ///
    /// - Note: Consider customizing ``Color/arcHighlight`` to match your brand colors.
    ///
    /// - Returns: A platform-appropriate highlight color.
    public static var highlight: Color {
        #if canImport(UIKit)
        return .arcHighlight
        #elseif canImport(AppKit)
        return Color.accentColor
        #else
        return Color.yellow
        #endif
    }

    // MARK: - Shadows

    /// Medium-level shadow color for creating elevation and depth.
    ///
    /// Returns a consistent shadow color across all platforms:
    /// - iOS/tvOS/watchOS: ``Color/arcShadowMedium`` (black with 15% opacity)
    /// - macOS: `Color.black` with 15% opacity
    /// - Fallback: `Color.black` with 15% opacity
    ///
    /// Use this color with SwiftUI's `.shadow()` modifier to add depth
    /// to cards, buttons, and floating UI elements.
    ///
    /// ## Example
    ///
    /// ```swift
    /// RoundedRectangle(cornerRadius: .arcCornerRadiusMedium)
    ///     .fill(ARCColorHelper.backgroundSecondary)
    ///     .shadow(
    ///         color: ARCColorHelper.shadowMedium,
    ///         radius: 8,
    ///         x: 0,
    ///         y: 4
    ///     )
    /// ```
    ///
    /// - Returns: Black with 15% opacity for standard elevation shadows.
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
