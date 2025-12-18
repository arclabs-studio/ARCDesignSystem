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
/// maximum consistency with native applications and Apple Human Interface Guidelines.
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
/// - ``arcTextTertiary``: Tertiary text, less prominent content
/// - ``arcTextQuaternary``: Quaternary text, watermarks
/// - ``arcTextDisabled``: Disabled or unavailable text
///
/// ### Interactive
/// - ``arcAccent``: System accent color for interactive elements
/// - ``arcLink``: Link text color
/// - ``arcPlaceholder``: Placeholder text in inputs
///
/// ### Separators
/// - ``arcSeparator``: Standard separator (allows content to show through)
/// - ``arcSeparatorOpaque``: Opaque separator (fully covers background)
///
/// ## Example Usage
///
/// ```swift
/// VStack {
///     Text("Title")
///         .foregroundStyle(.arcTextPrimary)
///     Text("Subtitle")
///         .foregroundStyle(.arcTextSecondary)
///     Link("Learn more", destination: url)
///         .foregroundStyle(.arcLink)
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
    /// Use for supporting text, captions, and less prominent content.
    /// Provides reduced contrast compared to primary text.
    ///
    /// - Returns: SwiftUI's semantic `.secondary` color.
    public static let arcTextSecondary = Color.secondary

    /// Tertiary text color.
    ///
    /// Use for tertiary labels and less important content than secondary.
    ///
    /// - Maps to `UIColor.tertiaryLabel` on iOS/tvOS/watchOS
    /// - Maps to `NSColor.tertiaryLabelColor` on macOS
    ///
    /// - Returns: A platform-appropriate tertiary label color.
    public static var arcTextTertiary: Color {
        #if canImport(UIKit)
        return Color(UIColor.tertiaryLabel)
        #elseif canImport(AppKit)
        return Color(NSColor.tertiaryLabelColor)
        #else
        return Color.secondary.opacity(0.6)
        #endif
    }

    /// Quaternary text color.
    ///
    /// Use for quaternary labels, watermarks, or the least prominent text.
    ///
    /// - Maps to `UIColor.quaternaryLabel` on iOS/tvOS/watchOS
    /// - Maps to `NSColor.quaternaryLabelColor` on macOS
    ///
    /// - Returns: A platform-appropriate quaternary label color.
    public static var arcTextQuaternary: Color {
        #if canImport(UIKit)
        return Color(UIColor.quaternaryLabel)
        #elseif canImport(AppKit)
        return Color(NSColor.quaternaryLabelColor)
        #else
        return Color.secondary.opacity(0.3)
        #endif
    }

    /// Disabled text color.
    ///
    /// Use for text in disabled controls or unavailable content.
    ///
    /// - Maps to `UIColor.tertiaryLabel` on iOS (matches system disabled style)
    /// - Maps to `NSColor.disabledControlTextColor` on macOS
    ///
    /// - Returns: A platform-appropriate disabled text color.
    public static var arcTextDisabled: Color {
        #if canImport(UIKit)
        return Color(UIColor.tertiaryLabel)
        #elseif canImport(AppKit)
        return Color(NSColor.disabledControlTextColor)
        #else
        return Color.secondary.opacity(0.5)
        #endif
    }

    // MARK: - Interactive Colors

    /// System accent color.
    ///
    /// The system-defined accent color for interactive elements like buttons,
    /// links, and selection highlights. Respects the user's accent color preference.
    ///
    /// - Returns: SwiftUI's `.accentColor` which adapts to system settings.
    public static let arcAccent = Color.accentColor

    /// Link text color.
    ///
    /// Use for text that functions as a link to other content.
    ///
    /// - Maps to `UIColor.link` on iOS/tvOS/watchOS
    /// - Maps to `NSColor.linkColor` on macOS
    ///
    /// - Returns: A platform-appropriate link color.
    public static var arcLink: Color {
        #if canImport(UIKit)
        return Color(UIColor.link)
        #elseif canImport(AppKit)
        return Color(NSColor.linkColor)
        #else
        return Color.blue
        #endif
    }

    /// Placeholder text color.
    ///
    /// Use for placeholder text in text fields and search fields.
    ///
    /// - Maps to `UIColor.placeholderText` on iOS/tvOS/watchOS
    /// - Maps to `NSColor.placeholderTextColor` on macOS
    ///
    /// - Returns: A platform-appropriate placeholder text color.
    public static var arcPlaceholder: Color {
        #if canImport(UIKit)
        return Color(UIColor.placeholderText)
        #elseif canImport(AppKit)
        return Color(NSColor.placeholderTextColor)
        #else
        return Color.secondary.opacity(0.5)
        #endif
    }

    // MARK: - Separators

    /// Separator color.
    ///
    /// Use for thin borders or divider lines that allow some underlying
    /// content to be visible.
    ///
    /// - Maps to `UIColor.separator` on iOS/tvOS/watchOS
    /// - Maps to `NSColor.separatorColor` on macOS
    ///
    /// - Returns: A platform-appropriate separator color.
    public static var arcSeparator: Color {
        #if canImport(UIKit)
        return Color(UIColor.separator)
        #elseif canImport(AppKit)
        return Color(NSColor.separatorColor)
        #else
        return Color.gray.opacity(0.3)
        #endif
    }

    /// Opaque separator color.
    ///
    /// Use for borders or divider lines that should not allow any
    /// underlying content to be visible.
    ///
    /// - Maps to `UIColor.opaqueSeparator` on iOS/tvOS/watchOS
    /// - Maps to `NSColor.separatorColor` on macOS
    ///
    /// - Returns: A platform-appropriate opaque separator color.
    public static var arcSeparatorOpaque: Color {
        #if canImport(UIKit)
        return Color(UIColor.opaqueSeparator)
        #elseif canImport(AppKit)
        return Color(NSColor.separatorColor)
        #else
        return Color.gray.opacity(0.5)
        #endif
    }

    // MARK: - Legacy Aliases (Deprecated)

    /// Highlight color - Use ``arcAccent`` instead.
    @available(*, deprecated, renamed: "arcAccent")
    public static let arcHighlight = Color.accentColor
}
