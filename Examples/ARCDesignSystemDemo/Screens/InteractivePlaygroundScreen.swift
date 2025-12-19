//
//  InteractivePlaygroundScreen.swift
//  ARCDesignSystemDemo
//
//  Created by ARC Labs Studio on 12/19/25.
//

import ARCDesignSystem
import SwiftUI

/// Interactive playground for testing design tokens with different settings.
///
/// Allows real-time testing of color schemes, materials, and vibrancy
/// to verify accessibility and visual consistency.
struct InteractivePlaygroundScreen: View {
    @State private var selectedMaterial: MaterialOption = .regular
    @State private var showVibrancy = true
    @State private var cornerRadius: CGFloat = .arcCornerRadiusMedium

    var body: some View {
        ScrollView {
            VStack(spacing: .arcSpacingXLarge) {
                // Material Picker
                materialSection

                // Corner Radius Slider
                cornerRadiusSection

                // Vibrancy Toggle
                vibrancySection

                // Live Preview
                livePreviewSection
            }
            .padding(.arcPaddingSection)
        }
        .background(backgroundGradient)
        .navigationTitle("Playground")
        #if os(iOS)
            .navigationBarTitleDisplayMode(.inline)
        #endif
    }

    // MARK: - Background

    private var backgroundGradient: some View {
        LinearGradient(
            colors: [.blue.opacity(0.3), .purple.opacity(0.3), .pink.opacity(0.3)],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .ignoresSafeArea()
    }

    // MARK: - Material Section

    private var materialSection: some View {
        VStack(alignment: .leading, spacing: .arcSpacingSmall) {
            Text("Material")
                .font(.headline)
                .foregroundStyle(.primary)

            Picker("Material", selection: $selectedMaterial) {
                ForEach(MaterialOption.allCases) { option in
                    Text(option.rawValue).tag(option)
                }
            }
            .pickerStyle(.segmented)
        }
        .padding(.arcPaddingCard)
        .arcMaterialBackground(.arcRegular)
    }

    // MARK: - Corner Radius Section

    private var cornerRadiusSection: some View {
        VStack(alignment: .leading, spacing: .arcSpacingSmall) {
            HStack {
                Text("Corner Radius")
                    .font(.headline)
                Spacer()
                Text("\(Int(cornerRadius))pt")
                    .font(.caption.monospaced())
                    .foregroundStyle(.secondary)
            }

            Slider(value: $cornerRadius, in: 0 ... 32, step: 4)
        }
        .padding(.arcPaddingCard)
        .arcMaterialBackground(.arcRegular)
    }

    // MARK: - Vibrancy Section

    private var vibrancySection: some View {
        Toggle("Show Vibrancy Labels", isOn: $showVibrancy)
            .font(.headline)
            .padding(.arcPaddingCard)
            .arcMaterialBackground(.arcRegular)
    }

    // MARK: - Live Preview Section

    private var livePreviewSection: some View {
        VStack(alignment: .leading, spacing: .arcSpacingMedium) {
            Text("Live Preview")
                .font(.headline)

            VStack(spacing: .arcSpacingMedium) {
                if showVibrancy {
                    Text("Primary Label")
                        .arcVibrancyLabel()
                    Text("Secondary Label")
                        .arcVibrancySecondary()
                    Text("Tertiary Label")
                        .arcVibrancyTertiary()
                    Text("Quaternary Label")
                        .arcVibrancyQuaternary()
                } else {
                    Text("Primary Label")
                        .foregroundStyle(.primary)
                    Text("Secondary Label")
                        .foregroundStyle(.secondary)
                    Text("Tertiary Label")
                        .foregroundStyle(.tertiary)
                    Text("Quaternary Label")
                        .foregroundStyle(.quaternary)
                }

                Divider()

                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(Color.accentColor.opacity(0.5))
                    .frame(height: 60)
                    .overlay(
                        Text("Corner: \(Int(cornerRadius))pt")
                            .font(.caption)
                    )
            }
            .padding(.arcSpacingLarge)
        }
        .padding(.arcPaddingCard)
        .background(selectedMaterial.material, in: RoundedRectangle(cornerRadius: .arcCornerRadiusLarge))
    }
}

// MARK: - Material Option

private enum MaterialOption: String, CaseIterable, Identifiable {
    case ultraThin = "Ultra Thin"
    case thin = "Thin"
    case regular = "Regular"
    case thick = "Thick"

    var id: String { rawValue }

    var material: Material {
        switch self {
        case .ultraThin: .arcUltraThin
        case .thin: .arcThin
        case .regular: .arcRegular
        case .thick: .arcThick
        }
    }
}

#Preview {
    NavigationStack {
        InteractivePlaygroundScreen()
    }
}
