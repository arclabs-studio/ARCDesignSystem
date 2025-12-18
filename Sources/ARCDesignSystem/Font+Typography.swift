//
//  Font+Typography.swift
//  ARCDesignSystem
//
//  Created by ARC Labs on 4/11/25.
//

import SwiftUI

/// Typography tokens for the ARC Design System.
///
/// All fonts use the system default design (SF Pro) and automatically scale with Dynamic Type
/// to ensure accessibility. The type system follows Apple Human Interface Guidelines
/// with titles, headlines, body text, and labels.
///
/// ## Font Hierarchy
///
/// ### Titles
/// - ``arcFontTitleLarge``: Large title (bold) - Hero headings, navigation titles
/// - ``arcFontTitle1``: Title 1 (regular) - Page titles
/// - ``arcFontTitle2``: Title 2 (regular) - Section headers
/// - ``arcFontTitle3``: Title 3 (regular) - Subsection headers
///
/// ### Headlines
/// - ``arcFontHeadline``: Headline (semibold) - Emphasized short text
/// - ``arcFontSubheadline``: Subheadline (regular) - Secondary headlines
///
/// ### Body Text
/// - ``arcFontBody``: Body (regular) - Primary content
/// - ``arcFontCallout``: Callout (regular) - Emphasized secondary content
/// - ``arcFontFootnote``: Footnote (regular) - Supporting text
///
/// ### Labels
/// - ``arcFontCaption1``: Caption 1 (regular) - Timestamps, annotations
/// - ``arcFontCaption2``: Caption 2 (regular) - Minimal auxiliary text
///
/// ## Example Usage
///
/// ```swift
/// Text("Welcome")
///     .font(.arcFontTitleLarge)
///     .foregroundStyle(.arcTextPrimary)
///
/// Text("Start your journey today")
///     .font(.arcFontBody)
///     .foregroundStyle(.arcTextSecondary)
/// ```
///
/// - Note: All fonts support Dynamic Type and will scale according to
///   the user's accessibility preferences. Uses SF Pro (system default).
extension Font {
    // MARK: - Titles

    /// Large title font (Large Title, bold).
    ///
    /// The most prominent text style for hero headings, navigation bar titles,
    /// and high-impact statements.
    ///
    /// - Returns: A bold Large Title font that scales with Dynamic Type.
    public static let arcFontTitleLarge = Font.system(.largeTitle, design: .default).weight(.bold)

    /// Title 1 font (Title, regular).
    ///
    /// Primary page titles and major section headers.
    ///
    /// - Returns: A regular Title font that scales with Dynamic Type.
    public static let arcFontTitle1 = Font.system(.title, design: .default)

    /// Title 2 font (Title 2, regular).
    ///
    /// Section headers and secondary titles.
    ///
    /// - Returns: A regular Title 2 font that scales with Dynamic Type.
    public static let arcFontTitle2 = Font.system(.title2, design: .default)

    /// Title 3 font (Title 3, regular).
    ///
    /// Subsection headers, card titles, or tertiary headings.
    ///
    /// - Returns: A regular Title 3 font that scales with Dynamic Type.
    public static let arcFontTitle3 = Font.system(.title3, design: .default)

    // MARK: - Headlines

    /// Headline font (Headline, semibold).
    ///
    /// Emphasized short text that needs to stand out from body text.
    /// Apple HIG uses semibold weight for headlines.
    ///
    /// - Returns: A semibold Headline font that scales with Dynamic Type.
    public static let arcFontHeadline = Font.system(.headline, design: .default)

    /// Subheadline font (Subheadline, regular).
    ///
    /// Secondary headlines, list row subtitles, or supporting header text.
    ///
    /// - Returns: A regular Subheadline font that scales with Dynamic Type.
    public static let arcFontSubheadline = Font.system(.subheadline, design: .default)

    // MARK: - Body

    /// Body font (Body, regular).
    ///
    /// Primary content text for paragraphs, descriptions, and main copy.
    /// This is the default reading font size (17pt on iOS).
    ///
    /// - Returns: A regular Body font that scales with Dynamic Type.
    public static let arcFontBody = Font.system(.body, design: .default)

    /// Callout font (Callout, regular).
    ///
    /// Emphasized content or secondary body text. Slightly smaller than body.
    ///
    /// - Returns: A regular Callout font that scales with Dynamic Type.
    public static let arcFontCallout = Font.system(.callout, design: .default)

    /// Footnote font (Footnote, regular).
    ///
    /// Supporting text, explanations, footnotes, or metadata.
    ///
    /// - Returns: A regular Footnote font that scales with Dynamic Type.
    public static let arcFontFootnote = Font.system(.footnote, design: .default)

    // MARK: - Captions

    /// Caption 1 font (Caption, regular).
    ///
    /// Timestamps, annotations, or auxiliary labels.
    ///
    /// - Returns: A regular Caption font that scales with Dynamic Type.
    public static let arcFontCaption1 = Font.system(.caption, design: .default)

    /// Caption 2 font (Caption 2, regular).
    ///
    /// Minimal text elements like fine print or the smallest auxiliary labels.
    ///
    /// - Returns: A regular Caption 2 font that scales with Dynamic Type.
    public static let arcFontCaption2 = Font.system(.caption2, design: .default)

    // MARK: - Legacy Aliases (Deprecated)

    /// Small title font - Use ``arcFontTitle3`` instead.
    @available(*, deprecated, renamed: "arcFontTitle3")
    public static let arcFontTitleSmall = arcFontTitle3

    /// Medium title font - Use ``arcFontTitle2`` instead.
    @available(*, deprecated, renamed: "arcFontTitle2")
    public static let arcFontTitleMedium = arcFontTitle2

    /// Small body font - Use ``arcFontFootnote`` instead.
    @available(*, deprecated, renamed: "arcFontFootnote")
    public static let arcFontBodySmall = arcFontFootnote

    /// Medium body font - Use ``arcFontCallout`` instead.
    @available(*, deprecated, renamed: "arcFontCallout")
    public static let arcFontBodyMedium = arcFontCallout

    /// Large body font - Use ``arcFontBody`` instead.
    @available(*, deprecated, renamed: "arcFontBody")
    public static let arcFontBodyLarge = arcFontBody

    /// Small label font - Use ``arcFontCaption1`` instead.
    @available(*, deprecated, renamed: "arcFontCaption1")
    public static let arcFontLabelSmall = arcFontCaption1
}
