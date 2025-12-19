//
//  InteractivePlaygroundScreen.swift
//  ARCDesignSystemDemo
//
//  Created by ARC Labs on 12/19/25.
//

import ARCDesignSystem
import SwiftUI

/// Interactive playground for testing design tokens with different settings.
///
/// Allows real-time testing of color schemes and Dynamic Type settings
/// to verify accessibility and visual consistency.
struct InteractivePlaygroundScreen: View {
    var body: some View {
        ARCDesignSystemInteractivePreview()
            .navigationTitle("Playground")
        #if os(iOS)
            .navigationBarTitleDisplayMode(.inline)
        #endif
    }
}

#Preview {
    NavigationStack {
        InteractivePlaygroundScreen()
    }
}
