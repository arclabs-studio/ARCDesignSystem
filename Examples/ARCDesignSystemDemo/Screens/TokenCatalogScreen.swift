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

    private func tokenSection(title: String,
                              icon: String,
                              @ViewBuilder content: () -> some View) -> some View {
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

#Preview {
    NavigationStack {
        TokenCatalogScreen()
    }
}
