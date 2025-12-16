//
//  ARCDesignSystemPreview.swift
//  ARCDesignSystem
//
//  Created by ARC Labs on 4/11/25.
//

import SwiftUI

/// A visual showcase of ARC Design System tokens.
///
/// `ARCDesignSystemPreview` provides a comprehensive gallery view displaying
/// all available design tokens including typography, spacing, colors, and
/// corner radii. This view is intended for design review, documentation,
/// and visual consistency verification across platforms.
///
/// ## Overview
///
/// The preview organizes tokens into four main sections:
/// - **Typography**: All font styles from large titles to small labels
/// - **Spacing**: Visual representation of spacing scale with measurements
/// - **Color Palette**: Swatches of all semantic colors
/// - **Corner Radius**: Examples of all corner radius values
///
/// ## Usage
///
/// Use this view in Xcode previews or as part of a design documentation app:
///
/// ```swift
/// #Preview {
///     ARCDesignSystemPreview()
/// }
/// ```
///
/// You can also integrate it into a developer tools section of your app:
///
/// ```swift
/// NavigationLink("Design System Preview") {
///     ARCDesignSystemPreview()
/// }
/// ```
///
/// ## Platform Compatibility
///
/// This view works on iOS 15.0+ and macOS 12.0+, adapting its presentation
/// to each platform's conventions using ``ARCColorHelper`` for cross-platform
/// color consistency.
///
/// - Note: For an interactive version with Dynamic Type and color scheme
///   controls, see ``ARCDesignSystemInteractivePreview``.
@available(iOS 15.0, *)
public struct ARCDesignSystemPreview: View {
    /// Creates a new ARC Design System preview.
    public init() {}

    public var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: .arcSpacingXLarge) {
                // =====================================================
                // MARK: - Typography

                // =====================================================
                VStack(alignment: .leading, spacing: .arcSpacingMedium) {
                    Text("Typography")
                        .font(.arcFontTitleMedium)
                        .padding(.bottom, .arcSpacingSmall)

                    Group {
                        Text("Title Large").font(.arcFontTitleLarge)
                        Text("Title Medium").font(.arcFontTitleMedium)
                        Text("Title Small").font(.arcFontTitleSmall)
                        Text("Body Large").font(.arcFontBodyLarge)
                        Text("Body Medium").font(.arcFontBodyMedium)
                        Text("Body Small").font(.arcFontBodySmall)
                        Text("Label Small").font(.arcFontLabelSmall)
                    }
                    .foregroundStyle(ARCColorHelper.textPrimary)
                }
                .padding(.arcPaddingCard)
                .background(ARCColorHelper.backgroundSecondary)
                .clipShape(RoundedRectangle(cornerRadius: .arcCornerRadiusMedium))

                // =====================================================
                // MARK: - Spacing Demonstration

                // =====================================================
                VStack(alignment: .leading, spacing: .arcSpacingMedium) {
                    Text("Spacing Scale")
                        .font(.arcFontTitleMedium)
                        .padding(.bottom, .arcSpacingSmall)

                    ARCSpacingDemoRow(label: "XSmall", value: .arcSpacingXSmall)
                    ARCSpacingDemoRow(label: "Small", value: .arcSpacingSmall)
                    ARCSpacingDemoRow(label: "Medium", value: .arcSpacingMedium)
                    ARCSpacingDemoRow(label: "Large", value: .arcSpacingLarge)
                    ARCSpacingDemoRow(label: "XLarge", value: .arcSpacingXLarge)
                    ARCSpacingDemoRow(label: "XXLarge", value: .arcSpacingXXLarge)
                }
                .padding(.arcPaddingCard)
                .background(ARCColorHelper.backgroundSecondary)
                .clipShape(RoundedRectangle(cornerRadius: .arcCornerRadiusMedium))

                // =====================================================
                // MARK: - Color Palette

                // =====================================================
                VStack(alignment: .leading, spacing: .arcSpacingMedium) {
                    Text("Color Palette")
                        .font(.arcFontTitleMedium)
                        .padding(.bottom, .arcSpacingSmall)

                    ARCColorSwatch(name: "Background Primary", color: ARCColorHelper.backgroundPrimary)
                    ARCColorSwatch(name: "Background Secondary", color: ARCColorHelper.backgroundSecondary)
                    ARCColorSwatch(name: "Background Tertiary", color: ARCColorHelper.backgroundTertiary)
                    ARCColorSwatch(name: "Text Primary", color: ARCColorHelper.textPrimary)
                    ARCColorSwatch(name: "Text Secondary", color: ARCColorHelper.textSecondary)
                    ARCColorSwatch(name: "Highlight", color: ARCColorHelper.highlight)
                }
                .padding(.arcPaddingCard)
                .background(ARCColorHelper.backgroundSecondary)
                .clipShape(RoundedRectangle(cornerRadius: .arcCornerRadiusMedium))

                // =====================================================
                // MARK: - Corner Radius Demonstration

                // =====================================================
                VStack(alignment: .leading, spacing: .arcSpacingMedium) {
                    Text("Corner Radius")
                        .font(.arcFontTitleMedium)
                        .padding(.bottom, .arcSpacingSmall)

                    ARCRadiusDemo(radius: .arcCornerRadiusSmall, label: "Small")
                    ARCRadiusDemo(radius: .arcCornerRadiusMedium, label: "Medium")
                    ARCRadiusDemo(radius: .arcCornerRadiusLarge, label: "Large")
                    ARCRadiusDemo(radius: .arcCornerRadiusXLarge, label: "XLarge")
                }
                .padding(.arcPaddingCard)
                .background(ARCColorHelper.backgroundSecondary)
                .clipShape(RoundedRectangle(cornerRadius: .arcCornerRadiusMedium))
            }
            .padding(.arcPaddingSection)
        }
        .background(ARCColorHelper.backgroundPrimary)
    }
}

