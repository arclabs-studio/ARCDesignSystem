//
//  CornerRadiusTokensView.swift
//  ARCDesignSystemDemo
//
//  Created by ARC Labs Studio on 12/19/25.
//

import ARCDesignSystem
import SwiftUI

// MARK: - Corner Radius Tokens View

struct CornerRadiusTokensView: View {
    var body: some View {
        HStack(spacing: .arcSpacingMedium) {
            radiusDemo("S", radius: .arcCornerRadiusSmall)
            radiusDemo("M", radius: .arcCornerRadiusMedium)
            radiusDemo("L", radius: .arcCornerRadiusLarge)
            radiusDemo("XL", radius: .arcCornerRadiusXLarge)
        }
    }

    private func radiusDemo(_ label: String, radius: CGFloat) -> some View {
        VStack(spacing: .arcSpacingXSmall) {
            RoundedRectangle(cornerRadius: radius)
                .fill(Color.accentColor.opacity(0.3))
                .frame(width: 50, height: 50)
                .overlay(RoundedRectangle(cornerRadius: radius)
                    .stroke(Color.accentColor, lineWidth: 2))

            Text(label)
                .font(.caption2)
                .foregroundStyle(.secondary)

            Text("\(Int(radius))pt")
                .font(.caption2.monospaced())
                .foregroundStyle(.tertiary)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    CornerRadiusTokensView()
        .padding()
}
