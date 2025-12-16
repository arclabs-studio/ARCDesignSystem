//
//  Color+Shadows.swift
//  ARCDesignSystem
//
//  Created by ARC Labs on 4/11/25.
//

import SwiftUI

/// Shadow color tokens for the ARC Design System.
///
/// These shadow colors provide elevation and depth to UI elements.
/// Use them with SwiftUI's `.shadow()` modifier to create layered interfaces.
///
/// ## Available Shadow Tokens
///
/// - ``arcShadowLight``: Subtle elevation (8% opacity)
/// - ``arcShadowMedium``: Standard cards and containers (15% opacity)
/// - ``arcShadowStrong``: Prominent elevation, modals (25% opacity)
///
/// ## Example Usage
///
/// ```swift
/// RoundedRectangle(cornerRadius: .arcCornerRadiusMedium)
///     .fill(.arcBackgroundSecondary)
///     .shadow(color: .arcShadowMedium, radius: 8, x: 0, y: 4)
/// ```
///
/// - Note: Shadow colors are static and don't adapt to Dynamic Type,
///   but they do respect light/dark mode via black opacity.
public extension Color {
    /// Light shadow color (8% black opacity).
    ///
    /// Subtle elevation for floating elements or minimal depth.
    ///
    /// - Returns: Black with 8% opacity.
    static let arcShadowLight = Color.black.opacity(0.08)

    /// Medium shadow color (15% black opacity).
    ///
    /// Standard elevation for cards, buttons, and containers.
    ///
    /// - Returns: Black with 15% opacity.
    static let arcShadowMedium = Color.black.opacity(0.15)

    /// Strong shadow color (25% black opacity).
    ///
    /// Prominent elevation for modals, popovers, and important UI elements.
    ///
    /// - Returns: Black with 25% opacity.
    static let arcShadowStrong = Color.black.opacity(0.25)
}
