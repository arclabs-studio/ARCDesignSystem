//
//  ARCDesignSystemPreview.swift
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

/// A visual showcase of ARCDesignSystem tokens:
/// spacing, typography, colors, and corner radius.
/// Works on iOS and macOS to verify visual consistency.
@available(iOS 15.0, *)
struct ARCDesignSystemPreview: View {
    
    // MARK: Initializer
    
    public init() {}
    
    // MARK: View

    public var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: .arcSpacingXLarge) {
                
                // =====================================================
                // MARK: - Typography
                // =====================================================
                VStack(alignment: .leading, spacing: .arcSpacingMedium) {
                    Text("Typography")
                        .font(.arcFontTitleMedium)
                        .padding(.bottom, .arcSpacingSmall)
                    
                    Group {
                        Text("Title Large").font(.arcFontTitleLarge)
                        Text("Title Medium").font(.arcFontTitleMedium)
                        Text("Title Small").font(.arcFontTitleSmall)
                        Text("Body Large").font(.arcFontBodyLarge)
                        Text("Body Medium").font(.arcFontBodyMedium)
                        Text("Body Small").font(.arcFontBodySmall)
                        Text("Label Small").font(.arcFontLabelSmall)
                    }
                    .foregroundStyle(arcTextPrimary())
                }
                .padding(.arcPaddingCard)
                .background(arcBackgroundSecondary())
                .clipShape(RoundedRectangle(cornerRadius: .arcCornerRadiusMedium))
                
                // =====================================================
                // MARK: - Spacing Demonstration
                // =====================================================
                VStack(alignment: .leading, spacing: .arcSpacingMedium) {
                    Text("Spacing Scale")
                        .font(.arcFontTitleMedium)
                        .padding(.bottom, .arcSpacingSmall)
                    
                    ARCSpacingDemoRow(label: "XSmall", value: .arcSpacingXSmall)
                    ARCSpacingDemoRow(label: "Small", value: .arcSpacingSmall)
                    ARCSpacingDemoRow(label: "Medium", value: .arcSpacingMedium)
                    ARCSpacingDemoRow(label: "Large", value: .arcSpacingLarge)
                    ARCSpacingDemoRow(label: "XLarge", value: .arcSpacingXLarge)
                    ARCSpacingDemoRow(label: "XXLarge", value: .arcSpacingXXLarge)
                }
                .padding(.arcPaddingCard)
                .background(arcBackgroundSecondary())
                .clipShape(RoundedRectangle(cornerRadius: .arcCornerRadiusMedium))
                
                // =====================================================
                // MARK: - Color Palette
                // =====================================================
                VStack(alignment: .leading, spacing: .arcSpacingMedium) {
                    Text("Color Palette")
                        .font(.arcFontTitleMedium)
                        .padding(.bottom, .arcSpacingSmall)
                    
                    ARCColorSwatch(name: "Background Primary", color: arcBackgroundPrimary())
                    ARCColorSwatch(name: "Background Secondary", color: arcBackgroundSecondary())
                    ARCColorSwatch(name: "Background Tertiary", color: arcBackgroundTertiary())
                    ARCColorSwatch(name: "Text Primary", color: arcTextPrimary())
                    ARCColorSwatch(name: "Text Secondary", color: arcTextSecondary())
                    ARCColorSwatch(name: "Highlight", color: arcHighlight())
                }
                .padding(.arcPaddingCard)
                .background(arcBackgroundSecondary())
                .clipShape(RoundedRectangle(cornerRadius: .arcCornerRadiusMedium))
                
                // =====================================================
                // MARK: - Corner Radius Demonstration
                // =====================================================
                VStack(alignment: .leading, spacing: .arcSpacingMedium) {
                    Text("Corner Radius")
                        .font(.arcFontTitleMedium)
                        .padding(.bottom, .arcSpacingSmall)
                    
                    ARCRadiusDemo(radius: .arcCornerRadiusSmall, label: "Small")
                    ARCRadiusDemo(radius: .arcCornerRadiusMedium, label: "Medium")
                    ARCRadiusDemo(radius: .arcCornerRadiusLarge, label: "Large")
                    ARCRadiusDemo(radius: .arcCornerRadiusXLarge, label: "XLarge")
                }
                .padding(.arcPaddingCard)
                .background(arcBackgroundSecondary())
                .clipShape(RoundedRectangle(cornerRadius: .arcCornerRadiusMedium))
            }
            .padding(.arcPaddingSection)
        }
        .background(arcBackgroundPrimary())
    }
}

// =====================================================
// MARK: - Components for the Preview
// =====================================================

@available(iOS 15.0, *)
private struct ARCSpacingDemoRow: View {
    let label: String
    let value: CGFloat
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("\(label) — \(Int(value))pt")
                .font(.arcFontBodySmall)
                .foregroundStyle(arcTextSecondary())
            Rectangle()
                .fill(arcHighlight().opacity(0.8))
                .frame(height: 6)
                .frame(width: value)
                .clipShape(Capsule())
        }
    }
}

@available(iOS 15.0, *)
private struct ARCColorSwatch: View {
    let name: String
    let color: Color
    
    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: .arcCornerRadiusSmall)
                .fill(color)
                .frame(width: 60, height: 40)
                .overlay(
                    RoundedRectangle(cornerRadius: .arcCornerRadiusSmall)
                        .stroke(arcShadowMedium().opacity(0.3), lineWidth: 0.5)
                )
            
            Text(name)
                .font(.arcFontBodyMedium)
                .foregroundStyle(arcTextPrimary())
            
            Spacer()
        }
    }
}

@available(iOS 15.0, *)
private struct ARCRadiusDemo: View {
    let radius: CGFloat
    let label: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: .arcSpacingSmall) {
            Text("\(label) — \(Int(radius))pt")
                .font(.arcFontBodySmall)
                .foregroundStyle(arcTextSecondary())
            RoundedRectangle(cornerRadius: radius)
                .fill(arcHighlight().opacity(0.8))
                .frame(width: 100, height: 40)
        }
    }
}

// =====================================================
// MARK: - Cross-platform Color Helpers
// =====================================================

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

private func arcBackgroundTertiary() -> Color {
    #if canImport(UIKit)
    return .arcBackgroundTertiary
    #elseif canImport(AppKit)
    return Color(NSColor.underPageBackgroundColor)
    #else
    return Color.gray.opacity(0.1)
    #endif
}

private func arcHighlight() -> Color {
    #if canImport(UIKit)
    return .arcHighlight
    #elseif canImport(AppKit)
    return Color.accentColor
    #else
    return Color.yellow
    #endif
}

private func arcShadowMedium() -> Color {
    #if canImport(UIKit)
    return .arcShadowMedium
    #elseif canImport(AppKit)
    return Color.black.opacity(0.15)
    #else
    return Color.black.opacity(0.15)
    #endif
}

// =====================================================
// MARK: - Preview
// =====================================================

#Preview("ARC Design System (Dark)") {
    if #available(iOS 15.0, *) {
        ARCDesignSystemPreview()
            .preferredColorScheme(.dark)
    } else {
        // Fallback on earlier versions
    }
}

#Preview("ARC Design System (Light)") {
    if #available(iOS 15.0, *) {
        ARCDesignSystemPreview()
            .preferredColorScheme(.light)
    } else {
        // Fallback on earlier versions
    }
}
