//
//  ARCColor+Helpers.swift
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
// MARK: - ARC Color Cross-Platform Helpers
// =====================================================
//
// These helpers provide a unified way to access ARCDesignSystem
// color tokens in both UIKit (iOS) and AppKit (macOS) environments.
//
// They return safe `Color` values that match system backgrounds,
// text colors, and brand accents while avoiding compile-time errors
// caused by unavailable UIKit or AppKit types.
//
// Example usage:
//
//     .foregroundStyle(ARCColorHelper.textPrimary)
//     .background(ARCColorHelper.backgroundPrimary)
//

public enum ARCColorHelper {
    
    // MARK: Text Colors
    
    /// Primary text color. Adapts to the current system (UIKit/AppKit).
    public static var textPrimary: Color {
        #if canImport(UIKit)
        return .arcTextPrimary
        #elseif canImport(AppKit)
        return Color.primary
        #else
        return Color.white
        #endif
    }
    
    /// Secondary text color for captions or hints.
    public static var textSecondary: Color {
        #if canImport(UIKit)
        return .arcTextSecondary
        #elseif canImport(AppKit)
        return Color.secondary
        #else
        return Color.gray
        #endif
    }
    
    // MARK: - Background Colors
    
    /// Primary background color.
    public static var backgroundPrimary: Color {
        #if canImport(UIKit)
        return .arcBackgroundPrimary
        #elseif canImport(AppKit)
        return Color(NSColor.windowBackgroundColor)
        #else
        return Color.white
        #endif
    }
    
    /// Secondary background color (cards, containers).
    public static var backgroundSecondary: Color {
        #if canImport(UIKit)
        return .arcBackgroundSecondary
        #elseif canImport(AppKit)
        return Color(NSColor.controlBackgroundColor)
        #else
        return Color.gray.opacity(0.15)
        #endif
    }
    
    /// Tertiary background color (subtle separation).
    public static var backgroundTertiary: Color {
        #if canImport(UIKit)
        return .arcBackgroundTertiary
        #elseif canImport(AppKit)
        return Color(NSColor.underPageBackgroundColor)
        #else
        return Color.gray.opacity(0.1)
        #endif
    }
    
    // MARK: - Brand Colors
    
    /// Accent or highlight color.
    public static var highlight: Color {
        #if canImport(UIKit)
        return .arcHighlight
        #elseif canImport(AppKit)
        return Color.accentColor
        #else
        return Color.yellow
        #endif
    }
    
    // MARK: - Shadows
    
    /// Medium-level shadow color for elevation.
    public static var shadowMedium: Color {
        #if canImport(UIKit)
        return .arcShadowMedium
        #elseif canImport(AppKit)
        return Color.black.opacity(0.15)
        #else
        return Color.black.opacity(0.15)
        #endif
    }
}
