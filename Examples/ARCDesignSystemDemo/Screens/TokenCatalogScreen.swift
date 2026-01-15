//
//  TokenCatalogScreen.swift
//  ARCDesignSystemDemo
//
//  Created by ARC Labs Studio on 12/19/25.
//

import ARCDesignSystem
import SwiftUI

/// A comprehensive catalog of all ARC Design System tokens.
///
/// This screen provides a browsable reference of all available tokens
/// organized by category: spacing, colors, corner radius, and effects.
struct TokenCatalogScreen: View {
    var body: some View {
        ScrollView {
            VStack(spacing: .arcSpacingXLarge) {
                // Branding Colors (Featured)
                tokenSection(title: "Brand Colors", icon: "paintbrush.fill") {
                    BrandingColorsView()
                }

                // Spacing Tokens
                tokenSection(title: "Spacing", icon: "ruler") {
                    SpacingTokensView()
                }

                // Corner Radius Tokens
                tokenSection(title: "Corner Radius", icon: "square.on.square") {
                    CornerRadiusTokensView()
                }

                // Color Tokens
                tokenSection(title: "Colors", icon: "paintpalette") {
                    ColorTokensView()
                }

                // Padding Presets
                tokenSection(title: "Padding Presets", icon: "square.dashed") {
                    PaddingTokensView()
                }

                // Materials
                tokenSection(title: "Materials", icon: "circle.hexagongrid") {
                    MaterialsView()
                }

                // Symbol Effects
                tokenSection(title: "Symbol Effects", icon: "sparkles") {
                    NavigationLink {
                        ARCSymbolEffectsPreview()
                            .navigationTitle("Symbol Effects")
                    } label: {
                        Label("View All Symbol Effects", systemImage: "arrow.right")
                            .font(.callout)
                    }
                }
            }
            .padding(.arcPaddingSection)
        }
        .background(Color.arcBackgroundPrimary)
        .navigationTitle("Token Catalog")
        #if os(iOS)
            .navigationBarTitleDisplayMode(.inline)
        #endif
    }

    @ViewBuilder
    private func tokenSection(
        title: String,
        icon: String,
        @ViewBuilder content: () -> some View
    ) -> some View {
        VStack(alignment: .leading, spacing: .arcSpacingMedium) {
            Label(title, systemImage: icon)
                .font(.title2.bold())
                .foregroundStyle(.primary)

            content()
        }
        .padding(.arcPaddingCard)
        .background(Color.arcBackgroundSecondary)
        .clipShape(RoundedRectangle(cornerRadius: .arcCornerRadiusLarge))
    }
}

// MARK: - Spacing Tokens View

private struct SpacingTokensView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: .arcSpacingSmall) {
            spacingRow("XSmall", value: .arcSpacingXSmall)
            spacingRow("Small", value: .arcSpacingSmall)
            spacingRow("Medium", value: .arcSpacingMedium)
            spacingRow("Large", value: .arcSpacingLarge)
            spacingRow("XLarge", value: .arcSpacingXLarge)
            spacingRow("XXLarge", value: .arcSpacingXXLarge)
        }
    }

    private func spacingRow(_ name: String, value: CGFloat) -> some View {
        HStack {
            Text(".arcSpacing\(name)")
                .font(.caption.monospaced())
                .foregroundStyle(.secondary)

            Spacer()

            Text("\(Int(value))pt")
                .font(.caption)
                .foregroundStyle(.secondary)

            RoundedRectangle(cornerRadius: 2)
                .fill(Color.accentColor)
                .frame(width: value, height: 8)
        }
    }
}

// MARK: - Corner Radius Tokens View

private struct CornerRadiusTokensView: View {
    var body: some View {
        HStack(spacing: .arcSpacingMedium) {
            radiusDemo("S", radius: .arcCornerRadiusSmall)
            radiusDemo("M", radius: .arcCornerRadiusMedium)
            radiusDemo("L", radius: .arcCornerRadiusLarge)
            radiusDemo("XL", radius: .arcCornerRadiusXLarge)
        }
    }

    private func radiusDemo(_ label: String, radius: CGFloat) -> some View {
        VStack(spacing: .arcSpacingXSmall) {
            RoundedRectangle(cornerRadius: radius)
                .fill(Color.accentColor.opacity(0.3))
                .frame(width: 50, height: 50)
                .overlay(
                    RoundedRectangle(cornerRadius: radius)
                        .stroke(Color.accentColor, lineWidth: 2)
                )

            Text(label)
                .font(.caption2)
                .foregroundStyle(.secondary)

            Text("\(Int(radius))pt")
                .font(.caption2.monospaced())
                .foregroundStyle(.tertiary)
        }
        .frame(maxWidth: .infinity)
    }
}

