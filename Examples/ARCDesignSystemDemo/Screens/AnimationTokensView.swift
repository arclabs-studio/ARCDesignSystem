//
//  AnimationTokensView.swift
//  ARCDesignSystemDemo
//
//  Created by ARC Labs Studio on 12/19/25.
//

import ARCDesignSystem
import SwiftUI

// MARK: - Animation Tokens View

struct AnimationTokensView: View {
    @State private var isAnimating = false

    var body: some View {
        VStack(alignment: .leading, spacing: .arcSpacingMedium) {
            Text("Accessibility-aware animations:")
                .font(.caption)
                .foregroundStyle(.secondary)

            HStack(spacing: .arcSpacingMedium) {
                animationDemo("Quick", animation: .arcQuick)
                animationDemo("Standard", animation: .arcStandard)
                animationDemo("Smooth", animation: .arcSmooth)
                animationDemo("Spring", animation: .arcSpring)
            }

            Button("Animate") {
                withAnimation(.arcDefault) {
                    isAnimating.toggle()
                }
            }
            .buttonStyle(.borderedProminent)
            .frame(maxWidth: .infinity)
        }
    }

    private func animationDemo(_ name: String, animation: Animation) -> some View {
        VStack(spacing: .arcSpacingXSmall) {
            Circle()
                .fill(Color.accentColor)
                .frame(width: 20, height: 20)
                .offset(y: isAnimating ? -10 : 10)
                .animation(animation, value: isAnimating)

            Text(name)
                .font(.caption2)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 50)
    }
}

#Preview {
    AnimationTokensView()
        .padding()
}
