//
//  ARCDesignSystemDocumentation.swift
//  ARCDesignSystem
//
//  Created by ARC Labs on 4/11/25.
//

import SwiftUI

/// A catalog-style documentation view for ARCDesignSystem tokens.
/// Displays all available colors, spacing, typography, and corner radii
/// with their names, values, and live previews.
///
/// This is intended for design review, documentation and developer onboarding.
@available(iOS 17.0, macOS 12.0, *)
public struct ARCDesignSystemDocumentation: View {
    
    public init() {}
    
    public var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: .arcSpacingXLarge) {
                
                // =====================================================
                // MARK: - Colors
                // =====================================================
                ARCDocSection(title: "🎨 Colors") {
                    ARCDocColorRow(name: "Background Primary", color: ARCColorHelper.backgroundPrimary)
                    ARCDocColorRow(name: "Background Secondary", color: ARCColorHelper.backgroundSecondary)
                    ARCDocColorRow(name: "Background Tertiary", color: ARCColorHelper.backgroundTertiary)
                    ARCDocColorRow(name: "Text Primary", color: ARCColorHelper.textPrimary)
                    ARCDocColorRow(name: "Text Secondary", color: ARCColorHelper.textSecondary)
                    ARCDocColorRow(name: "Highlight", color: ARCColorHelper.highlight)
                    ARCDocColorRow(name: "Shadow Medium", color: ARCColorHelper.shadowMedium)
                }
                
                // =====================================================
                // MARK: - Typography
                // =====================================================
                ARCDocSection(title: "🔠 Typography") {
                    ARCDocFontRow(name: "arcFontTitleLarge", font: .arcFontTitleLarge)
                    ARCDocFontRow(name: "arcFontTitleMedium", font: .arcFontTitleMedium)
                    ARCDocFontRow(name: "arcFontTitleSmall", font: .arcFontTitleSmall)
                    ARCDocFontRow(name: "arcFontBodyLarge", font: .arcFontBodyLarge)
                    ARCDocFontRow(name: "arcFontBodyMedium", font: .arcFontBodyMedium)
                    ARCDocFontRow(name: "arcFontBodySmall", font: .arcFontBodySmall)
                    ARCDocFontRow(name: "arcFontLabelSmall", font: .arcFontLabelSmall)
                }
                
                // =====================================================
                // MARK: - Spacing
                // =====================================================
                ARCDocSection(title: "📏 Spacing") {
                    ARCDocSpacingRow(name: "arcSpacingXSmall", value: .arcSpacingXSmall)
                    ARCDocSpacingRow(name: "arcSpacingSmall", value: .arcSpacingSmall)
                    ARCDocSpacingRow(name: "arcSpacingMedium", value: .arcSpacingMedium)
                    ARCDocSpacingRow(name: "arcSpacingLarge", value: .arcSpacingLarge)
                    ARCDocSpacingRow(name: "arcSpacingXLarge", value: .arcSpacingXLarge)
                    ARCDocSpacingRow(name: "arcSpacingXXLarge", value: .arcSpacingXXLarge)
                }
                
                // =====================================================
                // MARK: - Corner Radius
                // =====================================================
                ARCDocSection(title: "🟢 Corner Radius") {
                    ARCDocRadiusRow(name: "arcCornerRadiusSmall", value: .arcCornerRadiusSmall)
                    ARCDocRadiusRow(name: "arcCornerRadiusMedium", value: .arcCornerRadiusMedium)
                    ARCDocRadiusRow(name: "arcCornerRadiusLarge", value: .arcCornerRadiusLarge)
                    ARCDocRadiusRow(name: "arcCornerRadiusXLarge", value: .arcCornerRadiusXLarge)
                }
                
                // =====================================================
                // MARK: - Animations
                // =====================================================
                ARCDocSection(title: "⚡ Animations") {
                    ARCDocAnimationRow(name: "arcAnimationBase", animation: .arcAnimationBase)
                    ARCDocAnimationRow(name: "arcAnimationSmooth", animation: .arcAnimationSmooth)
                    ARCDocAnimationRow(name: "arcAnimationQuick", animation: .arcAnimationQuick)
                }
            }
            .padding(.arcPaddingSection)
        }
        .background(ARCColorHelper.backgroundPrimary)
    }
}

