//
//  ARCDesignSystem.swift
//  ARCDesignSystem
//
//  Created by ARC Labs on 4/11/25.
//

import SwiftUI
#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

// =====================================================
// MARK: - ARC Layout Scale (Dynamic Type Aware)
// =====================================================

/// Controls the global visual scale for the ARC Design System.
/// Automatically adapts UI metrics (spacing, padding, corner radius)
/// according to the user’s preferred text size setting (Dynamic Type).
enum ARCLayoutScale {
    /// Returns the adaptive scale factor for the current content size category.
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

// =====================================================
// MARK: - ARC Spacing (Adaptive)
// =====================================================

public extension CGFloat {
    static var arcSpacingXSmall: CGFloat { 4 * ARCLayoutScale.arcScaleFactor }
    static var arcSpacingSmall: CGFloat { 8 * ARCLayoutScale.arcScaleFactor }
    static var arcSpacingMedium: CGFloat { 12 * ARCLayoutScale.arcScaleFactor }
    static var arcSpacingLarge: CGFloat { 16 * ARCLayoutScale.arcScaleFactor }
    static var arcSpacingXLarge: CGFloat { 24 * ARCLayoutScale.arcScaleFactor }
    static var arcSpacingXXLarge: CGFloat { 32 * ARCLayoutScale.arcScaleFactor }
}

// =====================================================
// MARK: - ARC Corner Radius (Adaptive)
// =====================================================

public extension CGFloat {
    static var arcCornerRadiusSmall: CGFloat { 8 * ARCLayoutScale.arcScaleFactor * 0.8 }
    static var arcCornerRadiusMedium: CGFloat { 16 * ARCLayoutScale.arcScaleFactor * 0.8 }
    static var arcCornerRadiusLarge: CGFloat { 24 * ARCLayoutScale.arcScaleFactor * 0.8 }
    static var arcCornerRadiusXLarge: CGFloat { 32 * ARCLayoutScale.arcScaleFactor * 0.8 }
}

// =====================================================
// MARK: - ARC Padding (Adaptive EdgeInsets)
// =====================================================

public extension EdgeInsets {
    static var arcPaddingCard: EdgeInsets {
        let s = ARCLayoutScale.arcScaleFactor
        return EdgeInsets(top: 16 * s, leading: 16 * s, bottom: 16 * s, trailing: 16 * s)
    }
    
    static var arcPaddingHorizontal: EdgeInsets {
        let s = ARCLayoutScale.arcScaleFactor
        return EdgeInsets(top: 0, leading: 16 * s, bottom: 0, trailing: 16 * s)
    }
    
    static var arcPaddingSection: EdgeInsets {
        let s = ARCLayoutScale.arcScaleFactor
        return EdgeInsets(top: 24 * s, leading: 16 * s, bottom: 24 * s, trailing: 16 * s)
    }
    
    static var arcPaddingCompact: EdgeInsets {
        let s = ARCLayoutScale.arcScaleFactor
        return EdgeInsets(top: 8 * s, leading: 12 * s, bottom: 8 * s, trailing: 12 * s)
    }
}

// =====================================================
// MARK: - ARC Colors (System + Brand Tokens)
// =====================================================

public extension Color {
    static var arcBackgroundPrimary: Color {
        #if canImport(UIKit)
        return Color(UIColor.systemBackground)
        #elseif canImport(AppKit)
        return Color(NSColor.windowBackgroundColor)
        #else
        return Color.white
        #endif
    }
    
    static var arcBackgroundSecondary: Color {
        #if canImport(UIKit)
        return Color(UIColor.secondarySystemBackground)
        #elseif canImport(AppKit)
        return Color(NSColor.controlBackgroundColor)
        #else
        return Color.gray.opacity(0.2)
        #endif
    }
    
    static var arcBackgroundTertiary: Color {
        #if canImport(UIKit)
        return Color(UIColor.tertiarySystemBackground)
        #elseif canImport(AppKit)
        return Color(NSColor.underPageBackgroundColor)
        #else
        return Color.gray.opacity(0.1)
        #endif
    }
    
    static let arcTextPrimary = Color.primary
    static let arcTextSecondary = Color.secondary
    static let arcHighlight = Color.yellow
}

// =====================================================
// MARK: - ARC Typography (Dynamic Type compliant)
// =====================================================

public extension Font {
    static let arcFontTitleSmall = Font.system(.title3, design: .rounded).weight(.semibold)
    static let arcFontTitleMedium = Font.system(.title2, design: .rounded).weight(.semibold)
    static let arcFontTitleLarge = Font.system(.largeTitle, design: .rounded).weight(.bold)
    
    static let arcFontBodySmall = Font.system(.footnote, design: .rounded)
    static let arcFontBodyMedium = Font.system(.callout, design: .rounded)
    static let arcFontBodyLarge = Font.system(.body, design: .rounded)
    static let arcFontLabelSmall = Font.system(.caption, design: .rounded)
}

// =====================================================
// MARK: - ARC Shadows
// =====================================================

public extension Color {
    static let arcShadowLight = Color.black.opacity(0.08)
    static let arcShadowMedium = Color.black.opacity(0.15)
    static let arcShadowStrong = Color.black.opacity(0.25)
}

// =====================================================
// MARK: - ARC Animations
// =====================================================

public extension Animation {
    static let arcAnimationBase = Animation.easeInOut(duration: 0.25)
    static let arcAnimationSmooth = Animation.easeInOut(duration: 0.35)
    static let arcAnimationQuick = Animation.spring(response: 0.25, dampingFraction: 0.8)
}
