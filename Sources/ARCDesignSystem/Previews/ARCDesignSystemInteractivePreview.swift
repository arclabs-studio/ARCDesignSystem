//
//  ARCDesignSystemInteractivePreview.swift
//  ARCDesignSystem
//
//  Created by ARC Labs on 4/11/25.
//

import SwiftUI

@available(iOS 15.0, *)
public struct ARCDesignSystemInteractivePreview: View {
    
    // MARK: - State
    
    @State private var colorScheme: ColorScheme = .light
    @State private var textScale: DynamicTypeSize = .medium
    
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
