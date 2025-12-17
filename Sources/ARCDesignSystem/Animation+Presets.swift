//
//  Animation+Presets.swift
//  ARCDesignSystem
//
//  Created by ARC Labs on 4/11/25.
//

import SwiftUI

/// Animation presets for the ARC Design System.
///
/// Consistent animation timing creates a polished, cohesive user experience.
/// These presets cover common interaction patterns from quick feedback to
/// smooth transitions.
///
/// ## Available Animation Tokens
///
/// - ``arcAnimationBase``: Standard transitions (0.25s ease-in-out)
/// - ``arcAnimationSmooth``: Slower, elegant transitions (0.35s ease-in-out)
/// - ``arcAnimationQuick``: Snappy spring animation for immediate feedback
///
/// ## Example Usage
///
/// ```swift
/// @State private var isExpanded = false
///
/// Rectangle()
///     .frame(width: isExpanded ? 200 : 100, height: 100)
///     .animation(.arcAnimationBase, value: isExpanded)
/// ```
///
/// - Note: Use animations consistently throughout your app to maintain
///   a unified feel. Prefer `.arcAnimationBase` for most interactions.
extension Animation {
    /// Base animation preset (0.25s ease-in-out).
    ///
    /// Standard animation for most UI transitions, state changes,
    /// and interactive elements. This is the default choice.
    ///
    /// - Returns: Ease-in-out animation with 0.25 second duration.
    public static let arcAnimationBase = Animation.easeInOut(duration: 0.25)

    /// Smooth animation preset (0.35s ease-in-out).
    ///
    /// Slower, more elegant animation for large transitions, screen changes,
    /// or when you want to draw attention to the movement.
    ///
    /// - Returns: Ease-in-out animation with 0.35 second duration.
    public static let arcAnimationSmooth = Animation.easeInOut(duration: 0.35)

    /// Quick spring animation preset.
    ///
    /// Snappy, bouncy animation perfect for button presses, toggles,
    /// and immediate user feedback.
    ///
    /// - Returns: Spring animation with 0.25s response and 0.8 damping.
    public static let arcAnimationQuick = Animation.spring(response: 0.25, dampingFraction: 0.8)
}
