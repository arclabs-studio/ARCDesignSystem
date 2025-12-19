//
//  SampleList.swift
//  ARCDesignSystemDemo
//
//  Created by ARC Labs on 12/19/25.
//

import ARCDesignSystem
import SwiftUI

/// A sample list demonstrating list item styling with design tokens.
///
/// Shows different list item styles using ARC Design System tokens.
struct SampleList: View {
    private struct ListItem {
        let icon: String
        let title: String
        let subtitle: String
    }

    private let items: [ListItem] = [
        ListItem(icon: "person.fill", title: "Profile", subtitle: "Manage your account"),
        ListItem(icon: "gearshape.fill", title: "Settings", subtitle: "App preferences"),
        ListItem(icon: "bell.fill", title: "Notifications", subtitle: "3 new"),
        ListItem(icon: "lock.fill", title: "Privacy", subtitle: "Security settings"),
        ListItem(icon: "questionmark.circle.fill", title: "Help", subtitle: "Get support")
    ]

    var body: some View {
        VStack(spacing: 0) {
            ForEach(Array(items.enumerated()), id: \.offset) { index, item in
                listRow(icon: item.icon, title: item.title, subtitle: item.subtitle)

                if index < items.count - 1 {
                    Divider()
                        .padding(.leading, 56 + .arcSpacingMedium)
                }
            }
        }
        .background(Color.arcBackgroundSecondary)
        .clipShape(RoundedRectangle(cornerRadius: .arcCornerRadiusLarge))
    }

    // MARK: - Helpers

    @ViewBuilder
    private func listRow(icon: String, title: String, subtitle: String) -> some View {
        HStack(spacing: .arcSpacingMedium) {
            // Icon
            Image(systemName: icon)
                .font(.system(size: 18))
                .foregroundStyle(Color.arcAccent)
                .frame(width: 32, height: 32)
                .background(Color.arcAccent.opacity(0.15))
                .clipShape(RoundedRectangle(cornerRadius: .arcCornerRadiusSmall))

            // Content
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.arcFontBody)
                    .foregroundStyle(Color.arcTextPrimary)

                Text(subtitle)
                    .font(.arcFontCaption1)
                    .foregroundStyle(Color.arcTextSecondary)
            }

            Spacer()

            // Chevron
            Image(systemName: "chevron.right")
                .font(.system(size: 14, weight: .semibold))
                .foregroundStyle(Color.arcTextSecondary.opacity(0.5))
        }
        .padding(.horizontal, .arcSpacingMedium)
        .padding(.vertical, .arcSpacingSmall)
        .contentShape(Rectangle())
    }
}

#Preview {
    SampleList()
        .padding()
        .background(Color.arcBackgroundPrimary)
}
