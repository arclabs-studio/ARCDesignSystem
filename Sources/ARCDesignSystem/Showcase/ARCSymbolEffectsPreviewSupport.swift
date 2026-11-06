//
//  ARCSymbolEffectsPreviewSupport.swift
//  ARCDesignSystem
//
//  Created by ARC Labs on 12/18/25.
//

import SwiftUI

// MARK: - Supporting Views

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *) struct ARCEffectSectionHeader: View {
    let title: String
    let subtitle: String

    var body: some View {
        VStack(spacing: .arcSpacingSmall) {
            Text(title)
                .font(.title)
                .foregroundStyle(.primary)

            Text(subtitle)
                .font(.callout)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, .arcSpacingMedium)
    }
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *) struct ARCEffectCard<Content: View>: View {
    let title: String
    let description: String
    let systemImage: String
    @ViewBuilder let content: () -> Content

    var body: some View {
        VStack(spacing: .arcSpacingMedium) {
            // Header
            HStack {
                Image(systemName: systemImage)
                    .foregroundStyle(ARCColorHelper.accent)

                VStack(alignment: .leading, spacing: 2) {
                    Text(title)
                        .font(.headline)
                        .foregroundStyle(.primary)

                    Text(description)
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }

                Spacer()
            }

            // Demo area
            VStack(spacing: .arcSpacingMedium) {
                content()
            }
            .frame(maxWidth: .infinity)
            .padding(.arcPaddingCard)
            .background(ARCColorHelper.backgroundSecondary)
            .clipShape(RoundedRectangle(cornerRadius: .arcCornerRadiusSmall))
        }
        .padding(.arcPaddingCard)
        .background(ARCColorHelper.backgroundTertiary)
        .clipShape(RoundedRectangle(cornerRadius: .arcCornerRadiusMedium))
    }
}
