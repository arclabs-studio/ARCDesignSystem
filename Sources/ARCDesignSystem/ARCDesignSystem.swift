//
//  ARCDesignSystem.swift
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
// MARK: - ARC Layout Scale (Dynamic Type Aware)
// =====================================================

/// Controls the global visual scale for the ARC Design System.
///
/// `ARCLayoutScale` provides an adaptive scaling mechanism that responds to the user's
/// preferred text size setting (Dynamic Type on iOS). All spacing, padding, and corner
/// radius values are multiplied by this scale factor to ensure the UI remains proportional
/// and accessible across different text size preferences.
///
/// ## Overview
///
/// On platforms that support Dynamic Type (iOS, iPadOS, tvOS, watchOS), the scale factor
/// ranges from 0.9 (extra small text) to 1.7 (accessibility extra extra extra large).
/// On macOS, which doesn't support Dynamic Type, a neutral scale of 1.0 is always used.
///
/// ## Scale Factor Mapping
///
/// | Content Size Category | Scale Factor |
/// |-----------------------|--------------|
/// | Extra Small           | 0.9          |
/// | Small                 | 0.95         |
/// | Medium                | 1.0          |
/// | Large                 | 1.05         |
/// | Extra Large           | 1.1          |
/// | Extra Extra Large     | 1.15         |
/// | Extra Extra Extra Large | 1.2        |
/// | Accessibility Medium  | 1.3          |
/// | Accessibility Large   | 1.4          |
/// | Accessibility Extra Large | 1.5      |
/// | Accessibility Extra Extra Large | 1.6 |
/// | Accessibility Extra Extra Extra Large | 1.7 |
///
/// - Note: This enum is internal and not meant to be instantiated directly.
///   Use the static property ``arcScaleFactor`` to retrieve the current scale.
enum ARCLayoutScale {
    /// Returns the adaptive scale factor for the current content size category.
    ///
    /// This property calculates the appropriate scale factor based on the user's
    /// Dynamic Type settings. It queries the current `UITraitCollection` on UIKit
    /// platforms or returns a neutral value of 1.0 on macOS.
    ///
    /// ## Example
    ///
    /// ```swift
    /// let baseSpacing: CGFloat = 16
    /// let adaptiveSpacing = baseSpacing * ARCLayoutScale.arcScaleFactor
    /// // On iPhone with Large text size: 16 * 1.05 = 16.8
    /// ```
    ///
    /// - Returns: A CGFloat value between 0.9 and 1.7 on UIKit platforms,
    ///   or 1.0 on macOS.
    static var arcScaleFactor: CGFloat {
        #if canImport(UIKit)
        let category = UITraitCollection.current.preferredContentSizeCategory
        #else
        // macOS does not support Dynamic Type, use neutral scaling
        return 1.0
        #endif
        
        #if canImport(UIKit)
        switch category {
        case .extraSmall: return 0.9
        case .small: return 0.95
        case .medium: return 1.0
        case .large: return 1.05
        case .extraLarge: return 1.1
        case .extraExtraLarge: return 1.15
        case .extraExtraExtraLarge: return 1.2
        case .accessibilityMedium: return 1.3
        case .accessibilityLarge: return 1.4
        case .accessibilityExtraLarge: return 1.5
        case .accessibilityExtraExtraLarge: return 1.6
        case .accessibilityExtraExtraExtraLarge: return 1.7
        default: return 1.0
        }
        #endif
    }
}

// =====================================================
// MARK: - ARC Spacing (Adaptive)
// =====================================================

