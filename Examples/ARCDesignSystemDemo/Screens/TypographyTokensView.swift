//
//  TypographyTokensView.swift
//  ARCDesignSystemDemo
//
//  Created by ARC Labs Studio on 12/19/25.
//

import ARCDesignSystem
import SwiftUI

// MARK: - Typography Tokens View

struct TypographyTokensView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: .arcSpacingSmall) {
            Text("System fonts with ARC naming:")
                .font(.caption)
                .foregroundStyle(.secondary)

            typographyRow(".arcLargeTitle", font: .arcLargeTitle)
            typographyRow(".arcTitle", font: .arcTitle)
            typographyRow(".arcTitle2", font: .arcTitle2)
            typographyRow(".arcTitle3", font: .arcTitle3)
            typographyRow(".arcHeadline", font: .arcHeadline)
            typographyRow(".arcBody", font: .arcBody)
            typographyRow(".arcCaption", font: .arcCaption)

            Divider().padding(.vertical, .arcSpacingXSmall)

            Text("Brand font (Radley Sans):")
                .font(.caption)
                .foregroundStyle(.secondary)

            Text("ARC Labs Studio")
                .font(.arcBrandFont(.title))
                .foregroundStyle(Color.arcBrandBurgundy)
        }
    }

    private func typographyRow(_ name: String, font: Font) -> some View {
        HStack {
            Text(name)
                .font(.caption2.monospaced())
                .foregroundStyle(.tertiary)

            Spacer()

            Text("Aa")
                .font(font)
        }
    }
}

#Preview {
    TypographyTokensView()
        .padding()
}
