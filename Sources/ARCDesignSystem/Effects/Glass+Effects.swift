//
//  Glass+Effects.swift
//  ARCDesignSystem
//
//  Created by ARC Labs on 12/19/25.
//

import SwiftUI

// MARK: - Liquid Glass Helpers

// Liquid Glass is Apple's new dynamic material introduced in iOS 26 that combines
// the optical properties of glass with a sense of fluidity. It blurs content behind it,
// reflects color and light, and reacts to touch and pointer interactions in real time.
//
// Liquid Glass APIs are available starting in iOS 26, macOS 26, tvOS 26, and watchOS 26.
// These helpers will be fully functional once those platforms are released.
//
// Example Usage:
//
// ```swift
// if #available(iOS 26.0, *) {
//     Text("Hello")
//         .padding()
//         .arcGlass()
// }
// ```

#if swift(>=6.0)
@available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, *)
extension View {
    /// Applies the standard ARC Liquid Glass effect.
    ///
    /// Creates a frosted glass appearance that blurs content behind the view,
    /// reflects surrounding colors, and optionally responds to interactions.
    ///
    /// - Parameters:
    ///   - cornerRadius: The corner radius for the glass shape. Default is `.arcCornerRadiusMedium`.
    ///   - tint: Optional tint color to suggest prominence or branding.
    ///   - interactive: When true, the glass reacts to touch and pointer interactions.
    /// - Returns: A view with the Liquid Glass effect applied.
    ///
    /// ```swift
    /// Text("Card Title")
    ///     .padding()
    ///     .arcGlass(cornerRadius: .arcCornerRadiusLarge, tint: .blue, interactive: true)
    /// ```
    public func arcGlass(
        cornerRadius: CGFloat = .arcCornerRadiusMedium,
        tint: Color? = nil,
        interactive: Bool = false
    ) -> some View {
        var glass = Glass.regular
        if let tint {
            glass = glass.tint(tint)
        }
        if interactive {
            glass = glass.interactive()
        }
        return glassEffect(glass, in: .rect(cornerRadius: cornerRadius))
    }

    /// Extends the background behind navigation elements.
    ///
    /// Use this effect for hero headers, featured images, or content that should
    /// extend behind the navigation bar or tab bar with a mirrored blur effect.
    ///
    /// - Returns: A view with the background extension effect applied.
    ///
    /// ```swift
    /// Image("hero")
    ///     .resizable()
    ///     .arcBackgroundExtension()
    /// ```
    public func arcBackgroundExtension() -> some View {
        backgroundExtensionEffect()
    }
}
#endif
