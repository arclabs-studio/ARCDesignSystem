//
//  AccessibilityTokensView.swift
//  ARCDesignSystemDemo
//
//  Created by ARC Labs Studio on 12/19/25.
//

import ARCDesignSystem
import SwiftUI

// MARK: - Accessibility Tokens View

struct AccessibilityTokensView: View {
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    var body: some View {
        VStack(alignment: .leading, spacing: .arcSpacingSmall) {
            // Reduce Motion Status
            HStack {
                Image(systemName: reduceMotion ? "figure.roll" : "figure.walk")
                    .foregroundStyle(reduceMotion ? .orange : .green)
                Text("Reduce Motion: \(reduceMotion ? "ON" : "OFF")")
                    .font(.caption)
            }

            Divider().padding(.vertical, .arcSpacingXSmall)

            // Contrast Calculator
            Text("WCAG Contrast Validation:")
                .font(.caption)
                .foregroundStyle(.secondary)

            contrastRow("Burgundy/White", fg: .arcBrandBurgundy, bg: .white)
            contrastRow("Gold/Black", fg: .arcBrandGold, bg: .black)
            contrastRow("Black/White", fg: .arcBrandBlack, bg: .white)

            NavigationLink {
                ARCColorsPreview()
                    .navigationTitle("Color Tokens")
            } label: {
                Label("View All Colors", systemImage: "arrow.right")
                    .font(.callout)
            }
            .padding(.top, .arcSpacingSmall)
        }
    }

    private func contrastRow(_ name: String, fg: Color, bg: Color) -> some View {
        let result = ARCContrastCalculator.validate(foreground: fg, background: bg)

        return HStack {
            Text(name)
                .font(.caption2)
                .foregroundStyle(.secondary)

            Spacer()

            Text(result.ratioDescription)
                .font(.caption2.monospaced())
                .foregroundStyle(result.meetsAA ? .green : .red)

            Image(systemName: result.meetsAA ? "checkmark.circle.fill" : "xmark.circle.fill")
                .foregroundStyle(result.meetsAA ? .green : .red)
                .font(.caption)
        }
    }
}

#Preview {
    NavigationStack {
        AccessibilityTokensView()
            .padding()
    }
}
