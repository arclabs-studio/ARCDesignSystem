//
//  SampleCard.swift
//  ARCDesignSystemDemo
//
//  Created by ARC Labs Studio on 12/19/25.
//

import ARCDesignSystem
import SwiftUI

/// A sample card component demonstrating ARC Design System tokens.
///
/// This component showcases how to combine spacing, colors,
/// and corner radius tokens to create a cohesive card design.
struct SampleCard: View {
    let title: String
    let subtitle: String
    let description: String
    let imageName: String

    var body: some View {
        HStack(spacing: .arcSpacingMedium) {
            // Icon
            Image(systemName: imageName)
                .font(.system(size: 32))
                .foregroundStyle(.tint)
                .frame(width: 56, height: 56)
                .background(Color.accentColor.opacity(0.15))
                .clipShape(RoundedRectangle(cornerRadius: .arcCornerRadiusMedium))

            // Content
            VStack(alignment: .leading, spacing: .arcSpacingXSmall) {
                Text(title)
                    .font(.headline)
                    .foregroundStyle(.primary)

                Text(subtitle)
                    .font(.subheadline)
                    .foregroundStyle(.tint)

                Text(description)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                    .lineLimit(2)
            }

            Spacer(minLength: 0)
        }
        .padding(.arcPaddingCard)
        .background(Color.arcBackgroundSecondary)
        .clipShape(RoundedRectangle(cornerRadius: .arcCornerRadiusLarge))
    }
}

#Preview {
    VStack(spacing: .arcSpacingMedium) {
        SampleCard(
            title: "Welcome",
            subtitle: "Getting Started",
            description: "This is a sample card showing all tokens in use.",
            imageName: "star.fill"
        )
    }
    .padding()
    .background(Color.arcBackgroundPrimary)
}