/// Adaptive spacing tokens for the ARC Design System.
///
/// These spacing values provide a consistent vertical and horizontal rhythm throughout
/// your application. All values automatically scale based on the user's Dynamic Type
/// settings via ``ARCLayoutScale/arcScaleFactor``.
///
/// ## Available Spacing Tokens
///
/// | Token | Base Value | Use Case |
/// |-------|------------|----------|
/// | ``arcSpacingXSmall`` | 4pt | Minimal gaps, tight layouts |
/// | ``arcSpacingSmall`` | 8pt | Compact spacing, list items |
/// | ``arcSpacingMedium`` | 12pt | Standard element spacing |
/// | ``arcSpacingLarge`` | 16pt | Section spacing, card padding |
/// | ``arcSpacingXLarge`` | 24pt | Large gaps between sections |
/// | ``arcSpacingXXLarge`` | 32pt | Maximum spacing, major separators |
///
/// ## Example Usage
///
/// ```swift
/// VStack(spacing: .arcSpacingMedium) {
///     Text("Title")
///     Text("Subtitle")
/// }
/// .padding(.arcSpacingLarge)
/// ```
///
/// - Note: All spacing values scale proportionally with Dynamic Type to maintain
///   consistent visual hierarchy across accessibility settings.
public extension CGFloat {
    /// Extra small spacing token (4pt base).
    ///
    /// Use for minimal gaps between tightly related elements or when space is limited.
    ///
    /// - Returns: 4pt multiplied by the current Dynamic Type scale factor.
    static var arcSpacingXSmall: CGFloat { 4 * ARCLayoutScale.arcScaleFactor }

    /// Small spacing token (8pt base).
    ///
    /// Ideal for compact layouts, list item spacing, or spacing between related elements.
    ///
    /// - Returns: 8pt multiplied by the current Dynamic Type scale factor.
    static var arcSpacingSmall: CGFloat { 8 * ARCLayoutScale.arcScaleFactor }

    /// Medium spacing token (12pt base).
    ///
    /// Standard spacing for most UI elements. Use as the default gap between components.
    ///
    /// - Returns: 12pt multiplied by the current Dynamic Type scale factor.
    static var arcSpacingMedium: CGFloat { 12 * ARCLayoutScale.arcScaleFactor }

    /// Large spacing token (16pt base).
    ///
    /// Use for section spacing, card padding, or creating clear visual separation.
    ///
    /// - Returns: 16pt multiplied by the current Dynamic Type scale factor.
    static var arcSpacingLarge: CGFloat { 16 * ARCLayoutScale.arcScaleFactor }

    /// Extra large spacing token (24pt base).
    ///
    /// Creates significant visual separation between major sections or content blocks.
    ///
    /// - Returns: 24pt multiplied by the current Dynamic Type scale factor.
    static var arcSpacingXLarge: CGFloat { 24 * ARCLayoutScale.arcScaleFactor }

    /// Extra extra large spacing token (32pt base).
    ///
    /// Maximum spacing for major visual separators or hero sections.
    ///
    /// - Returns: 32pt multiplied by the current Dynamic Type scale factor.
    static var arcSpacingXXLarge: CGFloat { 32 * ARCLayoutScale.arcScaleFactor }
}

// =====================================================
// MARK: - ARC Corner Radius (Adaptive)
// =====================================================

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
public extension CGFloat {
    /// Small corner radius token (6.4pt base).
    ///
    /// Suitable for small elements like buttons, tags, badges, or compact cards.
    ///
    /// - Returns: 8pt × scale factor × 0.8.
    static var arcCornerRadiusSmall: CGFloat { 8 * ARCLayoutScale.arcScaleFactor * 0.8 }

    /// Medium corner radius token (12.8pt base).
    ///
    /// Standard corner radius for cards, containers, input fields, and modals.
    ///
    /// - Returns: 16pt × scale factor × 0.8.
    static var arcCornerRadiusMedium: CGFloat { 16 * ARCLayoutScale.arcScaleFactor * 0.8 }

    /// Large corner radius token (19.2pt base).
    ///
    /// Creates prominent rounded corners for large cards, hero sections, or featured content.
    ///
    /// - Returns: 24pt × scale factor × 0.8.
    static var arcCornerRadiusLarge: CGFloat { 24 * ARCLayoutScale.arcScaleFactor * 0.8 }

    /// Extra large corner radius token (25.6pt base).
    ///
    /// Maximum roundness for full-screen cards, bottom sheets, or immersive UI elements.
    ///
    /// - Returns: 32pt × scale factor × 0.8.
    static var arcCornerRadiusXLarge: CGFloat { 32 * ARCLayoutScale.arcScaleFactor * 0.8 }
}