// =====================================================
// MARK: - Components

// =====================================================

@available(iOS 15.0, *)
private struct ARCSpacingDemoRow: View {
    let label: String
    let value: CGFloat

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("\(label) — \(Int(value))pt")
                .font(.arcFontBodySmall)
                .foregroundStyle(ARCColorHelper.textSecondary)

            Rectangle()
                .fill(ARCColorHelper.highlight.opacity(0.8))
                .frame(height: 6)
                .frame(width: value)
                .clipShape(Capsule())
        }
    }
}

@available(iOS 15.0, *)
private struct ARCColorSwatch: View {
    let name: String
    let color: Color

    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: .arcCornerRadiusSmall)
                .fill(color)
                .frame(width: 60, height: 40)
                .overlay(
                    RoundedRectangle(cornerRadius: .arcCornerRadiusSmall)
                        .stroke(ARCColorHelper.shadowMedium.opacity(0.3), lineWidth: 0.5)
                )

            Text(name)
                .font(.arcFontBodyMedium)
                .foregroundStyle(ARCColorHelper.textPrimary)

            Spacer()
        }
    }
}

@available(iOS 15.0, *)
private struct ARCRadiusDemo: View {
    let radius: CGFloat
    let label: String

    var body: some View {
        VStack(alignment: .leading, spacing: .arcSpacingSmall) {
            Text("\(label) — \(Int(radius))pt")
                .font(.arcFontBodySmall)
                .foregroundStyle(ARCColorHelper.textSecondary)
            RoundedRectangle(cornerRadius: radius)
                .fill(ARCColorHelper.highlight.opacity(0.8))
                .frame(width: 100, height: 40)
        }
    }
}

// =====================================================
// MARK: - Preview

// =====================================================

#Preview("ARC Design System (Dark)") {
    if #available(iOS 15.0, *) {
        ARCDesignSystemPreview()
            .preferredColorScheme(.dark)
    } else {
        // Fallback on earlier versions
    }
}

#Preview("ARC Design System (Light)") {
    if #available(iOS 15.0, *) {
        ARCDesignSystemPreview()
            .preferredColorScheme(.light)
    } else {
        // Fallback on earlier versions
    }
}
