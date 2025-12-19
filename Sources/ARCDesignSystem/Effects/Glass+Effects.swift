//
//  Glass+Effects.swift
//  ARCDesignSystem
//
//  Created by ARC Labs on 12/19/25.
//

import SwiftUI

// MARK: - Liquid Glass Helpers (iOS 26+)

// Liquid Glass is Apple's new dynamic material introduced in iOS 26 that combines
// the optical properties of glass with a sense of fluidity. It blurs content behind it,
// reflects color and light, and reacts to touch and pointer interactions in real time.
//
// These helpers will be available once iOS 26 SDK is released.
//
// Planned API:
//
// ```swift
// // Basic glass effect
// if #available(iOS 26.0, *) {
//     Text("Hello")
//         .padding()
//         .arcGlass()
// }
//
// // Tinted interactive glass
// if #available(iOS 26.0, *) {
//     Text("Tap me")
//         .padding()
//         .arcGlass(tint: .blue, interactive: true)
// }
//
// // Background extension for hero headers
// if #available(iOS 26.0, *) {
//     Image("hero")
//         .arcBackgroundExtension()
// }
// ```

// NOTE: The implementation below requires iOS 26 SDK which is not yet publicly available.
// Uncomment when building with Xcode that includes iOS 26 SDK.

/*
 @available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
 extension View {
     /// Applies the standard ARC Liquid Glass effect.
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
     public func arcBackgroundExtension() -> some View {
         backgroundExtensionEffect()
     }
 }
 */

/// Namespace for Liquid Glass documentation.
///
/// Liquid Glass helpers will be available when building with iOS 26 SDK.
/// See the commented implementation above for the planned API.
public enum ARCGlassEffects {
    // This enum exists solely to ensure the file compiles and provides
    // a documentation anchor for Liquid Glass features.
}
