//
//  ARCDesignSystemDemoApp.swift
//  ARCDesignSystemDemo
//
//  Created by ARC Labs Studio on 12/19/25.
//

import ARCDesignSystem
import SwiftUI

/// Main entry point for the ARC Design System demo application.
///
/// This app showcases the ARCDesignSystem tokens in real-world UI contexts,
/// providing a hands-on way to explore typography, spacing, colors, and
/// other design tokens.
///
/// The app uses ARC Labs Studio branding colors by default:
/// - Accent color: `.arcBrandGold`
/// - Brand font: Radley Sans (registered on launch)
@main
struct ARCDesignSystemDemoApp: App {
    init() {
        ARCBrandFont.registerFonts()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .tint(.arcBrandGold)
        }
    }
}
