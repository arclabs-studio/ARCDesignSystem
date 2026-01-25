//
//  ARCTypographyPreview.swift
//  ARCDesignSystem
//
//  Created by ARC Labs on 1/24/26.
//

import SwiftUI

/// A visual showcase of ARC Design System typography tokens.
///
/// This preview displays all typography tokens with Dynamic Type scaling
/// demonstrations and size comparisons.
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
public struct ARCTypographyPreview: View {
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize

    public init() {}

    public var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: .arcSpacingXLarge) {
                // Dynamic Type indicator
                HStack {
                    Image(systemName: "textformat.size")
                    Text("Dynamic Type: \(dynamicTypeSize.description)")
                }
                .font(.caption)
                .foregroundStyle(.secondary)
                .padding(.horizontal)

                // MARK: - Titles

                VStack(alignment: .leading, spacing: .arcSpacingMedium) {
                    Text("Titles")
                        .font(.arcTitle2)
                        .padding(.bottom, .arcSpacingSmall)

                    TypographyRow(name: ".arcLargeTitle", font: .arcLargeTitle)
                    TypographyRow(name: ".arcTitle", font: .arcTitle)
                    TypographyRow(name: ".arcTitle2", font: .arcTitle2)
                    TypographyRow(name: ".arcTitle3", font: .arcTitle3)
                }
                .padding(.arcPaddingCard)
                .background(Color.arcBackgroundSecondary)
                .clipShape(RoundedRectangle(cornerRadius: .arcCornerRadiusMedium))

                // MARK: - Headlines & Body

                VStack(alignment: .leading, spacing: .arcSpacingMedium) {
                    Text("Headlines & Body")
                        .font(.arcTitle2)
                        .padding(.bottom, .arcSpacingSmall)

                    TypographyRow(name: ".arcHeadline", font: .arcHeadline)
                    TypographyRow(name: ".arcSubheadline", font: .arcSubheadline)
                    TypographyRow(name: ".arcBody", font: .arcBody)
                    TypographyRow(name: ".arcCallout", font: .arcCallout)
                }
                .padding(.arcPaddingCard)
                .background(Color.arcBackgroundSecondary)
                .clipShape(RoundedRectangle(cornerRadius: .arcCornerRadiusMedium))

                // MARK: - Small Text

                VStack(alignment: .leading, spacing: .arcSpacingMedium) {
                    Text("Small Text")
                        .font(.arcTitle2)
                        .padding(.bottom, .arcSpacingSmall)

                    TypographyRow(name: ".arcFootnote", font: .arcFootnote)
                    TypographyRow(name: ".arcCaption", font: .arcCaption)
                    TypographyRow(name: ".arcCaption2", font: .arcCaption2)
                }
                .padding(.arcPaddingCard)
                .background(Color.arcBackgroundSecondary)
                .clipShape(RoundedRectangle(cornerRadius: .arcCornerRadiusMedium))

                // MARK: - Brand Font

                VStack(alignment: .leading, spacing: .arcSpacingMedium) {
                    Text("Brand Font (Radley Sans)")
                        .font(.arcTitle2)
                        .padding(.bottom, .arcSpacingSmall)

                    Text("ARC Labs Studio")
                        .font(.arcBrandFont(.largeTitle))
                        .foregroundStyle(Color.arcBrandBurgundy)

                    Text("Design System Preview")
                        .font(.arcBrandFont(.title))

                    Text("The quick brown fox jumps over the lazy dog.")
                        .font(.arcBrandFont(.body))
                        .foregroundStyle(.secondary)
                }
                .padding(.arcPaddingCard)
                .background(Color.arcBackgroundSecondary)
                .clipShape(RoundedRectangle(cornerRadius: .arcCornerRadiusMedium))

                // MARK: - Dynamic Type Demo

                VStack(alignment: .leading, spacing: .arcSpacingMedium) {
                    Text("Dynamic Type Scaling")
                        .font(.arcTitle2)
                        .padding(.bottom, .arcSpacingSmall)

                    Text("All fonts scale automatically with Dynamic Type. Use @ScaledMetric for custom values.")
                        .font(.arcFootnote)
                        .foregroundStyle(.secondary)

                    ScaledSpacingDemo()
                }
                .padding(.arcPaddingCard)
                .background(Color.arcBackgroundSecondary)
                .clipShape(RoundedRectangle(cornerRadius: .arcCornerRadiusMedium))
            }
            .padding(.arcPaddingSection)
        }
        .background(Color.arcBackgroundPrimary)
    }
}

// MARK: - Components

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
private struct TypographyRow: View {
    let name: String
    let font: Font

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(name)
                .font(.caption2)
                .foregroundStyle(.tertiary)
            Text("The quick brown fox")
                .font(font)
        }
    }
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
private struct ScaledSpacingDemo: View {
    @ScaledMetric(relativeTo: .body)
    private var spacing: CGFloat = .arcSpacingMedium

    var body: some View {
        VStack(alignment: .leading, spacing: spacing) {
            Text("Line 1")
            Text("Line 2")
            Text("Line 3")
        }
        .font(.arcBody)
        .padding()
        .background(Color.arcBackgroundTertiary)
        .clipShape(RoundedRectangle(cornerRadius: .arcCornerRadiusSmall))
        .overlay(alignment: .topTrailing) {
            Text("Spacing: \(Int(spacing))pt")
                .font(.caption2)
                .padding(4)
                .background(Color.arcBackgroundSecondary)
                .clipShape(RoundedRectangle(cornerRadius: 4))
                .offset(x: 4, y: -8)
        }
    }
}

// MARK: - DynamicTypeSize Extension

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension DynamicTypeSize {
    var description: String {
        switch self {
        case .xSmall: return "XSmall"
        case .small: return "Small"
        case .medium: return "Medium"
        case .large: return "Large (Default)"
        case .xLarge: return "XLarge"
        case .xxLarge: return "XXLarge"
        case .xxxLarge: return "XXXLarge"
        case .accessibility1: return "Accessibility 1"
        case .accessibility2: return "Accessibility 2"
        case .accessibility3: return "Accessibility 3"
        case .accessibility4: return "Accessibility 4"
        case .accessibility5: return "Accessibility 5"
        @unknown default: return "Unknown"
        }
    }
}

// MARK: - Preview

#Preview("Typography") {
    ARCTypographyPreview()
}

#Preview("Typography (Large)") {
    ARCTypographyPreview()
        .dynamicTypeSize(.xxxLarge)
}

#Preview("Typography (Accessibility)") {
    ARCTypographyPreview()
        .dynamicTypeSize(.accessibility3)
}
