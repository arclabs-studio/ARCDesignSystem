//
//  ARCColorsPreview.swift
//  ARCDesignSystem
//
//  Created by ARC Labs on 1/24/26.
//

import SwiftUI

/// A visual showcase of ARC Design System brand and semantic colors.
///
/// This preview displays all color tokens with their light/dark mode variants
/// and includes contrast ratio information for accessibility validation.
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
public struct ARCColorsPreview: View {
    public init() {}

    public var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: .arcSpacingXLarge) {
                // MARK: - Brand Colors

                VStack(alignment: .leading, spacing: .arcSpacingMedium) {
                    Text("Brand Colors")
                        .font(.title2)
                        .fontWeight(.semibold)

                    Text("Use for buttons, accents, and brand identity. Never for body text.")
                        .font(.caption)
                        .foregroundStyle(.secondary)

                    BrandColorRow(
                        name: "Burgundy",
                        color: .arcBrandBurgundy,
                        usage: "Prominent buttons, selected states"
                    )

                    BrandColorRow(
                        name: "Gold",
                        color: .arcBrandGold,
                        usage: "Accent color, status icons"
                    )

                    BrandColorRow(
                        name: "Black/White",
                        color: .arcBrandBlack,
                        usage: "High contrast text, logos"
                    )
                }
                .padding(.arcPaddingCard)
                .background(Color.arcBackgroundSecondary)
                .clipShape(RoundedRectangle(cornerRadius: .arcCornerRadiusMedium))

                // MARK: - Semantic Colors

                VStack(alignment: .leading, spacing: .arcSpacingMedium) {
                    Text("Semantic Colors")
                        .font(.title2)
                        .fontWeight(.semibold)

                    Text("System colors that adapt to light/dark mode automatically.")
                        .font(.caption)
                        .foregroundStyle(.secondary)

                    SemanticColorRow(name: "Background Primary", color: .arcBackgroundPrimary)
                    SemanticColorRow(name: "Background Secondary", color: .arcBackgroundSecondary)
                    SemanticColorRow(name: "Background Tertiary", color: .arcBackgroundTertiary)
                    Divider()
                    SemanticColorRow(name: "Text Tertiary", color: .arcTextTertiary)
                    SemanticColorRow(name: "Text Quaternary", color: .arcTextQuaternary)
                    SemanticColorRow(name: "Text Disabled", color: .arcTextDisabled)
                    Divider()
                    SemanticColorRow(name: "Link", color: .arcLink)
                    SemanticColorRow(name: "Separator", color: .arcSeparator)
                }
                .padding(.arcPaddingCard)
                .background(Color.arcBackgroundSecondary)
                .clipShape(RoundedRectangle(cornerRadius: .arcCornerRadiusMedium))

                // MARK: - Contrast Demo

                VStack(alignment: .leading, spacing: .arcSpacingMedium) {
                    Text("Contrast Examples")
                        .font(.title2)
                        .fontWeight(.semibold)

                    Text("Demonstrates proper color usage with contrast validation.")
                        .font(.caption)
                        .foregroundStyle(.secondary)

                    // White text on Burgundy
                    HStack {
                        RoundedRectangle(cornerRadius: .arcCornerRadiusSmall)
                            .fill(Color.arcBrandBurgundy)
                            .frame(height: 50)
                            .overlay(
                                Text("White on Burgundy")
                                    .foregroundStyle(.white)
                                    .font(.headline)
                            )
                    }

                    // Black text on Gold
                    HStack {
                        RoundedRectangle(cornerRadius: .arcCornerRadiusSmall)
                            .fill(Color.arcBrandGold)
                            .frame(height: 50)
                            .overlay(
                                Text("Black on Gold")
                                    .foregroundStyle(.black)
                                    .font(.headline)
                            )
                    }

                    // Button example
                    HStack(spacing: .arcSpacingMedium) {
                        Button("Primary") {}
                            .buttonStyle(.borderedProminent)
                            .tint(.arcBrandBurgundy)

                        Button("Secondary") {}
                            .buttonStyle(.bordered)
                            .tint(.arcBrandBurgundy)
                    }
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
private struct BrandColorRow: View {
    let name: String
    let color: Color
    let usage: String

    var body: some View {
        HStack(spacing: .arcSpacingMedium) {
            Circle()
                .fill(color)
                .frame(width: 50, height: 50)
                .overlay(
                    Circle()
                        .stroke(.primary.opacity(0.1), lineWidth: 1)
                )

            VStack(alignment: .leading, spacing: 2) {
                Text(name)
                    .font(.headline)
                Text(usage)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

            Spacer()
        }
    }
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
private struct SemanticColorRow: View {
    let name: String
    let color: Color

    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: .arcCornerRadiusSmall)
                .fill(color)
                .frame(width: 40, height: 30)
                .overlay(
                    RoundedRectangle(cornerRadius: .arcCornerRadiusSmall)
                        .stroke(.primary.opacity(0.1), lineWidth: 0.5)
                )

            Text(name)
                .font(.callout)

            Spacer()
        }
    }
}

// MARK: - Preview

#Preview("Colors (Light)") {
    ARCColorsPreview()
        .preferredColorScheme(.light)
}

#Preview("Colors (Dark)") {
    ARCColorsPreview()
        .preferredColorScheme(.dark)
}
