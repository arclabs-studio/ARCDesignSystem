//
//  ARCBrandFont.swift
//  ARCDesignSystem
//
//  Created by ARC Labs on 1/24/26.
//

import SwiftUI

#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

// MARK: - Font Name Constant

/// The PostScript name for the Radley Sans font.
///
/// This constant is used by the Font extension methods to create
/// custom fonts with the Radley Sans typeface.
private let arcBrandFontName = "Radley-Sans"

// MARK: - Font Registration

/// ARC Labs Studio brand font manager.
///
/// Handles registration of the Radley Sans custom font used
/// in ARC Labs Studio branding.
///
/// ## Registration
///
/// Call ``registerFonts()`` early in your app lifecycle to ensure the font
/// is available. This is typically done in your App's initializer:
///
/// ```swift
/// @main
/// struct MyApp: App {
///     init() {
///         ARCBrandFont.registerFonts()
///     }
///
///     var body: some Scene {
///         WindowGroup {
///             ContentView()
///         }
///     }
/// }
/// ```
///
/// ## Usage
///
/// After registration, use the Font extension methods to access the font:
///
/// ```swift
/// // Fixed size
/// Text("ARC Labs Studio")
///     .font(.arcBrandFont(size: 24))
///
/// // Dynamic Type support (recommended)
/// Text("Welcome")
///     .font(.arcBrandFont(.title))
/// ```
@MainActor
public enum ARCBrandFont {
    /// Whether the font has been registered.
    private static var isRegistered = false

    /// Registers the Radley Sans font from the package bundle.
    ///
    /// Call this method early in your app lifecycle (e.g., in your App's init)
    /// to ensure the font is available throughout the app.
    ///
    /// This method is safe to call multiple times - it will only register
    /// the font once.
    ///
    /// ```swift
    /// @main
    /// struct MyApp: App {
    ///     init() {
    ///         ARCBrandFont.registerFonts()
    ///     }
    /// }
    /// ```
    public static func registerFonts() {
        guard !isRegistered else { return }

        guard let fontURL = Bundle.module.url(
            forResource: "radleysans",
            withExtension: "ttf"
        ) else {
            print("ARCDesignSystem: Failed to find radleysans.ttf in bundle")
            return
        }

        var errorRef: Unmanaged<CFError>?
        if CTFontManagerRegisterFontsForURL(fontURL as CFURL, .process, &errorRef) {
            isRegistered = true
        } else {
            if let error = errorRef?.takeRetainedValue() {
                print("ARCDesignSystem: Failed to register font: \(error)")
            }
        }
    }
}

// MARK: - Font Extension

extension Font {
    /// Returns the ARC Labs Studio brand font (Radley Sans) at the specified size.
    ///
    /// - Parameter size: The point size of the font.
    /// - Returns: The Radley Sans font at the specified size, or system font as fallback.
    ///
    /// - Note: Call ``ARCBrandFont/registerFonts()`` before using this method.
    ///
    /// ## Example
    ///
    /// ```swift
    /// Text("ARC Labs Studio")
    ///     .font(.arcBrandFont(size: 32))
    /// ```
    public static func arcBrandFont(size: CGFloat) -> Font {
        .custom(arcBrandFontName, size: size)
    }

    /// Returns the ARC Labs Studio brand font (Radley Sans) that scales with
    /// the specified text style.
    ///
    /// - Parameter style: The text style to match for Dynamic Type scaling.
    /// - Returns: The Radley Sans font that scales with the specified text style.
    ///
    /// - Note: Call ``ARCBrandFont/registerFonts()`` before using this method.
    ///
    /// ## Example
    ///
    /// ```swift
    /// Text("Welcome to ARC Labs")
    ///     .font(.arcBrandFont(.title))
    ///
    /// Text("Subtitle")
    ///     .font(.arcBrandFont(.headline))
    /// ```
    ///
    /// ## Supported Styles
    ///
    /// All standard SwiftUI text styles are supported:
    /// - `.largeTitle`, `.title`, `.title2`, `.title3`
    /// - `.headline`, `.subheadline`
    /// - `.body`, `.callout`, `.footnote`, `.caption`, `.caption2`
    public static func arcBrandFont(_ style: Font.TextStyle) -> Font {
        .custom(arcBrandFontName, size: style.defaultSize, relativeTo: style)
    }

    /// Returns the ARC Labs Studio brand font (Radley Sans) with a fixed size
    /// that scales relative to the specified text style.
    ///
    /// - Parameters:
    ///   - size: The base point size of the font.
    ///   - style: The text style to scale relative to for Dynamic Type.
    /// - Returns: The Radley Sans font at the specified size, scaling with Dynamic Type.
    ///
    /// - Note: Call ``ARCBrandFont/registerFonts()`` before using this method.
    ///
    /// ## Example
    ///
    /// ```swift
    /// // 28pt font that scales with .title
    /// Text("Custom Title")
    ///     .font(.arcBrandFont(size: 28, relativeTo: .title))
    /// ```
    public static func arcBrandFont(size: CGFloat, relativeTo style: Font.TextStyle) -> Font {
        .custom(arcBrandFontName, size: size, relativeTo: style)
    }
}

// MARK: - Text Style Default Sizes

extension Font.TextStyle {
    /// The default point size for each text style.
    ///
    /// These values match Apple's default sizes for the standard text styles
    /// at the default (Large) Dynamic Type size.
    var defaultSize: CGFloat {
        switch self {
        case .largeTitle: 34
        case .title: 28
        case .title2: 22
        case .title3: 20
        case .headline: 17
        case .subheadline: 15
        case .body: 17
        case .callout: 16
        case .footnote: 13
        case .caption: 12
        case .caption2: 11
        @unknown default: 17
        }
    }
}
