//
//  Font+Typography.swift
//  ARCDesignSystem
//
//  Created by ARC Labs on 4/11/25.
//

import SwiftUI

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
