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
/// all available design tokens including spacing, colors, and corner radii.
/// This view is intended for design review, documentation, and visual
/// consistency verification across platforms.
///
/// ## Overview
///
/// The preview organizes tokens into main sections:
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
/// This view works on iOS 17.0+ and macOS 14.0+, adapting its presentation
/// to each platform's conventions using ``ARCColorHelper`` for cross-platform
/// color consistency.
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
public struct ARCDesignSystemPreview: View {
    /// Creates a new ARC Design System preview.
    public init() {}

    public var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: .arcSpacingXLarge) {
                // MARK: - Spacing Demonstration

                VStack(alignment: .leading, spacing: .arcSpacingMedium) {
                    Text("Spacing Scale")
                        .font(.title2)
                        .fontWeight(.semibold)
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

                // MARK: - Color Palette

                VStack(alignment: .leading, spacing: .arcSpacingMedium) {
                    Text("Color Palette")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.bottom, .arcSpacingSmall)

                    ARCColorSwatch(name: "Background Primary", color: ARCColorHelper.backgroundPrimary)
                    ARCColorSwatch(name: "Background Secondary", color: ARCColorHelper.backgroundSecondary)
                    ARCColorSwatch(name: "Background Tertiary", color: ARCColorHelper.backgroundTertiary)
                    ARCColorSwatch(name: "Text Primary", color: ARCColorHelper.textPrimary)
                    ARCColorSwatch(name: "Text Secondary", color: ARCColorHelper.textSecondary)
                    ARCColorSwatch(name: "Accent", color: ARCColorHelper.accent)
                }
                .padding(.arcPaddingCard)
                .background(ARCColorHelper.backgroundSecondary)
                .clipShape(RoundedRectangle(cornerRadius: .arcCornerRadiusMedium))

                // MARK: - Corner Radius Demonstration

                VStack(alignment: .leading, spacing: .arcSpacingMedium) {
                    Text("Corner Radius")
                        .font(.title2)
                        .fontWeight(.semibold)
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

// MARK: - Components

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
private struct ARCSpacingDemoRow: View {
    let label: String
    let value: CGFloat

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("\(label) — \(Int(value))pt")
                .font(.footnote)
                .foregroundStyle(.secondary)

            Rectangle()
                .fill(ARCColorHelper.accent.opacity(0.8))
                .frame(height: 6)
                .frame(width: value)
                .clipShape(Capsule())
        }
    }
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
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
                .font(.callout)
                .foregroundStyle(.primary)

            Spacer()
        }
    }
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
private struct ARCRadiusDemo: View {
    let radius: CGFloat
    let label: String

    var body: some View {
        VStack(alignment: .leading, spacing: .arcSpacingSmall) {
            Text("\(label) — \(Int(radius))pt")
                .font(.footnote)
                .foregroundStyle(.secondary)
            RoundedRectangle(cornerRadius: radius)
                .fill(ARCColorHelper.accent.opacity(0.8))
                .frame(width: 100, height: 40)
        }
    }
}

// MARK: - Preview

#Preview("ARC Design System (Dark)") {
    ARCDesignSystemPreview()
        .preferredColorScheme(.dark)
}

#Preview("ARC Design System (Light)") {
    ARCDesignSystemPreview()
        .preferredColorScheme(.light)
}
