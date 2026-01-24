//
//  BrandAssetsScreen.swift
//  ARCDesignSystemDemo
//
//  Created by ARC Labs Studio on 1/24/26.
//

import ARCDesignSystem
import SwiftUI

/// A showcase of all ARC Labs Studio brand assets.
///
/// This screen displays the official brand assets including logos,
/// icons, symbols, wordmarks, badges, banners, and the custom
/// Radley Sans typography.
struct BrandAssetsScreen: View {
    var body: some View {
        ScrollView {
            VStack(spacing: .arcSpacingXLarge) {
                // Typography
                assetSection(title: "Typography", icon: "textformat") {
                    TypographyShowcase()
                }

                // Icons
                assetSection(title: "Icons", icon: "app") {
                    AssetGridView(assets: ARCBrandAsset.icons)
                }

                // Symbols
                assetSection(title: "Symbols", icon: "star") {
                    AssetGridView(assets: ARCBrandAsset.symbols)
                }

                // Logos
                assetSection(title: "Logos", icon: "rectangle.stack") {
                    LogosShowcase()
                }

                // Wordmarks
                assetSection(title: "Wordmarks", icon: "character") {
                    AssetListView(assets: ARCBrandAsset.wordmarks)
                }

                // Badges
                assetSection(title: "Badges", icon: "seal") {
                    AssetGridView(assets: ARCBrandAsset.badges)
                }

                // Banners
                assetSection(title: "Banners", icon: "flag") {
                    AssetListView(assets: ARCBrandAsset.banners)
                }
            }
            .padding(.arcPaddingSection)
        }
        .background(Color.arcBackgroundPrimary)
        .navigationTitle("Brand Assets")
        #if os(iOS)
            .navigationBarTitleDisplayMode(.inline)
        #endif
    }

    @ViewBuilder
    private func assetSection(
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

// MARK: - Typography Showcase

private struct TypographyShowcase: View {
    var body: some View {
        VStack(alignment: .leading, spacing: .arcSpacingMedium) {
            Text("Radley Sans — Brand Font")
                .font(.caption)
                .foregroundStyle(.secondary)

            VStack(alignment: .leading, spacing: .arcSpacingSmall) {
                typographyRow(.largeTitle, name: "Large Title")
                typographyRow(.title, name: "Title")
                typographyRow(.title2, name: "Title 2")
                typographyRow(.title3, name: "Title 3")
                typographyRow(.headline, name: "Headline")
                typographyRow(.body, name: "Body")
                typographyRow(.callout, name: "Callout")
                typographyRow(.subheadline, name: "Subheadline")
                typographyRow(.footnote, name: "Footnote")
                typographyRow(.caption, name: "Caption")
            }
        }
    }

    private func typographyRow(_ style: Font.TextStyle, name: String) -> some View {
        HStack {
            Text("ARC Labs Studio")
                .font(.arcBrandFont(style))
                .lineLimit(1)

            Spacer()

            Text(name)
                .font(.caption2)
                .foregroundStyle(.tertiary)
        }
    }
}

// MARK: - Asset Grid View

private struct AssetGridView: View {
    let assets: [ARCBrandAsset]

    var body: some View {
        LazyVGrid(
            columns: [
                GridItem(.adaptive(minimum: 100, maximum: 150), spacing: .arcSpacingMedium)
            ],
            spacing: .arcSpacingMedium
        ) {
            ForEach(assets, id: \.rawValue) { asset in
                ForEach(asset.availableVariants, id: \.rawValue) { variant in
                    AssetGridItem(asset: asset, variant: variant)
                }
            }
        }
    }
}

private struct AssetGridItem: View {
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

// MARK: - Logos Showcase

private struct LogosShowcase: View {
    var body: some View {
        VStack(spacing: .arcSpacingMedium) {
            Text("Tap to see variant details")
                .font(.caption)
                .foregroundStyle(.secondary)

            ForEach(ARCBrandAsset.logos, id: \.rawValue) { asset in
                LogoRow(asset: asset)
            }
        }
    }
}

private struct LogoRow: View {
    let asset: ARCBrandAsset
    @State private var selectedVariant: ARCBrandColorVariant = .burgundy

    var body: some View {
        VStack(alignment: .leading, spacing: .arcSpacingSmall) {
            HStack {
                Text(asset.description)
                    .font(.subheadline)
                    .fontWeight(.medium)

                Spacer()

                Picker("Variant", selection: $selectedVariant) {
                    ForEach(asset.availableVariants, id: \.rawValue) { variant in
                        Text(variant.rawValue).tag(variant)
                    }
                }
                .pickerStyle(.segmented)
                .frame(width: 160)
            }

            asset.image(variant: selectedVariant)
                .resizable()
                .scaledToFit()
                .frame(maxHeight: 60)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.arcSpacingMedium)
        .background(Color.arcBackgroundTertiary)
        .clipShape(RoundedRectangle(cornerRadius: .arcCornerRadiusSmall))
    }
}

// MARK: - Asset List View

private struct AssetListView: View {
    let assets: [ARCBrandAsset]

    var body: some View {
        VStack(spacing: .arcSpacingMedium) {
            ForEach(assets, id: \.rawValue) { asset in
                ForEach(asset.availableVariants, id: \.rawValue) { variant in
                    AssetListItem(asset: asset, variant: variant)
                }
            }
        }
    }
}

private struct AssetListItem: View {
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

#Preview {
    NavigationStack {
        BrandAssetsScreen()
    }
}
