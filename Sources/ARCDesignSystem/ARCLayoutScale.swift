//
//  ARCLayoutScale.swift
//  ARCDesignSystem
//
//  Created by ARC Labs on 4/11/25.
//

import SwiftUI
#if canImport(UIKit)
import UIKit
#endif

/// Controls the global visual scale for the ARC Design System.
///
/// `ARCLayoutScale` provides an adaptive scaling mechanism that responds to the user's
/// preferred text size setting (Dynamic Type on iOS). All spacing, padding, and corner
/// radius values are multiplied by this scale factor to ensure the UI remains proportional
/// and accessible across different text size preferences.
///
/// ## Overview
///
/// On platforms that support Dynamic Type (iOS, iPadOS, tvOS, watchOS), the scale factor
/// ranges from 0.9 (extra small text) to 1.7 (accessibility extra extra extra large).
/// On macOS, which doesn't support Dynamic Type, a neutral scale of 1.0 is always used.
///
/// ## Scale Factor Mapping
///
/// | Content Size Category | Scale Factor |
/// |-----------------------|--------------|
/// | Extra Small           | 0.9          |
/// | Small                 | 0.95         |
/// | Medium                | 1.0          |
/// | Large                 | 1.05         |
/// | Extra Large           | 1.1          |
/// | Extra Extra Large     | 1.15         |
/// | Extra Extra Extra Large | 1.2        |
/// | Accessibility Medium  | 1.3          |
/// | Accessibility Large   | 1.4          |
/// | Accessibility Extra Large | 1.5      |
/// | Accessibility Extra Extra Large | 1.6 |
/// | Accessibility Extra Extra Extra Large | 1.7 |
///
/// - Note: This enum is internal and not meant to be instantiated directly.
///   Use the static property ``arcScaleFactor`` to retrieve the current scale.
enum ARCLayoutScale {
    /// Returns the adaptive scale factor for the current content size category.
    ///
    /// This property calculates the appropriate scale factor based on the user's
    /// Dynamic Type settings. It queries the current `UITraitCollection` on UIKit
    /// platforms or returns a neutral value of 1.0 on macOS.
    ///
    /// ## Example
    ///
    /// ```swift
    /// let baseSpacing: CGFloat = 16
    /// let adaptiveSpacing = baseSpacing * ARCLayoutScale.arcScaleFactor
    /// // On iPhone with Large text size: 16 * 1.05 = 16.8
    /// ```
    ///
    /// - Returns: A CGFloat value between 0.9 and 1.7 on UIKit platforms,
    ///   or 1.0 on macOS.
    static var arcScaleFactor: CGFloat {
        #if canImport(UIKit)
        let category = UITraitCollection.current.preferredContentSizeCategory
        #else
        // macOS does not support Dynamic Type, use neutral scaling
        return 1.0
        #endif

        #if canImport(UIKit)
        switch category {
        case .extraSmall: return 0.9
        case .small: return 0.95
        case .medium: return 1.0
        case .large: return 1.05
        case .extraLarge: return 1.1
        case .extraExtraLarge: return 1.15
        case .extraExtraExtraLarge: return 1.2
        case .accessibilityMedium: return 1.3
        case .accessibilityLarge: return 1.4
        case .accessibilityExtraLarge: return 1.5
        case .accessibilityExtraExtraLarge: return 1.6
        case .accessibilityExtraExtraExtraLarge: return 1.7
        default: return 1.0
        }
        #endif
    }
}
