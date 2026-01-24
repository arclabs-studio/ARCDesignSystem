//
//  ARCBrandAssetsPreview.swift
//  ARCDesignSystem
//
//  Created by ARC Labs on 1/24/26.
//

import SwiftUI

/// A visual showcase of ARC Labs Studio brand assets.
///
/// `ARCBrandAssetsPreview` provides a comprehensive gallery view displaying
/// all available brand assets including icons, symbols, logos, wordmarks,
/// badges, banners, and the custom Radley Sans typography.
///
/// ## Overview
///
/// The preview organizes assets into main sections:
/// - **Brand Colors**: Official brand color palette
/// - **Typography**: Radley Sans font at various sizes
/// - **Icons**: Solid and outlined icon variants
/// - **Symbols**: Brand symbols with color variants
/// - **Logos**: All logo layouts (horizontal, stacked, boxed)
/// - **Wordmarks**: Text-based brand marks
/// - **Badges & Banners**: Additional brand assets
///
/// ## Usage
///
/// Use this view in Xcode previews or as part of a brand guidelines app:
///
/// ```swift
/// #Preview {
///     ARCBrandAssetsPreview()
/// }
/// ```
///
/// ## Note
///
/// Call ``ARCBrandFont/registerFonts()`` in your app's init to ensure
/// the Radley Sans font is available.
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
public struct ARCBrandAssetsPreview: View {
    /// Creates a new ARC Brand Assets preview.
    public init() {
        ARCBrandFont.registerFonts()
    }

    public var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: .arcSpacingXLarge) {
                // MARK: - Brand Colors

                ARCBrandColorsSection()

                // MARK: - Typography

                ARCTypographySection()

                // MARK: - Icons

                ARCAssetGridSection(
                    title: "Icons",
                    assets: ARCBrandAsset.icons
                )

                // MARK: - Symbols

                ARCAssetGridSection(
                    title: "Symbols",
                    assets: ARCBrandAsset.symbols
                )

                // MARK: - Logos

                ARCAssetListSection(
                    title: "Logos",
                    assets: ARCBrandAsset.logos
                )

                // MARK: - Wordmarks

                ARCAssetListSection(
                    title: "Wordmarks",
                    assets: ARCBrandAsset.wordmarks
                )

                // MARK: - Badges

                ARCAssetGridSection(
                    title: "Badges",
                    assets: ARCBrandAsset.badges
                )

                // MARK: - Banners

                ARCAssetListSection(
                    title: "Banners",
                    assets: ARCBrandAsset.banners
                )
            }
            .padding(.arcPaddingSection)
        }
        .background(Color.arcBackgroundPrimary)
    }
}

// MARK: - Brand Colors Section

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
private struct ARCBrandColorsSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: .arcSpacingMedium) {
            Text("Brand Colors")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.bottom, .arcSpacingSmall)

            HStack(spacing: .arcSpacingMedium) {
                ARCBrandColorSwatch(name: "Burgundy", color: .arcBrandBurgundy, hex: "#541311")
                ARCBrandColorSwatch(name: "Gold", color: .arcBrandGold, hex: "#FFB42E")
                ARCBrandColorSwatch(name: "Black", color: .arcBrandBlack, hex: "#000000")
            }
        }
        .padding(.arcPaddingCard)
        .background(Color.arcBackgroundSecondary)
        .clipShape(RoundedRectangle(cornerRadius: .arcCornerRadiusMedium))
    }
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
private struct ARCBrandColorSwatch: View {
    let name: String
    let color: Color
    let hex: String

    var body: some View {
        VStack(spacing: .arcSpacingSmall) {
            RoundedRectangle(cornerRadius: .arcCornerRadiusSmall)
                .fill(color)
                .frame(width: 60, height: 60)
                .overlay(
                    RoundedRectangle(cornerRadius: .arcCornerRadiusSmall)
                        .stroke(Color.primary.opacity(0.1), lineWidth: 0.5)
                )

            Text(name)
                .font(.caption)
                .fontWeight(.medium)

            Text(hex)
                .font(.caption2)
                .foregroundStyle(.secondary)
                .monospaced()
        }
    }
}

