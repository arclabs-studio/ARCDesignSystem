//
//  ARCAccessibility.swift
//  ARCDesignSystem
//
//  Created by ARC Labs on 1/24/26.
//

import SwiftUI
#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

/// Accessibility utilities for the ARC Design System.
///
/// This struct provides cross-platform helpers for checking and responding
/// to accessibility settings like Reduce Motion and Increase Contrast.
///
/// ## Checking Accessibility Settings
///
/// ```swift
/// if ARCAccessibility.isReduceMotionEnabled {
///     // Use simpler animations
/// }
///
/// if ARCAccessibility.isIncreaseContrastEnabled {
///     // Use higher contrast colors
/// }
/// ```
///
/// ## Using Environment Values
///
/// For SwiftUI views, prefer using environment values:
///
/// ```swift
/// struct MyView: View {
///     @Environment(\.accessibilityReduceMotion) var reduceMotion
///
///     var body: some View {
///         // Use reduceMotion
///     }
/// }
/// ```
///
/// - Note: This struct centralizes accessibility checks for use in non-View
///   contexts like view models or utility functions.
@MainActor
public struct ARCAccessibility: Sendable {
    // MARK: - Motion

    /// Whether the user has enabled Reduce Motion in accessibility settings.
    ///
    /// When `true`, you should:
    /// - Avoid complex animations or parallax effects
    /// - Use simple fades or instant transitions
    /// - Disable auto-playing animations
    ///
    /// - Note: For SwiftUI views, prefer `@Environment(\.accessibilityReduceMotion)`.
    public static var isReduceMotionEnabled: Bool {
        #if os(iOS) || os(tvOS)
        return UIAccessibility.isReduceMotionEnabled
        #elseif os(watchOS)
        return WKAccessibilityIsReduceMotionEnabled()
        #elseif os(macOS)
        return NSWorkspace.shared.accessibilityDisplayShouldReduceMotion
        #else
        return false
        #endif
    }

    // MARK: - Contrast

    /// Whether the user has enabled Increase Contrast in accessibility settings.
    ///
    /// When `true`, you should:
    /// - Use colors with higher contrast ratios
    /// - Avoid subtle color differences
    /// - Consider using the High Contrast color variants
    ///
    /// - Note: Colors in the asset catalog with High Contrast variants will
    ///   automatically use those variants when this is enabled.
    public static var isIncreaseContrastEnabled: Bool {
        #if os(iOS) || os(tvOS)
        return UIAccessibility.isDarkerSystemColorsEnabled
        #elseif os(macOS)
        return NSWorkspace.shared.accessibilityDisplayShouldIncreaseContrast
        #else
        return false
        #endif
    }

    // MARK: - Transparency

    /// Whether the user has enabled Reduce Transparency in accessibility settings.
    ///
    /// When `true`, you should:
    /// - Avoid blur effects and translucent materials
    /// - Use solid backgrounds instead of semi-transparent ones
    public static var isReduceTransparencyEnabled: Bool {
        #if os(iOS) || os(tvOS)
        return UIAccessibility.isReduceTransparencyEnabled
        #elseif os(macOS)
        return NSWorkspace.shared.accessibilityDisplayShouldReduceTransparency
        #else
        return false
        #endif
    }

    // MARK: - Bold Text

    /// Whether the user has enabled Bold Text in accessibility settings.
    ///
    /// When `true`, system fonts are displayed with increased weight.
    /// SwiftUI handles this automatically for system fonts.
    public static var isBoldTextEnabled: Bool {
        #if os(iOS) || os(tvOS)
        return UIAccessibility.isBoldTextEnabled
        #else
        return false
        #endif
    }

    // MARK: - VoiceOver

    /// Whether VoiceOver is currently running.
    ///
    /// Use this to adapt UI for screen reader users, such as:
    /// - Providing additional context in accessibility labels
    /// - Grouping related elements
    /// - Hiding decorative content
    public static var isVoiceOverRunning: Bool {
        #if os(iOS) || os(tvOS) || os(watchOS)
        return UIAccessibility.isVoiceOverRunning
        #elseif os(macOS)
        return NSWorkspace.shared.isVoiceOverEnabled
        #else
        return false
        #endif
    }

    // MARK: - Dynamic Type

