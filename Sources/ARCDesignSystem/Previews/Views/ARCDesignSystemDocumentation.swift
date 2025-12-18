//
//  ARCDesignSystemDocumentation.swift
//  ARCDesignSystem
//
//  Created by ARC Labs on 4/11/25.
//

import SwiftUI

/// A comprehensive catalog-style documentation view for the ARC Design System.
///
/// `ARCDesignSystemDocumentation` provides a detailed, handoff-ready catalog
/// of all design tokens with their names, values, and live visual examples.
/// This view is specifically formatted for design handoffs, developer onboarding,
/// and maintaining a single source of truth for your design system.
///
/// ## Overview
///
/// The documentation is organized into five main sections:
/// - **Colors**: All semantic colors with swatches and names
/// - **Typography**: Font samples with the quick brown fox pangram
/// - **Spacing**: Visual bars showing actual spacing values
/// - **Corner Radius**: Rounded rectangles demonstrating each radius
/// - **Animations**: Live animated examples of timing presets
///
/// Each token is displayed with:
/// - Its programmatic name (e.g., `arcFontTitleLarge`)
/// - Its computed value at current Dynamic Type setting
/// - A live visual preview
///
/// ## Usage
///
/// Use this view for design documentation and handoffs:
///
/// ```swift
/// #Preview {
///     ARCDesignSystemDocumentation()
/// }
/// ```
///
/// Integrate it into a style guide section of your app:
///
/// ```swift
/// NavigationLink("Design System Docs") {
///     ARCDesignSystemDocumentation()
/// }
/// ```
///
/// ## Design Handoff
///
/// This view serves as a living style guide that stays synchronized with
/// your code. Share it with designers and stakeholders to:
/// - Verify design implementation accuracy
/// - Document spacing and typography decisions
/// - Demonstrate responsive behavior with Dynamic Type
/// - Maintain design-development alignment
///
/// ## Platform Compatibility
///
/// Available on iOS 15.0+ and macOS 12.0+. All values are calculated
/// dynamically based on the current platform and accessibility settings.
///
/// - Note: For a simpler overview, see ``ARCDesignSystemPreview``.
///   For interactive testing, see ``ARCDesignSystemInteractivePreview``.
@available(iOS 15.0, *)
public struct ARCDesignSystemDocumentation: View {
    /// Creates a new ARC Design System documentation catalog.
    public init() {}