// MARK: - Color Tokens View

private struct ColorTokensView: View {
    var body: some View {
        VStack(spacing: .arcSpacingSmall) {
            colorRow("Background Primary", color: .arcBackgroundPrimary)
            colorRow("Background Secondary", color: .arcBackgroundSecondary)
            colorRow("Background Tertiary", color: .arcBackgroundTertiary)

            Divider().padding(.vertical, .arcSpacingXSmall)

            colorRow("Text Tertiary", color: .arcTextTertiary)
            colorRow("Text Quaternary", color: .arcTextQuaternary)
            colorRow("Text Disabled", color: .arcTextDisabled)

            Divider().padding(.vertical, .arcSpacingXSmall)

            colorRow("Shadow Light", color: .arcShadowLight)
            colorRow("Shadow Medium", color: .arcShadowMedium)
            colorRow("Shadow Strong", color: .arcShadowStrong)
        }
    }

    private func colorRow(_ name: String, color: Color) -> some View {
        HStack {
            RoundedRectangle(cornerRadius: 4)
                .fill(color)
                .frame(width: 24, height: 24)
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color.arcSeparator, lineWidth: 0.5)
                )

            Text(name)
                .font(.caption)
                .foregroundStyle(.primary)

            Spacer()
        }
    }
}

// MARK: - Padding Tokens View

private struct PaddingTokensView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: .arcSpacingSmall) {
            paddingDemo("Card", padding: .arcPaddingCard)
            paddingDemo("Section", padding: .arcPaddingSection)
            paddingDemo("Compact", padding: .arcPaddingCompact)
            paddingDemo("Horizontal", padding: .arcPaddingHorizontal)
        }
    }

    private func paddingDemo(_ name: String, padding: EdgeInsets) -> some View {
        HStack {
            Text(".arcPadding\(name)")
                .font(.caption.monospaced())
                .foregroundStyle(.secondary)

            Spacer()

            Text("T:\(Int(padding.top)) L:\(Int(padding.leading))")
                .font(.caption2.monospaced())
                .foregroundStyle(.tertiary)
        }
    }
}

// MARK: - Materials View

private struct MaterialsView: View {
    var body: some View {
        VStack(spacing: .arcSpacingSmall) {
            Text("Use .arcMaterialBackground() for blur effects")
                .font(.caption)
                .foregroundStyle(.secondary)

            HStack(spacing: .arcSpacingSmall) {
                materialDemo("Thin", material: .arcThin)
                materialDemo("Regular", material: .arcRegular)
                materialDemo("Thick", material: .arcThick)
            }
        }
    }

    private func materialDemo(_ name: String, material: Material) -> some View {
        Text(name)
            .font(.caption2)
            .padding(.arcSpacingSmall)
            .frame(maxWidth: .infinity)
            .background(material, in: RoundedRectangle(cornerRadius: .arcCornerRadiusSmall))
    }
}

// MARK: - Branding Colors View

private struct BrandingColorsView: View {
    var body: some View {
        VStack(spacing: .arcSpacingMedium) {
            Text("ARC Labs Studio official brand colors")
                .font(.caption)
                .foregroundStyle(.secondary)

            HStack(spacing: .arcSpacingMedium) {
                brandColorDemo("Burgundy", color: .arcBrandBurgundy, hex: "#541311")
                brandColorDemo("Gold", color: .arcBrandGold, hex: "#FFB42E")
                brandColorDemo("Black", color: .arcBrandBlack, hex: "#000000")
            }
        }
    }

    private func brandColorDemo(_ name: String, color: Color, hex: String) -> some View {
        VStack(spacing: .arcSpacingXSmall) {
            RoundedRectangle(cornerRadius: .arcCornerRadiusMedium)
                .fill(color)
                .frame(height: 60)
                .overlay(
                    RoundedRectangle(cornerRadius: .arcCornerRadiusMedium)
                        .stroke(Color.arcSeparator, lineWidth: 0.5)
                )

            Text(name)
                .font(.caption)
                .fontWeight(.medium)
                .foregroundStyle(.primary)

            Text(hex)
                .font(.caption2.monospaced())
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    NavigationStack {
        TokenCatalogScreen()
    }
}
