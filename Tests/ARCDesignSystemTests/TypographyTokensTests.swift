//
//  TypographyTokensTests.swift
//  ARCDesignSystem
//
//  Created by ARC Labs Studio on 18/12/2025.
//

import SwiftUI
import Testing
@testable import ARCDesignSystem

@Suite("Typography Tokens Tests")
struct TypographyTokensTests {
    // MARK: - Title Fonts

    @Test("Title large font is accessible")
    func titleLargeFontIsAccessible() {
        let font = Font.arcFontTitleLarge
        #expect(font == Font.system(.largeTitle, design: .default).weight(.bold))
    }

    @Test("Title 1 font is accessible")
    func title1FontIsAccessible() {
        let font = Font.arcFontTitle1
        #expect(font == Font.system(.title, design: .default))
    }

    @Test("Title 2 font is accessible")
    func title2FontIsAccessible() {
        let font = Font.arcFontTitle2
        #expect(font == Font.system(.title2, design: .default))
    }

    @Test("Title 3 font is accessible")
    func title3FontIsAccessible() {
        let font = Font.arcFontTitle3
        #expect(font == Font.system(.title3, design: .default))
    }

    // MARK: - Headline Fonts

    @Test("Headline font is accessible")
    func headlineFontIsAccessible() {
        let font = Font.arcFontHeadline
        #expect(font == Font.system(.headline, design: .default))
    }

    @Test("Subheadline font is accessible")
    func subheadlineFontIsAccessible() {
        let font = Font.arcFontSubheadline
        #expect(font == Font.system(.subheadline, design: .default))
    }

    // MARK: - Body Fonts

    @Test("Body font is accessible")
    func bodyFontIsAccessible() {
        let font = Font.arcFontBody
        #expect(font == Font.system(.body, design: .default))
    }

    @Test("Callout font is accessible")
    func calloutFontIsAccessible() {
        let font = Font.arcFontCallout
        #expect(font == Font.system(.callout, design: .default))
    }

    @Test("Footnote font is accessible")
    func footnoteFontIsAccessible() {
        let font = Font.arcFontFootnote
        #expect(font == Font.system(.footnote, design: .default))
    }

    // MARK: - Caption Fonts

    @Test("Caption 1 font is accessible")
    func caption1FontIsAccessible() {
        let font = Font.arcFontCaption1
        #expect(font == Font.system(.caption, design: .default))
    }

    @Test("Caption 2 font is accessible")
    func caption2FontIsAccessible() {
        let font = Font.arcFontCaption2
        #expect(font == Font.system(.caption2, design: .default))
    }

    // MARK: - Legacy Aliases

    @Test("Legacy title small alias matches title 3")
    func legacyTitleSmallMatchesTitle3() {
        #expect(Font.arcFontTitleSmall == Font.arcFontTitle3)
    }

    @Test("Legacy title medium alias matches title 2")
    func legacyTitleMediumMatchesTitle2() {
        #expect(Font.arcFontTitleMedium == Font.arcFontTitle2)
    }

    @Test("Legacy body small alias matches footnote")
    func legacyBodySmallMatchesFootnote() {
        #expect(Font.arcFontBodySmall == Font.arcFontFootnote)
    }

    @Test("Legacy body medium alias matches callout")
    func legacyBodyMediumMatchesCallout() {
        #expect(Font.arcFontBodyMedium == Font.arcFontCallout)
    }

    @Test("Legacy body large alias matches body")
    func legacyBodyLargeMatchesBody() {
        #expect(Font.arcFontBodyLarge == Font.arcFontBody)
    }

    @Test("Legacy label small alias matches caption 1")
    func legacyLabelSmallMatchesCaption1() {
        #expect(Font.arcFontLabelSmall == Font.arcFontCaption1)
    }
}