    public var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: .arcSpacingXLarge) {
                // =====================================================
                // MARK: - Colors

                // =====================================================
                ARCDocSection(title: "🎨 Colors") {
                    ARCDocColorRow(name: "Background Primary", color: ARCColorHelper.backgroundPrimary)
                    ARCDocColorRow(name: "Background Secondary", color: ARCColorHelper.backgroundSecondary)
                    ARCDocColorRow(name: "Background Tertiary", color: ARCColorHelper.backgroundTertiary)
                    ARCDocColorRow(name: "Text Primary", color: ARCColorHelper.textPrimary)
                    ARCDocColorRow(name: "Text Secondary", color: ARCColorHelper.textSecondary)
                    ARCDocColorRow(name: "Highlight", color: ARCColorHelper.highlight)
                    ARCDocColorRow(name: "Shadow Medium", color: ARCColorHelper.shadowMedium)
                }

                // =====================================================
                // MARK: - Typography

                // =====================================================
                ARCDocSection(title: "🔠 Typography") {
                    ARCDocFontRow(name: "arcFontTitleLarge", font: .arcFontTitleLarge)
                    ARCDocFontRow(name: "arcFontTitle1", font: .arcFontTitle1)
                    ARCDocFontRow(name: "arcFontTitle2", font: .arcFontTitle2)
                    ARCDocFontRow(name: "arcFontTitle3", font: .arcFontTitle3)
                    ARCDocFontRow(name: "arcFontHeadline", font: .arcFontHeadline)
                    ARCDocFontRow(name: "arcFontSubheadline", font: .arcFontSubheadline)
                    ARCDocFontRow(name: "arcFontBody", font: .arcFontBody)
                    ARCDocFontRow(name: "arcFontCallout", font: .arcFontCallout)
                    ARCDocFontRow(name: "arcFontFootnote", font: .arcFontFootnote)
                    ARCDocFontRow(name: "arcFontCaption1", font: .arcFontCaption1)
                    ARCDocFontRow(name: "arcFontCaption2", font: .arcFontCaption2)
                }

                // =====================================================
                // MARK: - Spacing

                // =====================================================
                ARCDocSection(title: "📏 Spacing") {
                    ARCDocSpacingRow(name: "arcSpacingXSmall", value: .arcSpacingXSmall)
                    ARCDocSpacingRow(name: "arcSpacingSmall", value: .arcSpacingSmall)
                    ARCDocSpacingRow(name: "arcSpacingMedium", value: .arcSpacingMedium)
                    ARCDocSpacingRow(name: "arcSpacingLarge", value: .arcSpacingLarge)
                    ARCDocSpacingRow(name: "arcSpacingXLarge", value: .arcSpacingXLarge)
                    ARCDocSpacingRow(name: "arcSpacingXXLarge", value: .arcSpacingXXLarge)
                }

                // =====================================================
                // MARK: - Corner Radius

                // =====================================================
                ARCDocSection(title: "🟢 Corner Radius") {
                    ARCDocRadiusRow(name: "arcCornerRadiusSmall", value: .arcCornerRadiusSmall)
                    ARCDocRadiusRow(name: "arcCornerRadiusMedium", value: .arcCornerRadiusMedium)
                    ARCDocRadiusRow(name: "arcCornerRadiusLarge", value: .arcCornerRadiusLarge)
                    ARCDocRadiusRow(name: "arcCornerRadiusXLarge", value: .arcCornerRadiusXLarge)
                }

                // =====================================================
                // MARK: - Animations

                // =====================================================
                ARCDocSection(title: "⚡ Animations") {
                    ARCDocAnimationRow(name: "arcAnimationBase", animation: .arcAnimationBase)
                    ARCDocAnimationRow(name: "arcAnimationSmooth", animation: .arcAnimationSmooth)
                    ARCDocAnimationRow(name: "arcAnimationQuick", animation: .arcAnimationQuick)
                }

                // =====================================================
                // MARK: - Symbol Effects

                // =====================================================
                if #available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *) {
                    ARCDocSection(title: "🎬 Symbol Effects") {
                        ARCDocSymbolEffectRow(
                            name: ".inProgress",
                            description: "Continuous breathing for active states",
                            symbolName: "record.circle.fill",
                            effect: .inProgress
                        )
                        ARCDocSymbolEffectRow(
                            name: ".syncing",
                            description: "Rotating for sync/loading",
                            symbolName: "arrow.triangle.2.circlepath",
                            effect: .syncing
                        )
                        ARCDocSymbolEffectRow(
                            name: ".searching",
                            description: "Variable color for discovery",
                            symbolName: "wifi",
                            effect: .searching
                        )
                        ARCDocSymbolEffectRow(
                            name: ".success",
                            description: "Bounce for confirmation",
                            symbolName: "checkmark.circle.fill",
                            effect: .success
                        )
                        ARCDocSymbolEffectRow(
                            name: ".error",
                            description: "Wiggle for errors",
                            symbolName: "xmark.circle.fill",
                            effect: .error
                        )
                        ARCDocSymbolEffectRow(
                            name: ".addItem",
                            description: "Double bounce for additions",
                            symbolName: "cart.badge.plus",
                            effect: .addItem
                        )
                    }
                }
            }
            .padding(.arcPaddingSection)
        }
        .background(ARCColorHelper.backgroundPrimary)
    }
}

//
// =====================================================
// MARK: - Documentation Components

// =====================================================
//

@available(iOS 17.0, macOS 12.0, *)
private struct ARCDocSection<Content: View>: View {
    let title: String
    let content: Content

    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }

    var body: some View {
        VStack(alignment: .leading, spacing: .arcSpacingMedium) {
            Text(title)
                .font(.arcFontTitle2)
                .foregroundStyle(ARCColorHelper.textPrimary)

            VStack(alignment: .leading, spacing: .arcSpacingSmall) {
                content
            }
            .padding(.arcPaddingCard)
            .background(ARCColorHelper.backgroundSecondary)
            .clipShape(RoundedRectangle(cornerRadius: .arcCornerRadiusMedium))
        }
    }
}

@available(iOS 17.0, macOS 12.0, *)
private struct ARCDocColorRow: View {
    let name: String
    let color: Color

    var body: some View {
        HStack(spacing: .arcSpacingMedium) {
            RoundedRectangle(cornerRadius: .arcCornerRadiusSmall)
                .fill(color)
                .frame(width: 60, height: 40)
                .overlay(
                    RoundedRectangle(cornerRadius: .arcCornerRadiusSmall)
                        .stroke(ARCColorHelper.shadowMedium.opacity(0.2), lineWidth: 0.5)
                )

            VStack(alignment: .leading, spacing: 2) {
                Text(name)
                    .font(.arcFontCallout)
                    .foregroundStyle(ARCColorHelper.textPrimary)
                Text("Preview")
                    .font(.arcFontFootnote)
                    .foregroundStyle(ARCColorHelper.textSecondary)
            }
            Spacer()
        }
    }
}

