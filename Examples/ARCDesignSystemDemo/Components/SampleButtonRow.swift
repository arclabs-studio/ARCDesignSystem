//
//  SampleButtonRow.swift
//  ARCDesignSystemDemo
//
//  Created by ARC Labs Studio on 12/19/25.
//

import ARCDesignSystem
import SwiftUI

/// A row of sample buttons demonstrating different button styles.
///
/// Shows primary, secondary, and tertiary button styles
/// using ARC Design System tokens.
struct SampleButtonRow: View {
    var body: some View {
        VStack(spacing: .arcSpacingMedium) {
            // Primary button
            Button {
                // Action
            } label: {
                Label("Primary Action", systemImage: "checkmark.circle.fill")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .padding(.arcPaddingCompact)
                    .frame(maxWidth: .infinity)
                    .background(Color.accentColor)
                    .clipShape(RoundedRectangle(cornerRadius: .arcCornerRadiusMedium))
            }

            // Secondary buttons row
            HStack(spacing: .arcSpacingMedium) {
                Button {
                    // Action
                } label: {
                    Text("Secondary")
                        .font(.body)
                        .foregroundStyle(.tint)
                        .padding(.arcPaddingCompact)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor.opacity(0.15))
                        .clipShape(RoundedRectangle(cornerRadius: .arcCornerRadiusMedium))
                }

                Button {
                    // Action
                } label: {
                    Text("Tertiary")
                        .font(.body)
                        .foregroundStyle(.primary)
                        .padding(.arcPaddingCompact)
                        .frame(maxWidth: .infinity)
                        .background(Color.arcBackgroundTertiary)
                        .clipShape(RoundedRectangle(cornerRadius: .arcCornerRadiusMedium))
                }
            }

            // Icon buttons row
            HStack(spacing: .arcSpacingLarge) {
                iconButton(systemName: "heart.fill", label: "Like")
                iconButton(systemName: "square.and.arrow.up", label: "Share")
                iconButton(systemName: "bookmark.fill", label: "Save")
                iconButton(systemName: "ellipsis", label: "More")
            }
            .padding(.arcPaddingCard)
            .background(Color.arcBackgroundSecondary)
            .clipShape(RoundedRectangle(cornerRadius: .arcCornerRadiusMedium))
        }
    }

    // MARK: - Helpers

    @ViewBuilder
    private func iconButton(systemName: String, label: String) -> some View {
        Button {
            // Action
        } label: {
            VStack(spacing: .arcSpacingXSmall) {
                Image(systemName: systemName)
                    .font(.system(size: 20))
                Text(label)
                    .font(.caption)
            }
            .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    SampleButtonRow()
        .padding()
        .background(Color.arcBackgroundPrimary)
}
