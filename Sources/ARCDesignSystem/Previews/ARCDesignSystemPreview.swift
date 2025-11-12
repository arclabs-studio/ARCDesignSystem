//
//  ARCDesignSystemPreview.swift
//  ARCDesignSystem
//
//  Created by ARC Labs on 4/11/25.
//

import SwiftUI

/// A visual showcase of ARCDesignSystem tokens:
/// spacing, typography, colors, and corner radius.
/// Works on iOS and macOS to verify visual consistency.
@available(iOS 17.0, macOS 12.0, *)
public struct ARCDesignSystemPreview: View {
    
    public init() {}
    
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
                    .foregroundStyle(ARCColorHelper.textPrimary)
                }
                .padding(.arcPaddingCard)
                .background(ARCColorHelper.backgroundSecondary)
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
                .background(ARCColorHelper.backgroundSecondary)
                .clipShape(RoundedRectangle(cornerRadius: .arcCornerRadiusMedium))
                
                // =====================================================
                // MARK: - Color Palette
                // =====================================================
                VStack(alignment: .leading, spacing: .arcSpacingMedium) {
                    Text("Color Palette")
                        .font(.arcFontTitleMedium)
                        .padding(.bottom, .arcSpacingSmall)
                    
                    ARCColorSwatch(name: "Background Primary", color: ARCColorHelper.backgroundPrimary)
                    ARCColorSwatch(name: "Background Secondary", color: ARCColorHelper.backgroundSecondary)
                    ARCColorSwatch(name: "Background Tertiary", color: ARCColorHelper.backgroundTertiary)
                    ARCColorSwatch(name: "Text Primary", color: ARCColorHelper.textPrimary)
                    ARCColorSwatch(name: "Text Secondary", color: ARCColorHelper.textSecondary)
                    ARCColorSwatch(name: "Highlight", color: ARCColorHelper.highlight)
                }
                .padding(.arcPaddingCard)
                .background(ARCColorHelper.backgroundSecondary)
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
                .background(ARCColorHelper.backgroundSecondary)
                .clipShape(RoundedRectangle(cornerRadius: .arcCornerRadiusMedium))
            }
            .padding(.arcPaddingSection)
        }
        .background(ARCColorHelper.backgroundPrimary)
    }
}

// =====================================================
// MARK: - Components
// =====================================================

@available(iOS 17.0, macOS 12.0, *)
private struct ARCSpacingDemoRow: View {
    let label: String
    let value: CGFloat
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("\(label) — \(Int(value))pt")
                .font(.arcFontBodySmall)
                .foregroundStyle(ARCColorHelper.textSecondary)
            
            Rectangle()
                .fill(ARCColorHelper.highlight.opacity(0.8))
                .frame(height: 6)
                .frame(width: value)
                .clipShape(Capsule())
        }
    }
}

@available(iOS 17.0, macOS 12.0, *)
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
                        .stroke(ARCColorHelper.shadowMedium.opacity(0.3), lineWidth: 0.5)
                )
            
            Text(name)
                .font(.arcFontBodyMedium)
                .foregroundStyle(ARCColorHelper.textPrimary)
            
            Spacer()
        }
    }
}

@available(iOS 17.0, macOS 12.0, *)
private struct ARCRadiusDemo: View {
    let radius: CGFloat
    let label: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: .arcSpacingSmall) {
            Text("\(label) — \(Int(radius))pt")
                .font(.arcFontBodySmall)
                .foregroundStyle(ARCColorHelper.textSecondary)
            RoundedRectangle(cornerRadius: radius)
                .fill(ARCColorHelper.highlight.opacity(0.8))
                .frame(width: 100, height: 40)
        }
    }
}

// =====================================================
// MARK: - Preview
// =====================================================

@available(iOS 17.0, macOS 12.0, *)
#Preview("ARC Design System (Dark)") {
    ARCDesignSystemPreview()
        .preferredColorScheme(.dark)
}

@available(iOS 17.0, macOS 12.0, *)
#Preview("ARC Design System (Light)") {
    ARCDesignSystemPreview()
        .preferredColorScheme(.light)
}
