//
//  SampleForm.swift
//  ARCDesignSystemDemo
//
//  Created by ARC Labs Studio on 12/19/25.
//

import ARCDesignSystem
import SwiftUI

/// A sample form demonstrating form field styling with design tokens.
///
/// Shows text fields, toggles, and pickers styled using
/// ARC Design System tokens.
struct SampleForm: View {
    @State private var name = ""
    @State private var email = ""
    @State private var notifications = true
    @State private var selectedTheme = 0

    var body: some View {
        VStack(spacing: .arcSpacingMedium) {
            // Text fields
            VStack(spacing: .arcSpacingSmall) {
                formField(label: "Name", placeholder: "Enter your name", text: $name)
                formField(label: "Email", placeholder: "Enter your email", text: $email)
            }

            Divider()
                .padding(.vertical, .arcSpacingSmall)

            // Toggle
            HStack {
                VStack(alignment: .leading, spacing: .arcSpacingXSmall) {
                    Text("Notifications")
                        .font(.body)
                        .foregroundStyle(.primary)
                    Text("Receive push notifications")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }

                Spacer()

                Toggle("", isOn: $notifications)
                    .labelsHidden()
            }

            Divider()
                .padding(.vertical, .arcSpacingSmall)

            // Segmented picker
            VStack(alignment: .leading, spacing: .arcSpacingSmall) {
                Text("Theme")
                    .font(.body)
                    .foregroundStyle(.primary)

                Picker("Theme", selection: $selectedTheme) {
                    Text("System").tag(0)
                    Text("Light").tag(1)
                    Text("Dark").tag(2)
                }
                .pickerStyle(.segmented)
            }
        }
        .padding(.arcPaddingCard)
        .background(Color.arcBackgroundSecondary)
        .clipShape(RoundedRectangle(cornerRadius: .arcCornerRadiusLarge))
    }

    // MARK: - Helpers

    @ViewBuilder
    private func formField(
        label: String,
        placeholder: String,
        text: Binding<String>
    ) -> some View {
        VStack(alignment: .leading, spacing: .arcSpacingXSmall) {
            Text(label)
                .font(.footnote)
                .foregroundStyle(.secondary)

            TextField(placeholder, text: text)
                .font(.body)
                .padding(.arcPaddingCompact)
                .background(Color.arcBackgroundTertiary)
                .clipShape(RoundedRectangle(cornerRadius: .arcCornerRadiusSmall))
        }
    }
}

#Preview {
    SampleForm()
        .padding()
        .background(Color.arcBackgroundPrimary)
}
