//
//  ColorTokensView.swift
//  ARCDesignSystemDemo
//
//  Created by ARC Labs Studio on 12/19/25.
//

import ARCDesignSystem
import SwiftUI

// MARK: - Color Tokens View

struct ColorTokensView: View {
    var body: some View {
        VStack(spacing: .arcSpacingSmall) {
            colorRow("Background Primary", color: .arcBackgroundPrimary)
            colorRow("Background Secondary", color: .arcBackgroundSecondary)
            colorRow("Background Tertiary", color: .arcBackgroundTertiary)

            Divider().padding(.vertical, .arcSpacingXSmall)

            colorRow("Text Tertiary", color: .arcTextTertiary)
            colorRow("Text Quaternary", color: .arcTextQuaternary)
            colorRow("Text Disabled", color: .arcTextDisabled)

            Divider().padding(.vertical, .arcSpacingXSmall)

            colorRow("Shadow Light", color: .arcShadowLight)
            colorRow("Shadow Medium", color: .arcShadowMedium)
            colorRow("Shadow Strong", color: .arcShadowStrong)
        }
    }

    private func colorRow(_ name: String, color: Color) -> some View {
        HStack {
            RoundedRectangle(cornerRadius: 4)
                .fill(color)
                .frame(width: 24, height: 24)
                .overlay(RoundedRectangle(cornerRadius: 4)
                    .stroke(Color.arcSeparator, lineWidth: 0.5))

            Text(name)
                .font(.caption)
                .foregroundStyle(.primary)

            Spacer()
        }
    }
}

#Preview {
    ColorTokensView()
        .padding()
}
