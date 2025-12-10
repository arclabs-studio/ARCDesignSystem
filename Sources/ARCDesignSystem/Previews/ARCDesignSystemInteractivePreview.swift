//
//  ARCDesignSystemInteractivePreview.swift
//  ARCDesignSystem
//
//  Created by ARC Labs on 4/11/25.
//

import SwiftUI

/// An interactive playground for testing ARC Design System tokens.
///
/// `ARCDesignSystemInteractivePreview` wraps ``ARCDesignSystemPreview`` with
/// interactive controls that allow real-time testing of color schemes and
/// Dynamic Type settings. This is invaluable for verifying accessibility
/// compliance and visual consistency across different user preferences.
///
/// ## Overview
///
/// The interactive preview provides two primary controls:
/// - **Color Scheme Toggle**: Switch between light and dark mode
/// - **Dynamic Type Selector**: Test different text size preferences
///
/// Changes are applied immediately to the preview, allowing designers and
/// developers to verify that the design system adapts correctly to all
/// accessibility settings.
///
/// ## Usage
///
/// Perfect for Xcode previews during development:
///
/// ```swift
/// #Preview {
///     ARCDesignSystemInteractivePreview()
/// }
/// ```
///
/// Or as part of a developer/design tools screen in your app:
///
/// ```swift
/// NavigationLink("Test Design System") {
///     ARCDesignSystemInteractivePreview()
/// }
/// ```
///
/// ## Accessibility Testing
///
/// Use this view to verify that your design system:
/// - Maintains readability at all Dynamic Type sizes
/// - Provides sufficient contrast in both light and dark modes
/// - Scales spacing and UI elements proportionally
/// - Preserves visual hierarchy across all settings
///
/// ## Platform Compatibility
///
/// Available on iOS 15.0+ and macOS 12.0+. The Dynamic Type selector
/// works best on iOS/iPadOS where Dynamic Type is fully supported.
///
/// - Note: For a static preview without controls, see ``ARCDesignSystemPreview``.
@available(iOS 15.0, *)
public struct ARCDesignSystemInteractivePreview: View {

    // MARK: - State

    /// Currently selected color scheme (light or dark).
    @State private var colorScheme: ColorScheme = .light

    /// Currently selected Dynamic Type size.
    @State private var textScale: DynamicTypeSize = .medium

    /// Creates a new interactive ARC Design System preview.
    public init() {}
    
    // MARK: - View
    
    public var body: some View {
        VStack(spacing: .arcSpacingLarge) {
            
            // =====================================================
            // MARK: - Controls
            // =====================================================
            
            HStack(spacing: .arcSpacingLarge) {
                
                VStack(alignment: .leading) {
                    Text("Color Scheme")
                        .font(.arcFontBodySmall)
                        .foregroundStyle(ARCColorHelper.textPrimary)
                    
                    Picker("Color Scheme", selection: $colorScheme) {
                        Text("Light").tag(ColorScheme.light)
                        Text("Dark").tag(ColorScheme.dark)
                    }
                    .pickerStyle(.segmented)
                    .frame(width: 180)
                }
                
                VStack(alignment: .leading) {
                    Text("Dynamic Type")
                        .font(.arcFontBodySmall)
                        .foregroundStyle(ARCColorHelper.textPrimary)
                    
                    Picker("Dynamic Type", selection: $textScale) {
                        Text("XS").tag(DynamicTypeSize.xSmall)
                        Text("S").tag(DynamicTypeSize.small)
                        Text("M").tag(DynamicTypeSize.medium)
                        Text("L").tag(DynamicTypeSize.large)
                        Text("XL").tag(DynamicTypeSize.xLarge)
                    }
                    .pickerStyle(.segmented)
                    .frame(width: 260)
                }
            }
            .padding(.arcPaddingCard)
            .background(ARCColorHelper.backgroundSecondary)
            .clipShape(RoundedRectangle(cornerRadius: .arcCornerRadiusMedium))
            
            Divider()
                .overlay(ARCColorHelper.textSecondary)
            
            ScrollView {
                ARCDesignSystemPreview()
                    .dynamicTypeSize(textScale)
                    .preferredColorScheme(colorScheme)
            }
        }
        .padding(.arcPaddingSection)
        .background(ARCColorHelper.backgroundPrimary)
    }
}

// =====================================================
// MARK: - Preview
// =====================================================

@available(iOS 17.0, macOS 12.0, *)
#Preview("Interactive ARC Design System (Light)") {
    ARCDesignSystemInteractivePreview()
        .preferredColorScheme(.light)
}

@available(iOS 17.0, macOS 12.0, *)
#Preview("Interactive ARC Design System (Dark)") {
    ARCDesignSystemInteractivePreview()
        .preferredColorScheme(.dark)
}
