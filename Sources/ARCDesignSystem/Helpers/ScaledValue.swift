//
//  ScaledValue.swift
//  ARCDesignSystem
//
//  Created by ARC Labs on 12/19/25.
//

import SwiftUI

/// Guide for using `@ScaledMetric` with ARC spacing tokens.
///
/// ## Overview
///
/// ARC Design System provides base spacing values as constants. To support
/// Dynamic Type accessibility, use SwiftUI's native `@ScaledMetric` property
/// wrapper in your views.
///
/// ## Why @ScaledMetric?
///
/// `@ScaledMetric` is Apple's recommended way to scale values with Dynamic Type:
///
/// - **Reactive**: Values update automatically when the user changes text size
/// - **Native**: Built into SwiftUI, no custom code needed
/// - **Accessible**: Ensures your app respects accessibility settings
/// - **Relative**: Can scale relative to any text style
///
/// ## Basic Usage
///
/// ```swift
/// struct CardView: View {
///     // Scale spacing relative to body text style
///     @ScaledMetric(relativeTo: .body) var padding = CGFloat.arcSpacingLarge
///     @ScaledMetric(relativeTo: .body) var spacing = CGFloat.arcSpacingMedium
///
///     var body: some View {
///         VStack(spacing: spacing) {
///             Text("Title")
///                 .font(.headline)
///             Text("Subtitle")
///                 .font(.subheadline)
///         }
///         .padding(padding)
///     }
/// }
/// ```
///
/// ## Text Style Relationships
///
/// Choose `relativeTo` based on the content context:
///
/// | Text Style | Use For |
/// |------------|---------|
/// | `.body` | General content, most common choice |
/// | `.headline` | Headers, prominent content |
/// | `.caption` | Small UI elements, labels |
/// | `.largeTitle` | Hero sections, large displays |
///
/// ```swift
/// struct HeroSection: View {
///     @ScaledMetric(relativeTo: .largeTitle) var heroSpacing: CGFloat = 32
///     @ScaledMetric(relativeTo: .body) var contentSpacing: CGFloat = 16
///
///     var body: some View {
///         VStack(spacing: heroSpacing) {
///             Text("Welcome")
///                 .font(.largeTitle)
///             VStack(spacing: contentSpacing) {
///                 // Content
///             }
///         }
///     }
/// }
/// ```
///
/// ## Clamping Values
///
/// For values that shouldn't scale too large, use a computed property:
///
/// ```swift
/// struct SafeScaledView: View {
///     @ScaledMetric var rawCornerRadius: CGFloat = 16
///
///     var cornerRadius: CGFloat {
///         min(rawCornerRadius, 32) // Cap at 32pt
///     }
///
///     var body: some View {
///         RoundedRectangle(cornerRadius: cornerRadius)
///     }
/// }
/// ```
///
/// ## Multiple Scaled Values
///
/// Group related scaled values for consistency:
///
/// ```swift
/// struct ListRowView: View {
///     @ScaledMetric(relativeTo: .body) var horizontalPadding = CGFloat.arcSpacingLarge
///     @ScaledMetric(relativeTo: .body) var verticalPadding = CGFloat.arcSpacingMedium
///     @ScaledMetric(relativeTo: .body) var iconSize: CGFloat = 24
///
///     var body: some View {
///         HStack {
///             Image(systemName: "star")
///                 .frame(width: iconSize, height: iconSize)
///             Text("Item")
///         }
///         .padding(.horizontal, horizontalPadding)
///         .padding(.vertical, verticalPadding)
///     }
/// }
/// ```
///
/// ## When NOT to Scale
///
/// Some values should remain fixed:
///
/// - **Corner radius**: Apple doesn't scale corners with Dynamic Type
/// - **Border widths**: Keep thin lines consistent
/// - **Icon frames**: Use SF Symbols which scale automatically
/// - **Minimum touch targets**: Always at least 44pt
///
/// ```swift
/// // Corner radius - use fixed value
/// RoundedRectangle(cornerRadius: .arcCornerRadiusMedium)
///
/// // Border - use fixed value
/// .overlay(
///     RoundedRectangle(cornerRadius: 8)
///         .stroke(.arcSeparator, lineWidth: 1)
/// )
/// ```
///
/// - SeeAlso: ``CGFloat/arcSpacingSmall``, ``CGFloat/arcSpacingMedium``, ``CGFloat/arcSpacingLarge``
public enum ARCScaledMetricGuide {
    // This enum exists solely for documentation purposes.
    // It provides a namespace for the @ScaledMetric usage guide.
}

// MARK: - Convenience Extensions

extension CGFloat {
    /// Creates a scaled version of this value for use in previews.
    ///
    /// This is a preview helper only. In production code, use `@ScaledMetric`.
    ///
    /// - Parameter textStyle: The text style to scale relative to.
    /// - Returns: The scaled value based on current Dynamic Type size.
    ///
    /// - Note: This method reads the current trait collection synchronously.
    ///   For reactive scaling in views, always use `@ScaledMetric`.
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    public func scaled(relativeTo textStyle: Font.TextStyle = .body) -> CGFloat {
        #if canImport(UIKit)
        let metrics = UIFontMetrics(forTextStyle: textStyle.uiTextStyle)
        return metrics.scaledValue(for: self)
        #else
        return self
        #endif
    }
}

#if canImport(UIKit)
import UIKit

extension Font.TextStyle {
    /// Converts SwiftUI Font.TextStyle to UIKit UIFont.TextStyle.
    var uiTextStyle: UIFont.TextStyle {
        switch self {
        case .largeTitle: return .largeTitle
        case .title: return .title1
        case .title2: return .title2
        case .title3: return .title3
        case .headline: return .headline
        case .subheadline: return .subheadline
        case .body: return .body
        case .callout: return .callout
        case .footnote: return .footnote
        case .caption: return .caption1
        case .caption2: return .caption2
        @unknown default: return .body
        }
    }
}
#endif
