//
//  ARCDesignSystemInteractivePreview.swift
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

/// Interactive preview that allows developers and designers
/// to explore ARCDesignSystem tokens dynamically.
/// Works in both iOS and macOS environments.
@available(iOS 15.0, *)
struct ARCDesignSystemInteractivePreview: View {
    
    // MARK: State
    
    @State private var colorScheme: ColorScheme = .light
    @State private var textScale: DynamicTypeSize = .medium
    
    // MARK: Initializer

    public init() {}
    
    // MARK: View
    
    public var body: some View {
        VStack(spacing: .arcSpacingLarge) {
            
            // =====================================================
            // MARK: Controls
            // =====================================================
            
            HStack(spacing: .arcSpacingLarge) {
                // Color Scheme Toggle
                VStack(alignment: .leading) {
                    Text("Color Scheme")
                        .font(.arcFontBodySmall)
                        .foregroundStyle(arcTextPrimary())
                    
                    Picker("Color Scheme", selection: $colorScheme) {
                        Text("Light").tag(ColorScheme.light)
                        Text("Dark").tag(ColorScheme.dark)
                    }
                    .pickerStyle(.segmented)
                    .frame(width: 180)
                }
                
                // Dynamic Type Toggle
                VStack(alignment: .leading) {
                    Text("Dynamic Type")
                        .font(.arcFontBodySmall)
                        .foregroundStyle(arcTextPrimary())
                    
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
            .background(arcBackgroundSecondary())
            .clipShape(RoundedRectangle(cornerRadius: .arcCornerRadiusMedium))
            
            Divider()
                .overlay(arcTextSecondary())
            
            // =====================================================
            // MARK: System Preview
            // =====================================================
            
            ScrollView {
                ARCDesignSystemPreview()
                    .dynamicTypeSize(textScale)
                    .preferredColorScheme(colorScheme)
            }
        }
        .padding(.arcPaddingSection)
        .background(arcBackgroundPrimary())
    }
}

// =====================================================
// MARK: - Cross-platform Color Helpers
// =====================================================

/// These helpers return the appropriate Color for each OS.
/// They prevent `.foregroundStyle()` or `.background()` crashes
/// when running on macOS where UIKit-based tokens don't exist.
private func arcTextPrimary() -> Color {
    #if canImport(UIKit)
    return .arcTextPrimary
    #elseif canImport(AppKit)
    return Color.primary
    #else
    return Color.white
    #endif
}

private func arcTextSecondary() -> Color {
    #if canImport(UIKit)
    return .arcTextSecondary
    #elseif canImport(AppKit)
    return Color.secondary
    #else
    return Color.gray
    #endif
}

private func arcBackgroundPrimary() -> Color {
    #if canImport(UIKit)
    return .arcBackgroundPrimary
    #elseif canImport(AppKit)
    return Color(NSColor.windowBackgroundColor)
    #else
    return Color.white
    #endif
}

private func arcBackgroundSecondary() -> Color {
    #if canImport(UIKit)
    return .arcBackgroundSecondary
    #elseif canImport(AppKit)
    return Color(NSColor.controlBackgroundColor)
    #else
    return Color.gray.opacity(0.15)
    #endif
}

// =====================================================
// MARK: - Previews
// =====================================================

#Preview("Interactive ARC Design System (Light)") {
    if #available(iOS 15.0, *) {
        ARCDesignSystemInteractivePreview()
            .preferredColorScheme(.light)
    } else {
        // Fallback on earlier versions
    }
}

#Preview("Interactive ARC Design System (Dark)") {
    if #available(iOS 15.0, *) {
        ARCDesignSystemInteractivePreview()
            .preferredColorScheme(.dark)
    } else {
        // Fallback on earlier versions
    }
}
