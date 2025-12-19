//
//  AccessibilityTestScreen.swift
//  ARCDesignSystemDemo
//
//  Created by ARC Labs on 12/19/25.
//

import ARCDesignSystem
import SwiftUI

/// Screen for testing accessibility features of the design system.
///
/// Displays sample content at various Dynamic Type sizes to verify
/// that the design system scales appropriately for all users.
struct AccessibilityTestScreen: View {
    @State private var selectedSize: DynamicTypeSize = .large

    private let sizes: [DynamicTypeSize] = [
        .xSmall, .small, .medium, .large, .xLarge,
        .xxLarge, .xxxLarge, .accessibility1,
        .accessibility2, .accessibility3
    ]

    var body: some View {
        ScrollView {
            VStack(spacing: .arcSpacingLarge) {
                // Size selector
                sizeSelector

                Divider()

                // Sample content
                sampleContent
                    .dynamicTypeSize(selectedSize)
            }
            .padding(.arcPaddingSection)
        }
        .background(Color.arcBackgroundPrimary)
        .navigationTitle("Accessibility")
        #if os(iOS)
            .navigationBarTitleDisplayMode(.inline)
        #endif
    }

    // MARK: - Size Selector

    private var sizeSelector: some View {
        VStack(alignment: .leading, spacing: .arcSpacingSmall) {
            Text("Dynamic Type Size")
                .font(.arcFontHeadline)
                .foregroundStyle(Color.arcTextPrimary)

            Picker("Size", selection: $selectedSize) {
                ForEach(sizes, id: \.self) { size in
                    Text(sizeName(for: size))
                        .tag(size)
                }
            }
            #if os(iOS)
            .pickerStyle(.wheel)
            .frame(height: 120)
            #else
            .pickerStyle(.menu)
            #endif
        }
    }

    // MARK: - Sample Content

    private var sampleContent: some View {
        VStack(alignment: .leading, spacing: .arcSpacingLarge) {
            // Typography sample
            VStack(alignment: .leading, spacing: .arcSpacingMedium) {
                Text("Typography Scale")
                    .font(.arcFontTitle2)

                Text("Title Large")
                    .font(.arcFontTitleLarge)
                Text("Body text that demonstrates how the design system adapts to different accessibility settings.")
                    .font(.arcFontBody)
                Text("Caption text for secondary information")
                    .font(.arcFontCaption1)
                    .foregroundStyle(Color.arcTextSecondary)
            }
            .padding(.arcPaddingCard)
            .background(Color.arcBackgroundSecondary)
            .clipShape(RoundedRectangle(cornerRadius: .arcCornerRadiusMedium))

            // Spacing sample
            VStack(alignment: .leading, spacing: .arcSpacingMedium) {
                Text("Spacing Scale")
                    .font(.arcFontTitle2)

                HStack(spacing: .arcSpacingSmall) {
                    ForEach(0 ..< 5) { _ in
                        RoundedRectangle(cornerRadius: .arcCornerRadiusSmall)
                            .fill(Color.arcAccent)
                            .frame(width: .arcSpacingLarge, height: .arcSpacingLarge)
                    }
                }

                Text("Elements above use arcSpacingSmall between items and arcSpacingLarge for size.")
                    .font(.arcFontFootnote)
                    .foregroundStyle(Color.arcTextSecondary)
            }
            .padding(.arcPaddingCard)
            .background(Color.arcBackgroundSecondary)
            .clipShape(RoundedRectangle(cornerRadius: .arcCornerRadiusMedium))

            // Interactive sample
            VStack(alignment: .leading, spacing: .arcSpacingMedium) {
                Text("Interactive Elements")
                    .font(.arcFontTitle2)

                Button {
                    // Action
                } label: {
                    Text("Primary Action")
                        .font(.arcFontHeadline)
                        .foregroundStyle(.white)
                        .padding(.arcPaddingCompact)
                        .frame(maxWidth: .infinity)
                        .background(Color.arcAccent)
                        .clipShape(RoundedRectangle(cornerRadius: .arcCornerRadiusMedium))
                }

                Text("Buttons should remain tappable at all sizes with adequate touch targets.")
                    .font(.arcFontFootnote)
                    .foregroundStyle(Color.arcTextSecondary)
            }
            .padding(.arcPaddingCard)
            .background(Color.arcBackgroundSecondary)
            .clipShape(RoundedRectangle(cornerRadius: .arcCornerRadiusMedium))
        }
    }

    // MARK: - Helpers

    // swiftlint:disable:next cyclomatic_complexity
    private func sizeName(for size: DynamicTypeSize) -> String {
        switch size {
        case .xSmall: "XS"
        case .small: "S"
        case .medium: "M"
        case .large: "L (Default)"
        case .xLarge: "XL"
        case .xxLarge: "XXL"
        case .xxxLarge: "XXXL"
        case .accessibility1: "A1"
        case .accessibility2: "A2"
        case .accessibility3: "A3"
        case .accessibility4: "A4"
        case .accessibility5: "A5"
        @unknown default: "Unknown"
        }
    }
}

#Preview {
    NavigationStack {
        AccessibilityTestScreen()
    }
}