// MARK: - Typography Section

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
private struct ARCTypographySection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: .arcSpacingMedium) {
            Text("Typography — Radley Sans")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.bottom, .arcSpacingSmall)

            VStack(alignment: .leading, spacing: .arcSpacingMedium) {
                ARCTypographyRow(style: .largeTitle, name: "Large Title")
                ARCTypographyRow(style: .title, name: "Title")
                ARCTypographyRow(style: .title2, name: "Title 2")
                ARCTypographyRow(style: .title3, name: "Title 3")
                ARCTypographyRow(style: .headline, name: "Headline")
                ARCTypographyRow(style: .body, name: "Body")
                ARCTypographyRow(style: .callout, name: "Callout")
                ARCTypographyRow(style: .subheadline, name: "Subheadline")
                ARCTypographyRow(style: .footnote, name: "Footnote")
                ARCTypographyRow(style: .caption, name: "Caption")
                ARCTypographyRow(style: .caption2, name: "Caption 2")
            }
        }
        .padding(.arcPaddingCard)
        .background(Color.arcBackgroundSecondary)
        .clipShape(RoundedRectangle(cornerRadius: .arcCornerRadiusMedium))
    }
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
private struct ARCTypographyRow: View {
    let style: Font.TextStyle
    let name: String

    var body: some View {
        HStack {
            Text("ARC Labs Studio")
                .font(.arcBrandFont(style))

            Spacer()

            Text(name)
                .font(.caption)
                .foregroundStyle(.secondary)
        }
    }
}

// MARK: - Asset Grid Section

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
private struct ARCAssetGridSection: View {
    let title: String
    let assets: [ARCBrandAsset]

    var body: some View {
        VStack(alignment: .leading, spacing: .arcSpacingMedium) {
            Text(title)
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.bottom, .arcSpacingSmall)

            LazyVGrid(
                columns: [
                    GridItem(.adaptive(minimum: 100, maximum: 150), spacing: .arcSpacingMedium)
                ],
                spacing: .arcSpacingMedium
            ) {
                ForEach(assets, id: \.rawValue) { asset in
                    ForEach(asset.availableVariants, id: \.rawValue) { variant in
                        ARCAssetGridItem(asset: asset, variant: variant)
                    }
                }
            }
        }
        .padding(.arcPaddingCard)
        .background(Color.arcBackgroundSecondary)
        .clipShape(RoundedRectangle(cornerRadius: .arcCornerRadiusMedium))
    }
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
private struct ARCAssetGridItem: View {
    let asset: ARCBrandAsset
    let variant: ARCBrandColorVariant

    var body: some View {
        VStack(spacing: .arcSpacingSmall) {
            asset.image(variant: variant)
                .resizable()
                .scaledToFit()
                .frame(width: 64, height: 64)

            Text(asset.description)
                .font(.caption2)
                .lineLimit(1)
                .minimumScaleFactor(0.8)

            Text(variant.rawValue)
                .font(.caption2)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding(.arcSpacingSmall)
        .background(Color.arcBackgroundTertiary)
        .clipShape(RoundedRectangle(cornerRadius: .arcCornerRadiusSmall))
    }
}

// MARK: - Asset List Section

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
private struct ARCAssetListSection: View {
    let title: String
    let assets: [ARCBrandAsset]

    var body: some View {
        VStack(alignment: .leading, spacing: .arcSpacingMedium) {
            Text(title)
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.bottom, .arcSpacingSmall)

            ForEach(assets, id: \.rawValue) { asset in
                ForEach(asset.availableVariants, id: \.rawValue) { variant in
                    ARCAssetListItem(asset: asset, variant: variant)
                }
            }
        }
        .padding(.arcPaddingCard)
        .background(Color.arcBackgroundSecondary)
        .clipShape(RoundedRectangle(cornerRadius: .arcCornerRadiusMedium))
    }
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
private struct ARCAssetListItem: View {
    let asset: ARCBrandAsset
    let variant: ARCBrandColorVariant

    var body: some View {
        VStack(alignment: .leading, spacing: .arcSpacingSmall) {
            HStack {
                Text(asset.description)
                    .font(.subheadline)
                    .fontWeight(.medium)

                Text("(\(variant.rawValue))")
                    .font(.caption)
                    .foregroundStyle(.secondary)

                Spacer()
            }

            asset.image(variant: variant)
                .resizable()
                .scaledToFit()
                .frame(maxHeight: 80)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.arcSpacingMedium)
        .background(Color.arcBackgroundTertiary)
        .clipShape(RoundedRectangle(cornerRadius: .arcCornerRadiusSmall))
    }
}

// MARK: - Preview

#Preview("ARC Brand Assets (Light)") {
    ARCBrandAssetsPreview()
        .preferredColorScheme(.light)
}

#Preview("ARC Brand Assets (Dark)") {
    ARCBrandAssetsPreview()
        .preferredColorScheme(.dark)
}
