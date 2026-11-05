//
//  MaterialsView.swift
//  ARCDesignSystemDemo
//
//  Created by ARC Labs Studio on 12/19/25.
//

import ARCDesignSystem
import SwiftUI

// MARK: - Materials View

struct MaterialsView: View {
    var body: some View {
        VStack(spacing: .arcSpacingSmall) {
            Text("Use .arcMaterialBackground() for blur effects")
                .font(.caption)
                .foregroundStyle(.secondary)

            HStack(spacing: .arcSpacingSmall) {
                materialDemo("Thin", material: .arcThin)
                materialDemo("Regular", material: .arcRegular)
                materialDemo("Thick", material: .arcThick)
            }
        }
    }

    private func materialDemo(_ name: String, material: Material) -> some View {
        Text(name)
            .font(.caption2)
            .padding(.arcSpacingSmall)
            .frame(maxWidth: .infinity)
            .background(material, in: RoundedRectangle(cornerRadius: .arcCornerRadiusSmall))
    }
}

#Preview {
    MaterialsView()
        .padding()
}