@available(iOS 17.0, macOS 12.0, *)
private struct ARCDocFontRow: View {
    let name: String
    let font: Font

    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(name)
                .font(.arcFontFootnote)
                .foregroundStyle(ARCColorHelper.textSecondary)
            Text("The quick brown fox jumps over the lazy dog.")
                .font(font)
                .foregroundStyle(ARCColorHelper.textPrimary)
        }
    }
}

@available(iOS 17.0, macOS 12.0, *)
private struct ARCDocSpacingRow: View {
    let name: String
    let value: CGFloat

    var body: some View {
        VStack(alignment: .leading, spacing: .arcSpacingSmall) {
            Text("\(name) — \(Int(value))pt")
                .font(.arcFontFootnote)
                .foregroundStyle(ARCColorHelper.textSecondary)
            Rectangle()
                .fill(ARCColorHelper.highlight.opacity(0.8))
                .frame(height: 6)
                .frame(width: value)
                .clipShape(Capsule())
        }
    }
}

@available(iOS 17.0, macOS 12.0, *)
private struct ARCDocRadiusRow: View {
    let name: String
    let value: CGFloat

    var body: some View {
        VStack(alignment: .leading, spacing: .arcSpacingSmall) {
            Text("\(name) — \(Int(value))pt")
                .font(.arcFontFootnote)
                .foregroundStyle(ARCColorHelper.textSecondary)
            RoundedRectangle(cornerRadius: value)
                .fill(ARCColorHelper.highlight.opacity(0.8))
                .frame(width: 100, height: 40)
        }
    }
}

@available(iOS 17.0, macOS 12.0, *)
private struct ARCDocAnimationRow: View {
    let name: String
    let animation: Animation

    @State private var isAnimating = false

    var body: some View {
        HStack(spacing: .arcSpacingMedium) {
            Circle()
                .fill(ARCColorHelper.highlight)
                .frame(width: 24, height: 24)
                .offset(x: isAnimating ? 80 : 0)
                .animation(animation.repeatForever(autoreverses: true), value: isAnimating)
                .onAppear { isAnimating = true }

            Text(name)
                .font(.arcFontFootnote)
                .foregroundStyle(ARCColorHelper.textSecondary)
        }
        .frame(height: 40)
    }
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
private struct ARCDocSymbolEffectRow: View {
    let name: String
    let description: String
    let symbolName: String
    let effect: ARCSymbolEffect

    @State private var isActive = true
    @State private var discreteTrigger = 0

    var body: some View {
        HStack(spacing: .arcSpacingMedium) {
            symbolView
                .frame(width: 32, height: 32)

            VStack(alignment: .leading, spacing: 2) {
                Text(name)
                    .font(.arcFontCallout)
                    .foregroundStyle(ARCColorHelper.textPrimary)

                Text(description)
                    .font(.arcFontFootnote)
                    .foregroundStyle(ARCColorHelper.textSecondary)
            }

            Spacer()

            controlView
        }
        .frame(minHeight: 44)
    }

    @ViewBuilder private var symbolView: some View {
        if effect.isIndefinite {
            Image(systemName: symbolName)
                .font(.system(size: 24))
                .foregroundStyle(ARCColorHelper.highlight)
                .arcSymbolEffect(effect, isActive: isActive)
        } else {
            Image(systemName: symbolName)
                .font(.system(size: 24))
                .foregroundStyle(ARCColorHelper.highlight)
                .arcSymbolEffect(effect, value: discreteTrigger)
        }
    }

    @ViewBuilder private var controlView: some View {
        if effect.isIndefinite {
            Toggle("", isOn: $isActive)
                .labelsHidden()
                .toggleStyle(.switch)
        } else {
            Button("Tap") {
                discreteTrigger += 1
            }
            .buttonStyle(.bordered)
            .font(.arcFontFootnote)
        }
    }
}

//
// =====================================================
// MARK: - Preview

// =====================================================
//

@available(iOS 17.0, macOS 12.0, *)
#Preview("ARC Design System Documentation (Dark)") {
    ARCDesignSystemDocumentation()
        .preferredColorScheme(.dark)
}

@available(iOS 17.0, macOS 12.0, *)
#Preview("ARC Design System Documentation (Light)") {
    ARCDesignSystemDocumentation()
        .preferredColorScheme(.light)
}