    /// The user's preferred content size category.
    ///
    /// This reflects the Dynamic Type setting. Use `@ScaledMetric` or
    /// `@Environment(\.dynamicTypeSize)` in SwiftUI for automatic scaling.
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
    public static var preferredContentSizeCategory: ContentSizeCategory {
        #if os(iOS) || os(tvOS)
        return ContentSizeCategory(UIApplication.shared.preferredContentSizeCategory)
        #elseif os(watchOS)
        return ContentSizeCategory(WKInterfaceDevice.current().preferredContentSizeCategory)
        #else
        return .medium
        #endif
    }

    /// Whether the user has selected an accessibility content size.
    ///
    /// Accessibility sizes are the five largest Dynamic Type sizes,
    /// which require additional layout considerations.
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
    public static var isUsingAccessibilityContentSize: Bool {
        let category = preferredContentSizeCategory
        return category >= .accessibilityMedium
    }

    // MARK: - Convenience Methods

    /// Returns the appropriate animation based on Reduce Motion settings.
    ///
    /// - Parameters:
    ///   - animation: The animation to use when motion is allowed.
    ///   - reduced: The fallback animation when motion is reduced. Defaults to `.linear(duration: 0.1)`.
    /// - Returns: The appropriate animation for current accessibility settings.
    public static func animation(
        _ animation: Animation,
        reducedMotion reduced: Animation = .linear(duration: 0.1)
    ) -> Animation {
        isReduceMotionEnabled ? reduced : animation
    }

    /// Returns the appropriate duration based on Reduce Motion settings.
    ///
    /// - Parameters:
    ///   - duration: The duration to use when motion is allowed.
    ///   - reduced: The fallback duration when motion is reduced. Defaults to `0.1`.
    /// - Returns: The appropriate duration for current accessibility settings.
    public static func duration(
        _ duration: Double,
        reducedMotion reduced: Double = 0.1
    ) -> Double {
        isReduceMotionEnabled ? reduced : duration
    }
}

// MARK: - ContentSizeCategory Extension

#if os(iOS) || os(tvOS)
@available(iOS 15.0, tvOS 15.0, *)
extension ContentSizeCategory {
    // swiftlint:disable:next cyclomatic_complexity
    init(_ category: UIContentSizeCategory) {
        switch category {
        case .extraSmall: self = .extraSmall
        case .small: self = .small
        case .medium: self = .medium
        case .large: self = .large
        case .extraLarge: self = .extraLarge
        case .extraExtraLarge: self = .extraExtraLarge
        case .extraExtraExtraLarge: self = .extraExtraExtraLarge
        case .accessibilityMedium: self = .accessibilityMedium
        case .accessibilityLarge: self = .accessibilityLarge
        case .accessibilityExtraLarge: self = .accessibilityExtraLarge
        case .accessibilityExtraExtraLarge: self = .accessibilityExtraExtraLarge
        case .accessibilityExtraExtraExtraLarge: self = .accessibilityExtraExtraExtraLarge
        default: self = .medium
        }
    }
}
#endif

#if os(watchOS)
@available(watchOS 8.0, *)
extension ContentSizeCategory {
    // swiftlint:disable:next cyclomatic_complexity
    init(_ category: String) {
        switch category {
        case "UICTContentSizeCategoryXS": self = .extraSmall
        case "UICTContentSizeCategoryS": self = .small
        case "UICTContentSizeCategoryM": self = .medium
        case "UICTContentSizeCategoryL": self = .large
        case "UICTContentSizeCategoryXL": self = .extraLarge
        case "UICTContentSizeCategoryXXL": self = .extraExtraLarge
        case "UICTContentSizeCategoryXXXL": self = .extraExtraExtraLarge
        case "UICTContentSizeCategoryAccessibilityM": self = .accessibilityMedium
        case "UICTContentSizeCategoryAccessibilityL": self = .accessibilityLarge
        case "UICTContentSizeCategoryAccessibilityXL": self = .accessibilityExtraLarge
        case "UICTContentSizeCategoryAccessibilityXXL": self = .accessibilityExtraExtraLarge
        case "UICTContentSizeCategoryAccessibilityXXXL": self = .accessibilityExtraExtraExtraLarge
        default: self = .medium
        }
    }
}
#endif
