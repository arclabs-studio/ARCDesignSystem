//
//  ARCAnimationsPreview.swift
//  ARCDesignSystem
//
//  Created by ARC Labs on 1/24/26.
//

import SwiftUI

/// A visual showcase of ARC Design System animation tokens.
///
/// This preview demonstrates all animation tokens with interactive examples
/// and shows how they behave with Reduce Motion enabled.
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
public struct ARCAnimationsPreview: View {
    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    @State private var isAnimating = false

    public init() {}

    public var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: .arcSpacingXLarge) {
                // Reduce Motion indicator
                HStack {
                    Image(systemName: reduceMotion ? "figure.roll" : "figure.walk")
                    Text("Reduce Motion: \(reduceMotion ? "On" : "Off")")
                }
                .font(.caption)
                .foregroundStyle(reduceMotion ? .orange : .secondary)
                .padding(.horizontal)

                // MARK: - Base Animations

                VStack(alignment: .leading, spacing: .arcSpacingMedium) {
                    Text("Base Animations")
                        .font(.arcTitle2)
                        .padding(.bottom, .arcSpacingSmall)

                    AnimationDemo(name: ".arcQuick (0.15s)", animation: .arcQuick, isAnimating: isAnimating)
                    AnimationDemo(name: ".arcStandard (0.25s)", animation: .arcStandard, isAnimating: isAnimating)
                    AnimationDemo(name: ".arcSmooth (0.35s)", animation: .arcSmooth, isAnimating: isAnimating)
                    AnimationDemo(name: ".arcSlow (0.5s)", animation: .arcSlow, isAnimating: isAnimating)
                }
                .padding(.arcPaddingCard)
                .background(Color.arcBackgroundSecondary)
                .clipShape(RoundedRectangle(cornerRadius: .arcCornerRadiusMedium))

                // MARK: - Spring Animations

                VStack(alignment: .leading, spacing: .arcSpacingMedium) {
                    Text("Spring Animations")
                        .font(.arcTitle2)
                        .padding(.bottom, .arcSpacingSmall)

                    SpringDemo(name: ".arcSnappy", animation: .arcSnappy, isAnimating: isAnimating)
                    SpringDemo(name: ".arcSpring", animation: .arcSpring, isAnimating: isAnimating)
                    SpringDemo(name: ".arcGentle", animation: .arcGentle, isAnimating: isAnimating)
                    SpringDemo(name: ".arcBouncy", animation: .arcBouncy, isAnimating: isAnimating)
                }
                .padding(.arcPaddingCard)
                .background(Color.arcBackgroundSecondary)
                .clipShape(RoundedRectangle(cornerRadius: .arcCornerRadiusMedium))

                // MARK: - Accessibility Animations

                VStack(alignment: .leading, spacing: .arcSpacingMedium) {
                    Text("Accessibility-Aware")
                        .font(.arcTitle2)
                        .padding(.bottom, .arcSpacingSmall)

                    Text("These animations automatically adapt when Reduce Motion is enabled.")
                        .font(.caption)
                        .foregroundStyle(.secondary)

                    AccessibilityAnimationDemo(isAnimating: isAnimating)
                }
                .padding(.arcPaddingCard)
                .background(Color.arcBackgroundSecondary)
                .clipShape(RoundedRectangle(cornerRadius: .arcCornerRadiusMedium))

                // MARK: - Duration Reference

                VStack(alignment: .leading, spacing: .arcSpacingMedium) {
                    Text("Duration Constants")
                        .font(.arcTitle2)
                        .padding(.bottom, .arcSpacingSmall)

                    DurationRow(name: "instant", value: ARCAnimationDuration.instant)
                    DurationRow(name: "minimal", value: ARCAnimationDuration.minimal)
                    DurationRow(name: "quick", value: ARCAnimationDuration.quick)
                    DurationRow(name: "standard", value: ARCAnimationDuration.standard)
                    DurationRow(name: "smooth", value: ARCAnimationDuration.smooth)
                    DurationRow(name: "slow", value: ARCAnimationDuration.slow)
                    DurationRow(name: "extended", value: ARCAnimationDuration.extended)
                }
                .padding(.arcPaddingCard)
                .background(Color.arcBackgroundSecondary)
                .clipShape(RoundedRectangle(cornerRadius: .arcCornerRadiusMedium))

                // Play button
                Button {
                    isAnimating.toggle()
                } label: {
                    Label(
                        isAnimating ? "Reset" : "Play All",
                        systemImage: isAnimating ? "arrow.counterclockwise" : "play.fill"
                    )
                    .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .tint(.arcBrandBurgundy)
            }
            .padding(.arcPaddingSection)
        }
        .background(Color.arcBackgroundPrimary)
    }
}

// MARK: - Components

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
private struct AnimationDemo: View {
    let name: String
    let animation: Animation
    let isAnimating: Bool

    var body: some View {
        HStack {
            Text(name)
                .font(.caption)
                .frame(width: 140, alignment: .leading)

            Spacer()

            Circle()
                .fill(Color.arcBrandGold)
                .frame(width: 20, height: 20)
                .offset(x: isAnimating ? 60 : 0)
                .animation(animation, value: isAnimating)
        }
        .padding(.vertical, 8)
    }
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
private struct SpringDemo: View {
    let name: String
    let animation: Animation
    let isAnimating: Bool

    var body: some View {
        HStack {
            Text(name)
                .font(.caption)
                .frame(width: 100, alignment: .leading)

            Spacer()

            RoundedRectangle(cornerRadius: 8)
                .fill(Color.arcBrandBurgundy)
                .frame(width: isAnimating ? 100 : 40, height: 24)
                .animation(animation, value: isAnimating)
        }
        .padding(.vertical, 4)
    }
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
private struct AccessibilityAnimationDemo: View {
    let isAnimating: Bool

    var body: some View {
        VStack(spacing: .arcSpacingMedium) {
            HStack {
                Text(".arcDefault")
                    .font(.caption)
                    .frame(width: 100, alignment: .leading)
                Spacer()
                Circle()
                    .fill(.blue)
                    .frame(width: 20, height: 20)
                    .offset(x: isAnimating ? 60 : 0)
                    .arcAnimation(.arcDefault, value: isAnimating)
            }

            HStack {
                Text(".arcInteractive")
                    .font(.caption)
                    .frame(width: 100, alignment: .leading)
                Spacer()
                Circle()
                    .fill(.green)
                    .frame(width: 20, height: 20)
                    .offset(x: isAnimating ? 60 : 0)
                    .arcAnimation(.arcInteractive, value: isAnimating)
            }
        }
    }
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
private struct DurationRow: View {
    let name: String
    let value: Double

    var body: some View {
        HStack {
            Text(".\(name)")
                .font(.caption.monospaced())
            Spacer()
            Text("\(value, specifier: "%.2f")s")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
    }
}

// MARK: - Preview

#Preview("Animations") {
    ARCAnimationsPreview()
}
