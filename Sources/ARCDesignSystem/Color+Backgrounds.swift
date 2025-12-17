//
//  Color+Backgrounds.swift
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

/// Semantic color tokens for the ARC Design System.
///
/// These colors automatically adapt to the user's light/dark mode preference
/// and leverage system-provided colors on each platform (UIKit, AppKit) for
/// maximum consistency with native applications.
///
/// ## Color Categories
///
/// ### Backgrounds
/// - ``arcBackgroundPrimary``: Main background color
/// - ``arcBackgroundSecondary``: Elevated surfaces (cards, containers)
/// - ``arcBackgroundTertiary``: Subtle backgrounds for grouped content
///
/// ### Text
/// - ``arcTextPrimary``: Primary text and titles
/// - ``arcTextSecondary``: Secondary text, captions, hints
///
/// ### Brand
/// - ``arcHighlight``: Accent color for highlighting and emphasis
///
/// ## Example Usage
///
/// ```swift
/// VStack {
///     Text("Title")
///         .foregroundStyle(.arcTextPrimary)
///     Text("Subtitle")
///         .foregroundStyle(.arcTextSecondary)
/// }
/// .padding()
/// .background(.arcBackgroundSecondary)
/// ```
///
/// - Note: All colors automatically respect the system's light/dark mode setting.
extension Color {
    /// Primary background color.
    ///
    /// The main background color for screens and views. Automatically adapts
    /// to the system appearance (light/dark mode).
    ///
    /// - Maps to `UIColor.systemBackground` on iOS/tvOS/watchOS
    /// - Maps to `NSColor.windowBackgroundColor` on macOS
    ///
    /// - Returns: A platform-appropriate adaptive background color.
    public static var arcBackgroundPrimary: Color {
        #if canImport(UIKit)
        return Color(UIColor.systemBackground)
        #elseif canImport(AppKit)
        return Color(NSColor.windowBackgroundColor)
        #else
        return Color.white
        #endif
    }

    /// Secondary background color.
    ///
    /// Use for elevated surfaces like cards, containers, and grouped table views.
    /// Provides visual hierarchy above the primary background.
    ///
    /// - Maps to `UIColor.secondarySystemBackground` on iOS/tvOS/watchOS
    /// - Maps to `NSColor.controlBackgroundColor` on macOS
    ///
    /// - Returns: A platform-appropriate elevated background color.
    public static var arcBackgroundSecondary: Color {
        #if canImport(UIKit)
        return Color(UIColor.secondarySystemBackground)
        #elseif canImport(AppKit)
        return Color(NSColor.controlBackgroundColor)
        #else
        return Color.gray.opacity(0.2)
        #endif
    }

    /// Tertiary background color.
    ///
    /// Subtle background for grouped content, sidebars, or areas requiring
    /// minimal visual separation.
    ///
    /// - Maps to `UIColor.tertiarySystemBackground` on iOS/tvOS/watchOS
    /// - Maps to `NSColor.underPageBackgroundColor` on macOS
    ///
    /// - Returns: A platform-appropriate subtle background color.
    public static var arcBackgroundTertiary: Color {
        #if canImport(UIKit)
        return Color(UIColor.tertiarySystemBackground)
        #elseif canImport(AppKit)
        return Color(NSColor.underPageBackgroundColor)
        #else
        return Color.gray.opacity(0.1)
        #endif
    }

    /// Primary text color.
    ///
    /// The default color for all text content, headings, and labels.
    /// Automatically inverts between light and dark mode.
    ///
    /// - Returns: SwiftUI's semantic `.primary` color.
    public static let arcTextPrimary = Color.primary

    /// Secondary text color.
    ///
    /// Use for supporting text, captions, placeholders, and less prominent content.
    /// Provides reduced contrast compared to primary text.
    ///
    /// - Returns: SwiftUI's semantic `.secondary` color.
    public static let arcTextSecondary = Color.secondary

    /// Highlight/accent color.
    ///
    /// Brand color used for emphasis, important actions, and visual accents.
    /// Currently set to yellow; customize this for your brand identity.
    ///
    /// - Returns: Yellow color (customize to match your brand).
    public static let arcHighlight = Color.yellow
}
