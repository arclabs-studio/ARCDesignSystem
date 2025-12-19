//
//  TokenCatalogScreen.swift
//  ARCDesignSystemDemo
//
//  Created by ARC Labs on 12/19/25.
//

import ARCDesignSystem
import SwiftUI

/// A comprehensive catalog of all ARC Design System tokens.
///
/// This screen provides a browsable reference of all available tokens
/// organized by category: colors, typography, spacing, corner radius,
/// and animations.
struct TokenCatalogScreen: View {
    var body: some View {
        ARCDesignSystemDocumentation()
            .navigationTitle("Token Catalog")
        #if os(iOS)
            .navigationBarTitleDisplayMode(.inline)
        #endif
    }
}

#Preview {
    NavigationStack {
        TokenCatalogScreen()
    }
}
