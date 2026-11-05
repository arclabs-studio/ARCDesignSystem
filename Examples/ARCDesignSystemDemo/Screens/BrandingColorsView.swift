//
//  BrandingColorsView.swift
//  ARCDesignSystemDemo
//
//  Created by ARC Labs Studio on 12/19/25.
//

import ARCDesignSystem
import SwiftUI

// MARK: - Branding Colors View

struct BrandingColorsView: View {
    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        VStack(spacing: .arcSpacingMedium) {
            Text("ARC Labs Studio official brand colors")
                .font(.caption)
                .foregroundStyle(.secondary)

            HStack(spacing: .arcSpacingMedium) {
                brandColorDemo("Burgundy",
                               color: .arcBrandBurgundy,
                               lightHex: "#541311",
                               darkHex: "#B23850")
                brandColorDemo("Gold",
                               color: .arcBrandGold,
                               lightHex: "#996B00",
                               darkHex: "#FFB42E")
                brandColorDemo("Black",
                               color: .arcBrandBlack,
                               lightHex: "#000000",
                               darkHex: "#000000")
            }
        }
    }

    private func brandColorDemo(_ name: String,
                                color: Color,
                                lightHex: String,
                                darkHex: String) -> some View {
        let currentHex = colorScheme == .dark ? darkHex : lightHex

        return VStack(spacing: .arcSpacingXSmall) {
            RoundedRectangle(cornerRadius: .arcCornerRadiusMedium)
                .fill(color)
                .frame(height: 60)
                .overlay(RoundedRectangle(cornerRadius: .arcCornerRadiusMedium)
                    .stroke(Color.arcSeparator, lineWidth: 0.5))

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

#Preview {
    BrandingColorsView()
        .padding()
}