// =====================================================
// MARK: - ARC Padding (Adaptive EdgeInsets)
// =====================================================

/// Adaptive padding presets for the ARC Design System.
///
/// These `EdgeInsets` values provide consistent internal spacing for common layout
/// patterns. All padding values scale proportionally with Dynamic Type to ensure
/// accessibility and visual consistency.
///
/// ## Available Padding Tokens
///
/// | Token | Values (T/L/B/R) | Use Case |
/// |-------|------------------|----------|
/// | ``arcPaddingCard`` | 16/16/16/16pt | Cards, containers |
/// | ``arcPaddingHorizontal`` | 0/16/0/16pt | Horizontal-only padding |
/// | ``arcPaddingSection`` | 24/16/24/16pt | Major sections, screens |
/// | ``arcPaddingCompact`` | 8/12/8/12pt | Buttons, small elements |
///
/// ## Example Usage
///
/// ```swift
/// VStack {
///     Text("Card Content")
/// }
/// .padding(.arcPaddingCard)
/// .background(.arcBackgroundSecondary)
/// .clipShape(RoundedRectangle(cornerRadius: .arcCornerRadiusMedium))
/// ```
///
/// - Note: All padding values automatically adjust based on the user's
///   Dynamic Type preference via ``ARCLayoutScale/arcScaleFactor``.
public extension EdgeInsets {
    /// Standard card padding (16pt on all sides).
    ///
    /// Use for cards, containers, and general content blocks that need balanced
    /// internal spacing on all edges.
    ///
    /// - Returns: EdgeInsets with 16pt (scaled) on all sides.
    static var arcPaddingCard: EdgeInsets {
        let s = ARCLayoutScale.arcScaleFactor
        return EdgeInsets(top: 16 * s, leading: 16 * s, bottom: 16 * s, trailing: 16 * s)
    }

    /// Horizontal-only padding (16pt left/right, 0pt top/bottom).
    ///
    /// Ideal for list items, rows, or content that needs horizontal insets
    /// without vertical spacing.
    ///
    /// - Returns: EdgeInsets with 16pt (scaled) on leading/trailing edges only.
    static var arcPaddingHorizontal: EdgeInsets {
        let s = ARCLayoutScale.arcScaleFactor
        return EdgeInsets(top: 0, leading: 16 * s, bottom: 0, trailing: 16 * s)
    }

    /// Section padding with extra vertical space (24pt top/bottom, 16pt left/right).
    ///
    /// Use for major content sections, full screens, or areas requiring
    /// generous vertical breathing room.
    ///
    /// - Returns: EdgeInsets with 24pt (scaled) vertical and 16pt (scaled) horizontal.
    static var arcPaddingSection: EdgeInsets {
        let s = ARCLayoutScale.arcScaleFactor
        return EdgeInsets(top: 24 * s, leading: 16 * s, bottom: 24 * s, trailing: 16 * s)
    }

    /// Compact padding for small elements (8pt top/bottom, 12pt left/right).
    ///
    /// Perfect for buttons, tags, badges, or other compact UI components
    /// that need minimal internal spacing.
    ///
    /// - Returns: EdgeInsets with 8pt (scaled) vertical and 12pt (scaled) horizontal.
    static var arcPaddingCompact: EdgeInsets {
        let s = ARCLayoutScale.arcScaleFactor
        return EdgeInsets(top: 8 * s, leading: 12 * s, bottom: 8 * s, trailing: 12 * s)
    }
}

