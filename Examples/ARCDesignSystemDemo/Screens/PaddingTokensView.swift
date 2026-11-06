//
//  PaddingTokensView.swift
//  ARCDesignSystemDemo
//
//  Created by ARC Labs Studio on 12/19/25.
//

import ARCDesignSystem
import SwiftUI

// MARK: - Padding Tokens View

struct PaddingTokensView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: .arcSpacingSmall) {
            paddingDemo("Card", padding: .arcPaddingCard)
            paddingDemo("Section", padding: .arcPaddingSection)
            paddingDemo("Compact", padding: .arcPaddingCompact)
            paddingDemo("Horizontal", padding: .arcPaddingHorizontal)
        }
    }

    private func paddingDemo(_ name: String, padding: EdgeInsets) -> some View {
        HStack {
            Text(".arcPadding\(name)")
                .font(.caption.monospaced())
                .foregroundStyle(.secondary)

            Spacer()

            Text("T:\(Int(padding.top)) L:\(Int(padding.leading))")
                .font(.caption2.monospaced())
                .foregroundStyle(.tertiary)
        }
    }
}

#Preview {
    PaddingTokensView()
        .padding()
}
