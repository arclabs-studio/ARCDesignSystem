//
//  ARCAccessibility.swift
//  ARCDesignSystem
//
//  Created by ARC Labs on 12/18/25.
//

import SwiftUI
#if canImport(UIKit)
import UIKit
#endif

/// Accessibility utilities for the ARC Design System.
///
/// Provides helpers to detect and respond to system accessibility settings,
/// following Apple Human Interface Guidelines for inclusive design.
///
/// ## Key Features
///
/// - Detect "Increase Contrast" accessibility setting
/// - Detect "Reduce Motion" accessibility setting
/// - Detect "Bold Text" accessibility setting
///
/// ## Example Usage
///
/// ```swift
/// struct AdaptiveCard: View {
///     var body: some View {
///         RoundedRectangle(cornerRadius: .arcCornerRadiusMedium)
///             .stroke(
///                 ARCAccessibility.prefersHighContrast
///                     ? Color.arcTextPrimary
///                     : Color.arcSeparator,
///                 lineWidth: ARCAccessibility.prefersHighContrast ? 2 : 1
///             )
///     }
/// }
/// ```
///
/// - Note: These helpers query system settings at call time. For reactive
///   UI updates, use SwiftUI's `@Environment(\.accessibilityDifferentiateWithoutColor)` etc.
public enum ARCAccessibility {
    // MARK: - Contrast

    /// Returns `true` if the user has enabled "Increase Contrast" in Accessibility settings.
    ///
    /// When enabled, apps should:
    /// - Use stronger contrast between foreground and background
    /// - Increase border widths
    /// - Avoid relying on subtle color differences
    ///
    /// - Returns: `true` if high contrast mode is enabled, `false` otherwise.
    public static var prefersHighContrast: Bool {
        #if canImport(UIKit) && !os(watchOS)
        return UIAccessibility.isDarkerSystemColorsEnabled
        #else
        return false
        #endif
    }

    // MARK: - Motion

    /// Returns `true` if the user has enabled "Reduce Motion" in Accessibility settings.
    ///
    /// When enabled, apps should:
    /// - Minimize or eliminate parallax effects
    /// - Use simple fade transitions instead of zoom/slide
    /// - Avoid auto-playing animations
    ///
    /// - Returns: `true` if reduced motion is preferred, `false` otherwise.
    public static var prefersReducedMotion: Bool {
        #if canImport(UIKit)
        return UIAccessibility.isReduceMotionEnabled
        #else
        return false
        #endif
    }

    // MARK: - Typography

    /// Returns `true` if the user has enabled "Bold Text" in Accessibility settings.
    ///
    /// When enabled, the system automatically applies bolder weights to text.
    /// Custom drawing code should also increase stroke widths.
    ///
    /// - Returns: `true` if bold text is enabled, `false` otherwise.
    public static var prefersBoldText: Bool {
        #if canImport(UIKit)
        return UIAccessibility.isBoldTextEnabled
        #else
        return false
        #endif
    }

    /// Returns `true` if the current Dynamic Type size is an accessibility size.
    ///
    /// Accessibility sizes (AX1-AX5) are larger than standard sizes and indicate
    /// the user needs significantly larger text. Consider adjusting layouts
    /// to accommodate larger text at these sizes.
    ///
    /// - Returns: `true` if using accessibility text size, `false` otherwise.
    public static var isAccessibilityTextSize: Bool {
        #if canImport(UIKit)
        return UITraitCollection.current.preferredContentSizeCategory.isAccessibilityCategory
        #else
        return false
        #endif
    }

    // MARK: - Visual

    /// Returns `true` if the user prefers not to rely solely on color to convey information.
    ///
    /// When enabled, apps should use additional visual cues (shapes, patterns, text)
    /// alongside color to communicate meaning.
    ///
    /// - Returns: `true` if the user needs differentiation without color.
    public static var differentiateWithoutColor: Bool {
        #if canImport(UIKit) && !os(watchOS)
        return UIAccessibility.shouldDifferentiateWithoutColor
        #else
        return false
        #endif
    }

    /// Returns `true` if the user has enabled "Reduce Transparency" in Accessibility settings.
    ///
    /// When enabled, apps should:
    /// - Use solid backgrounds instead of translucent materials
    /// - Increase contrast between layers
    ///
    /// - Returns: `true` if reduced transparency is preferred, `false` otherwise.
    public static var prefersReducedTransparency: Bool {
        #if canImport(UIKit)
        return UIAccessibility.isReduceTransparencyEnabled
        #else
        return false
        #endif
    }
}

// MARK: - SwiftUI Environment Integration

/// A view modifier that provides accessibility-aware styling.
///
/// Automatically adjusts appearance based on system accessibility settings.
public struct ARCAccessibilityModifier: ViewModifier {
    @Environment(\.accessibilityDifferentiateWithoutColor)
    private var differentiateWithoutColor

    @Environment(\.colorSchemeContrast)
    private var contrast

    public func body(content: Content) -> some View {
        content
            .environment(\.arcHighContrastEnabled, contrast == .increased)
    }
}

// MARK: - Environment Keys

private struct ARCHighContrastKey: EnvironmentKey {
    static let defaultValue: Bool = false
}

extension EnvironmentValues {
    /// Indicates whether high contrast mode is enabled.
    ///
    /// Use this in views to adapt styling for increased contrast accessibility setting.
    ///
    /// ```swift
    /// @Environment(\.arcHighContrastEnabled) var highContrast
    ///
    /// var borderColor: Color {
    ///     highContrast ? .arcTextPrimary : .arcSeparator
    /// }
    /// ```
    public var arcHighContrastEnabled: Bool {
        get { self[ARCHighContrastKey.self] }
        set { self[ARCHighContrastKey.self] = newValue }
    }
}

extension View {
    /// Applies ARC accessibility environment values to the view hierarchy.
    ///
    /// Call this modifier near the root of your view hierarchy to enable
    /// accessibility-aware styling throughout.
    ///
    /// ```swift
    /// WindowGroup {
    ///     ContentView()
    ///         .arcAccessibility()
    /// }
    /// ```
    public func arcAccessibility() -> some View {
        modifier(ARCAccessibilityModifier())
    }
}
