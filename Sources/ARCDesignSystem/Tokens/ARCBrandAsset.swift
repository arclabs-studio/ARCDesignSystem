//
//  ARCBrandAsset.swift
//  ARCDesignSystem
//
//  Created by ARC Labs on 1/24/26.
//

import SwiftUI

// MARK: - Brand Color Variant

/// Color variant for ARC Labs Studio brand assets.
///
/// Brand assets are available in two color combinations:
/// - ``burgundy``: Assets with the primary burgundy brand color
/// - ``negro``: Assets with black for high contrast or dark themes
public enum ARCBrandColorVariant: String, CaseIterable, Sendable {
    /// Burgundy color variant using the primary brand color.
    case burgundy = "Burgundy"

    /// Black (Negro) color variant for high contrast or dark themes.
    case negro = "Negro"
}

// MARK: - Brand Asset Type

/// ARC Labs Studio brand asset types.
///
/// Use this enum to access official ARC Labs Studio brand assets.
///
/// ## Available Assets
///
/// ### Icons
/// - ``icon``: Solid icon
/// - ``iconOutlined``: Outlined version of the icon
///
/// ### Symbols
/// - ``symbol``: Brand symbol
/// - ``symbolYellow``: Symbol with yellow accent
///
/// ### Logos
/// - ``logoHorizontal``: Horizontal logo layout
/// - ``logoHorizontalAlt``: Alternative horizontal layout
/// - ``logoStacked``: Vertically stacked logo
/// - ``logoStackedAlt``: Alternative stacked layout
/// - ``logoBoxed``: Logo in a box frame
/// - ``logoBoxedAlt``: Alternative boxed layout
///
/// ### Wordmarks
/// - ``wordmark``: Text-only brand wordmark
/// - ``wordmarkOutlined``: Outlined wordmark (Burgundy only)
///
/// ### Badges & Banners
/// - ``badge``: Circular brand badge
/// - ``banner``: Horizontal banner (Burgundy only)
/// - ``bannerAlt``: Alternative banner (Burgundy only)
///
/// ## Example Usage
///
/// ```swift
/// // Get a specific asset
/// ARCBrandAsset.logoHorizontal.image(variant: .burgundy)
///
/// // Use in a view
/// ARCBrandAsset.icon.image(variant: .negro)
///     .resizable()
///     .scaledToFit()
///     .frame(width: 64, height: 64)
/// ```
public enum ARCBrandAsset: String, CaseIterable, Sendable {
    // MARK: Icons

    /// Solid brand icon.
    case icon = "Icon"

    /// Outlined brand icon.
    case iconOutlined = "Icon_Outlined"

    // MARK: Symbols

    /// Brand symbol.
    case symbol = "Symbol"

    /// Brand symbol with yellow accent.
    case symbolYellow = "Symbol_Yellow"

    // MARK: Logos

    /// Horizontal logo layout.
    case logoHorizontal = "Logo_Horizontal"

    /// Alternative horizontal logo layout.
    case logoHorizontalAlt = "Logo_Horizontal_Alt"

    /// Vertically stacked logo.
    case logoStacked = "Logo_Stacked"

    /// Alternative stacked logo layout.
    case logoStackedAlt = "Logo_Stacked_Alt"

    /// Logo in a box frame.
    case logoBoxed = "Logo_Boxed"

    /// Alternative boxed logo layout.
    case logoBoxedAlt = "Logo_Boxed_Alt"

    // MARK: Wordmarks

    /// Text-only brand wordmark.
    case wordmark = "Wordmark"

    /// Outlined brand wordmark.
    ///
    /// - Note: Only available in Burgundy variant.
    case wordmarkOutlined = "Wordmark_Outlined"

    // MARK: Badges

    /// Circular brand badge.
    case badge = "Badge"

    // MARK: Banners

    /// Horizontal brand banner.
    ///
    /// - Note: Only available in Burgundy variant.
    case banner = "Banner"

    /// Alternative horizontal brand banner.
    ///
    /// - Note: Only available in Burgundy variant.
    case bannerAlt = "Banner_Alt"

    // MARK: - Asset Name

    /// The full asset name including the color variant.
    ///
    /// - Parameter variant: The color variant to use.
    /// - Returns: The full asset catalog name (e.g., "ARC_Icon_Burgundy").
    public func assetName(variant: ARCBrandColorVariant) -> String {
        "ARC_\(rawValue)_\(variant.rawValue)"
    }

    /// Returns the SwiftUI Image for this brand asset.
    ///
    /// - Parameter variant: The color variant to use (`.burgundy` or `.negro`).
    /// - Returns: A SwiftUI Image loaded from the asset catalog.
    ///
    /// ## Example
    ///
    /// ```swift
    /// ARCBrandAsset.logoHorizontal.image(variant: .burgundy)
    ///     .resizable()
    ///     .scaledToFit()
    ///     .frame(height: 60)
    /// ```
    ///
    /// - Note: Some assets are only available in the Burgundy variant.
    ///   See individual asset documentation for availability.
    public func image(variant: ARCBrandColorVariant) -> Image {
        Image(assetName(variant: variant), bundle: .module)
    }

    // MARK: - Availability

    /// The color variants available for this asset.
    ///
    /// Most assets are available in both variants, but some (like banners
    /// and outlined wordmark) are only available in Burgundy.
    public var availableVariants: [ARCBrandColorVariant] {
        switch self {
        case .wordmarkOutlined, .banner, .bannerAlt:
            [.burgundy]
        default:
            ARCBrandColorVariant.allCases
        }
    }

    /// Whether this asset is available in the specified variant.
    ///
    /// - Parameter variant: The color variant to check.
    /// - Returns: `true` if the asset is available in that variant.
    public func isAvailable(in variant: ARCBrandColorVariant) -> Bool {
        availableVariants.contains(variant)
    }
}

// MARK: - Asset Categories

extension ARCBrandAsset {
    /// All icon assets.
    public static var icons: [ARCBrandAsset] {
        [.icon, .iconOutlined]
    }

    /// All symbol assets.
    public static var symbols: [ARCBrandAsset] {
        [.symbol, .symbolYellow]
    }

    /// All logo assets.
    public static var logos: [ARCBrandAsset] {
        [
            .logoHorizontal, .logoHorizontalAlt,
            .logoStacked, .logoStackedAlt,
            .logoBoxed, .logoBoxedAlt
        ]
    }

    /// All wordmark assets.
    public static var wordmarks: [ARCBrandAsset] {
        [.wordmark, .wordmarkOutlined]
    }

    /// All badge assets.
    public static var badges: [ARCBrandAsset] {
        [.badge]
    }

    /// All banner assets.
    public static var banners: [ARCBrandAsset] {
        [.banner, .bannerAlt]
    }
}

// MARK: - CustomStringConvertible

extension ARCBrandAsset: CustomStringConvertible {
    public var description: String {
        switch self {
        case .icon: "Icon"
        case .iconOutlined: "Icon (Outlined)"
        case .symbol: "Symbol"
        case .symbolYellow: "Symbol (Yellow)"
        case .logoHorizontal: "Logo Horizontal"
        case .logoHorizontalAlt: "Logo Horizontal Alt"
        case .logoStacked: "Logo Stacked"
        case .logoStackedAlt: "Logo Stacked Alt"
        case .logoBoxed: "Logo Boxed"
        case .logoBoxedAlt: "Logo Boxed Alt"
        case .wordmark: "Wordmark"
        case .wordmarkOutlined: "Wordmark (Outlined)"
        case .badge: "Badge"
        case .banner: "Banner"
        case .bannerAlt: "Banner Alt"
        }
    }
}
