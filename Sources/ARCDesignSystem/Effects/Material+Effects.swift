//
//  Material+Effects.swift
//  ARCDesignSystem
//
//  Created by ARC Labs on 12/19/25.
//

import SwiftUI

// MARK: - Material Presets

// Materials are translucent blur effects that adapt to system appearance.
// They're ideal for creating depth and layering in your UI while maintaining
// readability of content placed on top.
//
// Available presets: arcUltraThin, arcThin, arcRegular, arcThick, arcUltraThick, arcBar
// Materials adapt to light/dark mode automatically.

extension Material {
    /// Ultra thin blur - barely visible, subtle depth.
    ///
    /// Use for very subtle overlays where you want the background
    /// to remain highly visible.
    public static var arcUltraThin: Material { .ultraThinMaterial }

    /// Thin blur - light frosted glass effect.
    ///
    /// Use for overlays that need some separation from the background
    /// while keeping content visible.
    public static var arcThin: Material { .thinMaterial }

    /// Regular blur - standard frosted glass.
    ///
    /// The recommended material for most use cases. Provides good
    /// balance between blur and content visibility.
    public static var arcRegular: Material { .regularMaterial }

    /// Thick blur - more opaque, stronger separation.
    ///
    /// Use when you need stronger visual separation between
    /// layers or for content that requires higher contrast.
    public static var arcThick: Material { .thickMaterial }

    /// Ultra thick - maximum opacity while maintaining blur.
    ///
    /// Use for maximum separation from background content,
    /// such as modal overlays or important dialogs.
    public static var arcUltraThick: Material { .ultraThickMaterial }

    /// Bar material - matches navigation and tab bars.
    ///
    /// Use for custom bars or elements that should visually match
    /// the system navigation and tab bar appearance.
    public static var arcBar: Material { .bar }
}

// MARK: - View Extensions

extension View {
    /// Applies an ARC material background with corner radius.
    ///
    /// Convenience modifier that combines a material background with
    /// a rounded rectangle shape.
    ///
    /// - Parameters:
    ///   - material: The material to apply. Default is `.arcRegular`.
    ///   - cornerRadius: The corner radius. Default is `.arcCornerRadiusMedium`.
    /// - Returns: A view with the material background applied.
    ///
    /// ```swift
    /// VStack {
    ///     Text("Card")
    /// }
    /// .padding()
    /// .arcMaterialBackground(.arcThick, cornerRadius: .arcCornerRadiusLarge)
    /// ```
    public func arcMaterialBackground(
        _ material: Material = .arcRegular,
        cornerRadius: CGFloat = .arcCornerRadiusMedium
    ) -> some View {
        background(
            material,
            in: RoundedRectangle(cornerRadius: cornerRadius)
        )
    }

    /// Applies an ARC material background with a capsule shape.
    ///
    /// Ideal for pill-shaped buttons, tags, or badges.
    ///
    /// - Parameter material: The material to apply. Default is `.arcRegular`.
    /// - Returns: A view with the capsule material background applied.
    ///
    /// ```swift
    /// Text("Tag")
    ///     .padding(.horizontal, 12)
    ///     .padding(.vertical, 6)
    ///     .arcMaterialCapsule(.arcThin)
    /// ```
    public func arcMaterialCapsule(_ material: Material = .arcRegular) -> some View {
        background(material, in: Capsule())
    }

    /// Applies an ARC material background with a circle shape.
    ///
    /// Ideal for circular buttons or avatar backgrounds.
    ///
    /// - Parameter material: The material to apply. Default is `.arcRegular`.
    /// - Returns: A view with the circular material background applied.
    ///
    /// ```swift
    /// Image(systemName: "plus")
    ///     .frame(width: 44, height: 44)
    ///     .arcMaterialCircle(.arcThick)
    /// ```
    public func arcMaterialCircle(_ material: Material = .arcRegular) -> some View {
        background(material, in: Circle())
    }
}
