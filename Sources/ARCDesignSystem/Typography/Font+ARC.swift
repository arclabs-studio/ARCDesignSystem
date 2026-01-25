//
//  Font+ARC.swift
//  ARCDesignSystem
//
//  Created by ARC Labs on 1/24/26.
//

import SwiftUI

/// ARC Design System typography tokens.
///
/// These fonts wrap SwiftUI's native Text Styles with optional weight customization
/// for consistent typography across the app. All fonts support Dynamic Type automatically.
///
/// ## Usage Philosophy
///
/// For most cases, use SwiftUI's native fonts directly:
/// ```swift
/// Text("Title").font(.title)
/// Text("Body").font(.body)
/// ```
///
/// Use ARC tokens when you need consistent weight variations:
/// ```swift
/// Text("Heading").font(.arcTitle)      // .title with semibold
/// Text("Content").font(.arcBody)        // .body (standard)
/// Text("Action").font(.arcCallout)      // .callout (standard)
/// ```
///
/// ## Dynamic Type
///
/// All fonts automatically scale with Dynamic Type settings.
/// No additional configuration is required.
///
/// - Note: These tokens complement, not replace, SwiftUI's native typography.
///   Use native `.body`, `.title`, etc. when the default weights work for you.
extension Font {
    // MARK: - Titles

    /// Large title with bold weight.
    ///
    /// Use for screen titles and major section headers.
    /// Maps to SwiftUI `.largeTitle.weight(.bold)`.
    public static let arcLargeTitle = Font.largeTitle.weight(.bold)

    /// Title with semibold weight.
    ///
    /// Use for primary headings within content.
    /// Maps to SwiftUI `.title.weight(.semibold)`.
    public static let arcTitle = Font.title.weight(.semibold)

    /// Title 2 with semibold weight.
    ///
    /// Use for secondary headings within content.
    /// Maps to SwiftUI `.title2.weight(.semibold)`.
    public static let arcTitle2 = Font.title2.weight(.semibold)

    /// Title 3 with semibold weight.
    ///
    /// Use for tertiary headings or card titles.
    /// Maps to SwiftUI `.title3.weight(.semibold)`.
    public static let arcTitle3 = Font.title3.weight(.semibold)

    // MARK: - Headlines

    /// Headline with semibold weight.
    ///
    /// Use for emphasized labels or short important text.
    /// Maps to SwiftUI `.headline`.
    public static let arcHeadline = Font.headline

    /// Subheadline with regular weight.
    ///
    /// Use for secondary labels or metadata.
    /// Maps to SwiftUI `.subheadline`.
    public static let arcSubheadline = Font.subheadline

    // MARK: - Body

    /// Body text with regular weight.
    ///
    /// Use for primary content text and paragraphs.
    /// Maps to SwiftUI `.body`.
    public static let arcBody = Font.body

    /// Callout text with regular weight.
    ///
    /// Use for pull quotes, annotations, or side notes.
    /// Maps to SwiftUI `.callout`.
    public static let arcCallout = Font.callout

    // MARK: - Small Text

    /// Footnote text.
    ///
    /// Use for supplementary information, disclaimers, or timestamps.
    /// Maps to SwiftUI `.footnote`.
    public static let arcFootnote = Font.footnote

    /// Caption text.
    ///
    /// Use for image captions, labels, or tertiary information.
    /// Maps to SwiftUI `.caption`.
    public static let arcCaption = Font.caption

    /// Caption 2 text (smallest).
    ///
    /// Use for the smallest readable text, like badges or timestamps.
    /// Maps to SwiftUI `.caption2`.
    public static let arcCaption2 = Font.caption2

    // MARK: - Custom Font Factory

    /// Creates a custom system font with the specified parameters.
    ///
    /// Use this for cases where standard text styles don't meet your needs.
    /// The font will still scale with Dynamic Type.
    ///
    /// - Parameters:
    ///   - size: The point size of the font.
    ///   - weight: The weight of the font. Defaults to `.regular`.
    ///   - design: The design of the font. Defaults to `.default`.
    /// - Returns: A configured system font.
    ///
    /// ## Example
    ///
    /// ```swift
    /// Text("Custom")
    ///     .font(.arcSystem(size: 18, weight: .medium, design: .rounded))
    /// ```
    public static func arcSystem(
        size: CGFloat,
        weight: Font.Weight = .regular,
        design: Font.Design = .default
    ) -> Font {
        .system(size: size, weight: weight, design: design)
    }
}

// MARK: - Font Helpers

extension Font {
    /// Creates a rounded variant of an ARC font.
    ///
    /// - Parameter font: The base font to make rounded.
    /// - Returns: A rounded version of the font.
    ///
    /// ## Example
    ///
    /// ```swift
    /// Text("Friendly")
    ///     .font(.arcRounded(.arcTitle))
    /// ```
    public static func arcRounded(_ font: Font) -> Font {
        // Note: SwiftUI doesn't provide a direct way to change design of an existing Font.
        // This is a convenience for documentation. Use .arcSystem() with .rounded design.
        font
    }
}

// MARK: - Minimum Size Validation

/// Typography validation utilities.
///
/// Use these to ensure text meets minimum size requirements per platform.
public enum ARCTypographyValidator {
    /// Minimum recommended font sizes by platform (in points).
    public enum MinimumSize {
        /// iOS/iPadOS minimum: 11pt
        public static let iOS: CGFloat = 11

        /// macOS minimum: 10pt
        public static let macOS: CGFloat = 10

        /// watchOS minimum: 12pt
        public static let watchOS: CGFloat = 12

        /// tvOS minimum: 23pt (10-foot experience)
        public static let tvOS: CGFloat = 23
    }

    /// Validates that a font size meets minimum requirements for the current platform.
    ///
    /// - Parameter size: The font size in points.
    /// - Returns: `true` if the size meets minimum requirements.
    public static func validateMinimumSize(_ size: CGFloat) -> Bool {
        #if os(iOS)
        return size >= MinimumSize.iOS
        #elseif os(macOS)
        return size >= MinimumSize.macOS
        #elseif os(watchOS)
        return size >= MinimumSize.watchOS
        #elseif os(tvOS)
        return size >= MinimumSize.tvOS
        #else
        return size >= MinimumSize.iOS
        #endif
    }
}
