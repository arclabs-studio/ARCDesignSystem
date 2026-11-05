//
//  TouchTargetTokensView.swift
//  ARCDesignSystemDemo
//
//  Created by ARC Labs Studio on 12/19/25.
//

import ARCDesignSystem
import SwiftUI

// MARK: - Touch Target Tokens View

struct TouchTargetTokensView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: .arcSpacingSmall) {
            Text("Minimum touch target sizes (Apple HIG):")
                .font(.caption)
                .foregroundStyle(.secondary)

            touchTargetRow("Minimum", value: .arcTouchTargetMinimum, note: "44pt")
            touchTargetRow("Recommended", value: .arcTouchTargetRecommended, note: "44pt")
            touchTargetRow("watchOS", value: .arcTouchTargetWatchOS, note: "38pt")
            touchTargetRow("visionOS", value: .arcTouchTargetVisionOS, note: "60pt")
        }
    }

    private func touchTargetRow(_ name: String, value: CGFloat, note: String) -> some View {
        HStack {
            Text(".arcTouchTarget\(name)")
                .font(.caption2.monospaced())
                .foregroundStyle(.secondary)

            Spacer()

            Text(note)
                .font(.caption2)
                .foregroundStyle(.tertiary)

            RoundedRectangle(cornerRadius: 4)
                .fill(Color.accentColor.opacity(0.3))
                .frame(width: value / 2, height: value / 2)
                .overlay(RoundedRectangle(cornerRadius: 4)
                    .stroke(Color.accentColor, lineWidth: 1))
        }
    }
}

#Preview {
    TouchTargetTokensView()
        .padding()
}