// =====================================================
// MARK: - ARC Colors (System + Brand Tokens)
// =====================================================

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
public extension Color {
    /// Primary background color.
    ///
    /// The main background color for screens and views. Automatically adapts
    /// to the system appearance (light/dark mode).
    ///
    /// - Maps to `UIColor.systemBackground` on iOS/tvOS/watchOS
    /// - Maps to `NSColor.windowBackgroundColor` on macOS
    ///
    /// - Returns: A platform-appropriate adaptive background color.
    static var arcBackgroundPrimary: Color {
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
    static var arcBackgroundSecondary: Color {
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
    static var arcBackgroundTertiary: Color {
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
    static let arcTextPrimary = Color.primary

    /// Secondary text color.
    ///
    /// Use for supporting text, captions, placeholders, and less prominent content.
    /// Provides reduced contrast compared to primary text.
    ///
    /// - Returns: SwiftUI's semantic `.secondary` color.
    static let arcTextSecondary = Color.secondary

    /// Highlight/accent color.
    ///
    /// Brand color used for emphasis, important actions, and visual accents.
    /// Currently set to yellow; customize this for your brand identity.
    ///
    /// - Returns: Yellow color (customize to match your brand).
    static let arcHighlight = Color.yellow
}

// =====================================================
// MARK: - ARC Typography (Dynamic Type compliant)
// =====================================================

/// Typography tokens for the ARC Design System.
///
/// All fonts use the `.rounded` design and automatically scale with Dynamic Type
/// to ensure accessibility. The type system is divided into three categories:
/// titles, body text, and labels.
///
/// ## Font Hierarchy
///
/// ### Titles
/// - ``arcFontTitleLarge``: Large title (bold) - Hero headings
/// - ``arcFontTitleMedium``: Title 2 (semibold) - Section headers
/// - ``arcFontTitleSmall``: Title 3 (semibold) - Subsection headers
///
/// ### Body Text
/// - ``arcFontBodyLarge``: Body (regular) - Primary content
/// - ``arcFontBodyMedium``: Callout (regular) - Emphasized content
/// - ``arcFontBodySmall``: Footnote (regular) - Supporting text
///
/// ### Labels
/// - ``arcFontLabelSmall``: Caption (regular) - Minimal text, timestamps
///
/// ## Example Usage
///
/// ```swift
/// Text("Welcome")
///     .font(.arcFontTitleLarge)
///     .foregroundStyle(.arcTextPrimary)
///
/// Text("Start your journey today")
///     .font(.arcFontBodyMedium)
///     .foregroundStyle(.arcTextSecondary)
/// ```
///
/// - Note: All fonts support Dynamic Type and will scale according to
///   the user's accessibility preferences.
public extension Font {
    /// Small title font (Title 3, semibold, rounded).
    ///
    /// Use for subsection headers, card titles, or tertiary headings.
    ///
    /// - Returns: A semibold rounded Title 3 font that scales with Dynamic Type.
    static let arcFontTitleSmall = Font.system(.title3, design: .rounded).weight(.semibold)

    /// Medium title font (Title 2, semibold, rounded).
    ///
    /// Ideal for section headers, modal titles, or prominent labels.
    ///
    /// - Returns: A semibold rounded Title 2 font that scales with Dynamic Type.
    static let arcFontTitleMedium = Font.system(.title2, design: .rounded).weight(.semibold)

    /// Large title font (Large Title, bold, rounded).
    ///
    /// The most prominent text style for hero headings, page titles,
    /// and high-impact statements.
    ///
    /// - Returns: A bold rounded Large Title font that scales with Dynamic Type.
    static let arcFontTitleLarge = Font.system(.largeTitle, design: .rounded).weight(.bold)

    /// Small body font (Footnote, regular, rounded).
    ///
    /// Supporting text, explanations, footnotes, or metadata.
    ///
    /// - Returns: A regular rounded Footnote font that scales with Dynamic Type.
    static let arcFontBodySmall = Font.system(.footnote, design: .rounded)

    /// Medium body font (Callout, regular, rounded).
    ///
    /// Emphasized content or secondary body text that needs more weight
    /// than standard body but less than headings.
    ///
    /// - Returns: A regular rounded Callout font that scales with Dynamic Type.
    static let arcFontBodyMedium = Font.system(.callout, design: .rounded)

    /// Large body font (Body, regular, rounded).
    ///
    /// Primary content text for paragraphs, descriptions, and main copy.
    ///
    /// - Returns: A regular rounded Body font that scales with Dynamic Type.
    static let arcFontBodyLarge = Font.system(.body, design: .rounded)

    /// Small label font (Caption, regular, rounded).
    ///
    /// Minimal text elements like timestamps, fine print, or auxiliary labels.
    ///
    /// - Returns: A regular rounded Caption font that scales with Dynamic Type.
    static let arcFontLabelSmall = Font.system(.caption, design: .rounded)
}

// =====================================================
// MARK: - ARC Shadows
// =====================================================

/// Shadow color tokens for the ARC Design System.
///
/// These shadow colors provide elevation and depth to UI elements.
/// Use them with SwiftUI's `.shadow()` modifier to create layered interfaces.
///
/// ## Available Shadow Tokens
///
/// - ``arcShadowLight``: Subtle elevation (8% opacity)
/// - ``arcShadowMedium``: Standard cards and containers (15% opacity)
/// - ``arcShadowStrong``: Prominent elevation, modals (25% opacity)
///
/// ## Example Usage
///
/// ```swift
/// RoundedRectangle(cornerRadius: .arcCornerRadiusMedium)
///     .fill(.arcBackgroundSecondary)
///     .shadow(color: .arcShadowMedium, radius: 8, x: 0, y: 4)
/// ```
///
/// - Note: Shadow colors are static and don't adapt to Dynamic Type,
///   but they do respect light/dark mode via black opacity.
public extension Color {
    /// Light shadow color (8% black opacity).
    ///
    /// Subtle elevation for floating elements or minimal depth.
    ///
    /// - Returns: Black with 8% opacity.
    static let arcShadowLight = Color.black.opacity(0.08)

    /// Medium shadow color (15% black opacity).
    ///
    /// Standard elevation for cards, buttons, and containers.
    ///
    /// - Returns: Black with 15% opacity.
    static let arcShadowMedium = Color.black.opacity(0.15)

    /// Strong shadow color (25% black opacity).
    ///
    /// Prominent elevation for modals, popovers, and important UI elements.
    ///
    /// - Returns: Black with 25% opacity.
    static let arcShadowStrong = Color.black.opacity(0.25)
}

// =====================================================
// MARK: - ARC Animations
// =====================================================

/// Animation presets for the ARC Design System.
///
/// Consistent animation timing creates a polished, cohesive user experience.
/// These presets cover common interaction patterns from quick feedback to
/// smooth transitions.
///
/// ## Available Animation Tokens
///
/// - ``arcAnimationBase``: Standard transitions (0.25s ease-in-out)
/// - ``arcAnimationSmooth``: Slower, elegant transitions (0.35s ease-in-out)
/// - ``arcAnimationQuick``: Snappy spring animation for immediate feedback
///
/// ## Example Usage
///
/// ```swift
/// @State private var isExpanded = false
///
/// Rectangle()
///     .frame(width: isExpanded ? 200 : 100, height: 100)
///     .animation(.arcAnimationBase, value: isExpanded)
/// ```
///
/// - Note: Use animations consistently throughout your app to maintain
///   a unified feel. Prefer `.arcAnimationBase` for most interactions.
public extension Animation {
    /// Base animation preset (0.25s ease-in-out).
    ///
    /// Standard animation for most UI transitions, state changes,
    /// and interactive elements. This is the default choice.
    ///
    /// - Returns: Ease-in-out animation with 0.25 second duration.
    static let arcAnimationBase = Animation.easeInOut(duration: 0.25)

    /// Smooth animation preset (0.35s ease-in-out).
    ///
    /// Slower, more elegant animation for large transitions, screen changes,
    /// or when you want to draw attention to the movement.
    ///
    /// - Returns: Ease-in-out animation with 0.35 second duration.
    static let arcAnimationSmooth = Animation.easeInOut(duration: 0.35)

    /// Quick spring animation preset.
    ///
    /// Snappy, bouncy animation perfect for button presses, toggles,
    /// and immediate user feedback.
    ///
    /// - Returns: Spring animation with 0.25s response and 0.8 damping.
    static let arcAnimationQuick = Animation.spring(response: 0.25, dampingFraction: 0.8)
}
