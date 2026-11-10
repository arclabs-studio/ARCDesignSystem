//
//  SpacingTokensView.swift
//  ARCDesignSystemDemo
//
//  Created by ARC Labs Studio on 12/19/25.
//

import ARCDesignSystem
import SwiftUI

// MARK: - Spacing Tokens View

struct SpacingTokensView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: .arcSpacingSmall) {
            spacingRow("XSmall", value: .arcSpacingXSmall)
            spacingRow("Small", value: .arcSpacingSmall)
            spacingRow("Medium", value: .arcSpacingMedium)
            spacingRow("Large", value: .arcSpacingLarge)
            spacingRow("XLarge", value: .arcSpacingXLarge)
            spacingRow("XXLarge", value: .arcSpacingXXLarge)
        }
    }

    private func spacingRow(_ name: String, value: CGFloat) -> some View {
        HStack {
            Text(".arcSpacing\(name)")
                .font(.caption.monospaced())
                .foregroundStyle(.secondary)

            Spacer()

            Text("\(Int(value))pt")
                .font(.caption)
                .foregroundStyle(.secondary)

            RoundedRectangle(cornerRadius: 2)
                .fill(Color.accentColor)
                .frame(width: value, height: 8)
        }
    }
}

#Preview {
    SpacingTokensView()
        .padding()
}
