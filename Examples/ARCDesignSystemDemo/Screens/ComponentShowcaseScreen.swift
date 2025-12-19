//
//  ComponentShowcaseScreen.swift
//  ARCDesignSystemDemo
//
//  Created by ARC Labs on 12/19/25.
//

import ARCDesignSystem
import SwiftUI

/// Showcase of UI components built with ARC Design System tokens.
///
/// This screen demonstrates how design tokens combine to create
/// real-world UI components like cards, buttons, forms, and lists.
struct ComponentShowcaseScreen: View {
    var body: some View {
        ScrollView {
            VStack(spacing: .arcSpacingXLarge) {
                // Cards section
                componentSection(title: "Cards") {
                    SampleCard(
                        title: "Welcome to ARC",
                        subtitle: "Design System Demo",
                        description: "This card demonstrates typography, spacing, and color tokens.",
                        imageName: "star.fill"
                    )

                    SampleCard(
                        title: "Accessibility First",
                        subtitle: "Dynamic Type Support",
                        description: "All components scale beautifully with system accessibility settings.",
                        imageName: "accessibility"
                    )
                }

                // Buttons section
                componentSection(title: "Buttons") {
                    SampleButtonRow()
                }

                // Form section
                componentSection(title: "Forms") {
                    SampleForm()
                }

                // List section
                componentSection(title: "Lists") {
                    SampleList()
                }
            }
            .padding(.arcPaddingSection)
        }
        .background(Color.arcBackgroundPrimary)
        .navigationTitle("Components")
        #if os(iOS)
            .navigationBarTitleDisplayMode(.inline)
        #endif
    }

    // MARK: - Helpers

    @ViewBuilder
    private func componentSection(
        title: String,
        @ViewBuilder content: () -> some View
    ) -> some View {
        VStack(alignment: .leading, spacing: .arcSpacingMedium) {
            Text(title)
                .font(.arcFontTitle2)
                .foregroundStyle(Color.arcTextPrimary)

            content()
        }
    }
}

#Preview {
    NavigationStack {
        ComponentShowcaseScreen()
    }
}