//
// =====================================================
// MARK: - Documentation Components
// =====================================================
//

@available(iOS 17.0, macOS 12.0, *)
private struct ARCDocSection<Content: View>: View {
    let title: String
    let content: Content
    
    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: .arcSpacingMedium) {
            Text(title)
                .font(.arcFontTitleMedium)
                .foregroundStyle(ARCColorHelper.textPrimary)
            
            VStack(alignment: .leading, spacing: .arcSpacingSmall) {
                content
            }
            .padding(.arcPaddingCard)
            .background(ARCColorHelper.backgroundSecondary)
            .clipShape(RoundedRectangle(cornerRadius: .arcCornerRadiusMedium))
        }
    }
}

@available(iOS 17.0, macOS 12.0, *)
private struct ARCDocColorRow: View {
    let name: String
    let color: Color
    
    var body: some View {
        HStack(spacing: .arcSpacingMedium) {
            RoundedRectangle(cornerRadius: .arcCornerRadiusSmall)
                .fill(color)
                .frame(width: 60, height: 40)
                .overlay(
                    RoundedRectangle(cornerRadius: .arcCornerRadiusSmall)
                        .stroke(ARCColorHelper.shadowMedium.opacity(0.2), lineWidth: 0.5)
                )
            
            VStack(alignment: .leading, spacing: 2) {
                Text(name)
                    .font(.arcFontBodyMedium)
                    .foregroundStyle(ARCColorHelper.textPrimary)
                Text("Preview")
                    .font(.arcFontBodySmall)
                    .foregroundStyle(ARCColorHelper.textSecondary)
            }
            Spacer()
        }
    }
}

@available(iOS 17.0, macOS 12.0, *)
private struct ARCDocFontRow: View {
    let name: String
    let font: Font
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(name)
                .font(.arcFontBodySmall)
                .foregroundStyle(ARCColorHelper.textSecondary)
            Text("The quick brown fox jumps over the lazy dog.")
                .font(font)
                .foregroundStyle(ARCColorHelper.textPrimary)
        }
    }
}

@available(iOS 17.0, macOS 12.0, *)
private struct ARCDocSpacingRow: View {
    let name: String
    let value: CGFloat
    
    var body: some View {
        VStack(alignment: .leading, spacing: .arcSpacingSmall) {
            Text("\(name) — \(Int(value))pt")
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
private struct ARCDocRadiusRow: View {
    let name: String
    let value: CGFloat
    
    var body: some View {
        VStack(alignment: .leading, spacing: .arcSpacingSmall) {
            Text("\(name) — \(Int(value))pt")
                .font(.arcFontBodySmall)
                .foregroundStyle(ARCColorHelper.textSecondary)
            RoundedRectangle(cornerRadius: value)
                .fill(ARCColorHelper.highlight.opacity(0.8))
                .frame(width: 100, height: 40)
        }
    }
}

@available(iOS 17.0, macOS 12.0, *)
private struct ARCDocAnimationRow: View {
    let name: String
    let animation: Animation
    
    @State private var isAnimating = false
    
    var body: some View {
        HStack(spacing: .arcSpacingMedium) {
            Circle()
                .fill(ARCColorHelper.highlight)
                .frame(width: 24, height: 24)
                .offset(x: isAnimating ? 80 : 0)
                .animation(animation.repeatForever(autoreverses: true), value: isAnimating)
                .onAppear { isAnimating = true }
            
            Text(name)
                .font(.arcFontBodySmall)
                .foregroundStyle(ARCColorHelper.textSecondary)
        }
        .frame(height: 40)
    }
}

//
// =====================================================
// MARK: - Preview
// =====================================================
//

@available(iOS 17.0, macOS 12.0, *)
#Preview("ARC Design System Documentation (Dark)") {
    ARCDesignSystemDocumentation()
        .preferredColorScheme(.dark)
}

@available(iOS 17.0, macOS 12.0, *)
#Preview("ARC Design System Documentation (Light)") {
    ARCDesignSystemDocumentation()
        .preferredColorScheme(.light)
}
