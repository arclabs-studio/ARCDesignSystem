//
//  ARCScaledFont.swift
//  ARCDesignSystem
//
//  Created by ARC Labs on 1/24/26.
//

import SwiftUI

/// A property wrapper that scales a custom font size with Dynamic Type.
///
/// Use this when you need a specific font size that still respects the user's
/// Dynamic Type preferences.
///
/// ## Example
///
/// ```swift
/// struct MyView: View {
///     @ARCScaledFont(size: 18, weight: .medium, design: .rounded)
///     var customFont
///
///     var body: some View {
///         Text("Custom sized text")
///             .font(customFont)
///     }
/// }
/// ```
///
/// ## How It Works
///
/// The font size scales relative to the specified text style (default: `.body`).
/// When the user changes their Dynamic Type size, the font scales proportionally.
///
/// - Note: For standard text styles (body, title, etc.), prefer using the native
///   SwiftUI fonts directly, which handle scaling automatically.
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
@propertyWrapper
public struct ARCScaledFont: DynamicProperty {
    // MARK: - Properties

    @ScaledMetric private var scaledSize: CGFloat
    private let weight: Font.Weight
    private let design: Font.Design

    // MARK: - Initialization

    /// Creates a scaled font with the specified parameters.
    ///
    /// - Parameters:
    ///   - size: The base point size of the font.
    ///   - weight: The weight of the font. Defaults to `.regular`.
    ///   - design: The design of the font. Defaults to `.default`.
    ///   - relativeTo: The text style to scale relative to. Defaults to `.body`.
    public init(
        size: CGFloat,
        weight: Font.Weight = .regular,
        design: Font.Design = .default,
        relativeTo textStyle: Font.TextStyle = .body
    ) {
        _scaledSize = ScaledMetric(wrappedValue: size, relativeTo: textStyle)
        self.weight = weight
        self.design = design
    }

    /// Creates a scaled font with the specified size and text style.
    ///
    /// - Parameters:
    ///   - size: The base point size of the font.
    ///   - relativeTo: The text style to scale relative to.
    public init(size: CGFloat, relativeTo textStyle: Font.TextStyle) {
        _scaledSize = ScaledMetric(wrappedValue: size, relativeTo: textStyle)
        weight = .regular
        design = .default
    }

    // MARK: - Wrapped Value

    /// The scaled font.
    public var wrappedValue: Font {
        Font.system(size: scaledSize, weight: weight, design: design)
    }
}

// MARK: - Convenience Extensions

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ARCScaledFont {
    /// Creates a scaled title font.
    ///
    /// - Parameter size: The base size. Scales relative to `.title`.
    /// - Returns: A configured `ARCScaledFont`.
    public static func title(size: CGFloat) -> ARCScaledFont {
        ARCScaledFont(size: size, weight: .semibold, relativeTo: .title)
    }

    /// Creates a scaled headline font.
    ///
    /// - Parameter size: The base size. Scales relative to `.headline`.
    /// - Returns: A configured `ARCScaledFont`.
    public static func headline(size: CGFloat) -> ARCScaledFont {
        ARCScaledFont(size: size, weight: .semibold, relativeTo: .headline)
    }

    /// Creates a scaled body font.
    ///
    /// - Parameter size: The base size. Scales relative to `.body`.
    /// - Returns: A configured `ARCScaledFont`.
    public static func body(size: CGFloat) -> ARCScaledFont {
        ARCScaledFont(size: size, weight: .regular, relativeTo: .body)
    }

    /// Creates a scaled caption font.
    ///
    /// - Parameter size: The base size. Scales relative to `.caption`.
    /// - Returns: A configured `ARCScaledFont`.
    public static func caption(size: CGFloat) -> ARCScaledFont {
        ARCScaledFont(size: size, weight: .regular, relativeTo: .caption)
    }
}

// MARK: - Text Extension for Convenience

extension Text {
    /// Applies a scaled font to the text.
    ///
    /// This is a convenience method for applying `ARCScaledFont` values.
    ///
    /// - Parameter scaledFont: The scaled font to apply.
    /// - Returns: A text view with the scaled font applied.
    ///
    /// ## Example
    ///
    /// ```swift
    /// @ARCScaledFont(size: 18, weight: .medium)
    /// var customFont
    ///
    /// Text("Hello")
    ///     .font(customFont)
    /// ```
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    public func arcFont(_ font: Font) -> Text {
        self.font(font)
    }
}
