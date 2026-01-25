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

                // Typography Tokens
                tokenSection(title: "Typography", icon: "textformat") {
                    TypographyTokensView()
                }

                // Animation Tokens
                tokenSection(title: "Animations", icon: "sparkles.rectangle.stack") {
                    AnimationTokensView()
                }

                // Touch Targets
                tokenSection(title: "Touch Targets", icon: "hand.tap") {
                    TouchTargetTokensView()
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

                // Accessibility
                tokenSection(title: "Accessibility", icon: "accessibility") {
                    AccessibilityTokensView()
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
    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        VStack(spacing: .arcSpacingMedium) {
            Text("ARC Labs Studio official brand colors")
                .font(.caption)
                .foregroundStyle(.secondary)

            HStack(spacing: .arcSpacingMedium) {
                brandColorDemo(
                    "Burgundy",
                    color: .arcBrandBurgundy,
                    lightHex: "#541311",
                    darkHex: "#B23850"
                )
                brandColorDemo(
                    "Gold",
                    color: .arcBrandGold,
                    lightHex: "#996B00",
                    darkHex: "#FFB42E"
                )
                brandColorDemo(
                    "Black",
                    color: .arcBrandBlack,
                    lightHex: "#000000",
                    darkHex: "#000000"
                )
            }
        }
    }

    private func brandColorDemo(
        _ name: String,
        color: Color,
        lightHex: String,
        darkHex: String
    ) -> some View {
        let currentHex = colorScheme == .dark ? darkHex : lightHex

        return VStack(spacing: .arcSpacingXSmall) {
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

            Text(currentHex)
                .font(.caption2.monospaced())
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity)
    }
}

// MARK: - Typography Tokens View

private struct TypographyTokensView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: .arcSpacingSmall) {
            Text("System fonts with ARC naming:")
                .font(.caption)
                .foregroundStyle(.secondary)

            typographyRow(".arcLargeTitle", font: .arcLargeTitle)
            typographyRow(".arcTitle", font: .arcTitle)
            typographyRow(".arcTitle2", font: .arcTitle2)
            typographyRow(".arcTitle3", font: .arcTitle3)
            typographyRow(".arcHeadline", font: .arcHeadline)
            typographyRow(".arcBody", font: .arcBody)
            typographyRow(".arcCaption", font: .arcCaption)

            Divider().padding(.vertical, .arcSpacingXSmall)

            Text("Brand font (Radley Sans):")
                .font(.caption)
                .foregroundStyle(.secondary)

            Text("ARC Labs Studio")
                .font(.arcBrandFont(.title))
                .foregroundStyle(Color.arcBrandBurgundy)
        }
    }

    private func typographyRow(_ name: String, font: Font) -> some View {
        HStack {
            Text(name)
                .font(.caption2.monospaced())
                .foregroundStyle(.tertiary)

            Spacer()

            Text("Aa")
                .font(font)
        }
    }
}

// MARK: - Animation Tokens View

private struct AnimationTokensView: View {
    @State private var isAnimating = false

    var body: some View {
        VStack(alignment: .leading, spacing: .arcSpacingMedium) {
            Text("Accessibility-aware animations:")
                .font(.caption)
                .foregroundStyle(.secondary)

            HStack(spacing: .arcSpacingMedium) {
                animationDemo("Quick", animation: .arcQuick)
                animationDemo("Standard", animation: .arcStandard)
                animationDemo("Smooth", animation: .arcSmooth)
                animationDemo("Spring", animation: .arcSpring)
            }

            Button("Animate") {
                withAnimation(.arcDefault) {
                    isAnimating.toggle()
                }
            }
            .buttonStyle(.borderedProminent)
            .frame(maxWidth: .infinity)
        }
    }

    private func animationDemo(_ name: String, animation: Animation) -> some View {
        VStack(spacing: .arcSpacingXSmall) {
            Circle()
                .fill(Color.accentColor)
                .frame(width: 20, height: 20)
                .offset(y: isAnimating ? -10 : 10)
                .animation(animation, value: isAnimating)

            Text(name)
                .font(.caption2)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 50)
    }
}

// MARK: - Touch Target Tokens View

private struct TouchTargetTokensView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: .arcSpacingSmall) {
            Text("Minimum touch target sizes (Apple HIG):")
                .font(.caption)
                .foregroundStyle(.secondary)

            touchTargetRow("Minimum", value: .arcTouchTargetMinimum, note: "44pt")
            touchTargetRow("Recommended", value: .arcTouchTargetRecommended, note: "44pt")
            touchTargetRow("watchOS", value: .arcTouchTargetWatchOS, note: "38pt")
            touchTargetRow("visionOS", value: .arcTouchTargetVisionOS, note: "60pt")
        }
    }

    private func touchTargetRow(_ name: String, value: CGFloat, note: String) -> some View {
        HStack {
            Text(".arcTouchTarget\(name)")
                .font(.caption2.monospaced())
                .foregroundStyle(.secondary)

            Spacer()

            Text(note)
                .font(.caption2)
                .foregroundStyle(.tertiary)

            RoundedRectangle(cornerRadius: 4)
                .fill(Color.accentColor.opacity(0.3))
                .frame(width: value / 2, height: value / 2)
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color.accentColor, lineWidth: 1)
                )
        }
    }
}

// MARK: - Accessibility Tokens View

private struct AccessibilityTokensView: View {
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    var body: some View {
        VStack(alignment: .leading, spacing: .arcSpacingSmall) {
            // Reduce Motion Status
            HStack {
                Image(systemName: reduceMotion ? "figure.roll" : "figure.walk")
                    .foregroundStyle(reduceMotion ? .orange : .green)
                Text("Reduce Motion: \(reduceMotion ? "ON" : "OFF")")
                    .font(.caption)
            }

            Divider().padding(.vertical, .arcSpacingXSmall)

            // Contrast Calculator
            Text("WCAG Contrast Validation:")
                .font(.caption)
                .foregroundStyle(.secondary)

            contrastRow("Burgundy/White", fg: .arcBrandBurgundy, bg: .white)
            contrastRow("Gold/Black", fg: .arcBrandGold, bg: .black)
            contrastRow("Black/White", fg: .arcBrandBlack, bg: .white)

            NavigationLink {
                ARCColorsPreview()
                    .navigationTitle("Color Tokens")
            } label: {
                Label("View All Colors", systemImage: "arrow.right")
                    .font(.callout)
            }
            .padding(.top, .arcSpacingSmall)
        }
    }

    private func contrastRow(_ name: String, fg: Color, bg: Color) -> some View {
        let result = ARCContrastCalculator.validate(foreground: fg, background: bg)

        return HStack {
            Text(name)
                .font(.caption2)
                .foregroundStyle(.secondary)

            Spacer()

            Text(result.ratioDescription)
                .font(.caption2.monospaced())
                .foregroundStyle(result.meetsAA ? .green : .red)

            Image(systemName: result.meetsAA ? "checkmark.circle.fill" : "xmark.circle.fill")
                .foregroundStyle(result.meetsAA ? .green : .red)
                .font(.caption)
        }
    }
}

#Preview {
    NavigationStack {
        TokenCatalogScreen()
    }
}
