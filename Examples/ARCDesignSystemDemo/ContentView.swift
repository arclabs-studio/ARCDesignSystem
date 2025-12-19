//
//  ContentView.swift
//  ARCDesignSystemDemo
//
//  Created by ARC Labs Studio on 12/19/25.
//

import ARCDesignSystem
import SwiftUI

/// Main navigation view for the ARC Design System demo.
///
/// Provides access to different sections of the demo:
/// - Token Catalog: Browse all design tokens
/// - Components: See tokens applied to real UI components
struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                Section {
                    NavigationLink {
                        TokenCatalogScreen()
                    } label: {
                        Label("Token Catalog", systemImage: "paintpalette")
                    }

                    NavigationLink {
                        ComponentShowcaseScreen()
                    } label: {
                        Label("Components", systemImage: "square.on.square")
                    }

                    NavigationLink {
                        InteractivePlaygroundScreen()
                    } label: {
                        Label("Interactive Playground", systemImage: "slider.horizontal.3")
                    }
                } header: {
                    Text("Explore")
                } footer: {
                    Text("Browse design tokens and see them in action.")
                }

                Section {
                    NavigationLink {
                        AccessibilityTestScreen()
                    } label: {
                        Label("Accessibility Testing", systemImage: "accessibility")
                    }
                } header: {
                    Text("Testing")
                } footer: {
                    Text("Verify tokens work correctly with accessibility settings.")
                }
            }
            .navigationTitle("ARC Design System")
        }
    }
}

#Preview {
    ContentView()
}
