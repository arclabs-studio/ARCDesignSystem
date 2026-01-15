//
//  ReduceMotion+Helpers.swift
//  ARCDesignSystem
//
//  Created by ARC Labs Studio on 15/01/26.
//

import SwiftUI

// MARK: - Reduce Motion Helpers

// Accessibility helpers for respecting user motion preferences.
//
// These helpers provide convenient access to the system's "Reduce Motion"
// accessibility setting and enable building motion-aware UI components.
//
// Overview:
//
// Apple's Human Interface Guidelines recommend respecting the user's
// motion preferences. When "Reduce Motion" is enabled, apps should:
//
// - Minimize or eliminate animations
// - Use cross-fade transitions instead of sliding/zooming
// - Avoid parallax effects and screen movement
//
// Using the Environment Value:
//
//     struct MyView: View {
//         @Environment(\.arcReduceMotion) var reduceMotion
//
//         var body: some View {
//             if reduceMotion {
//                 staticContent
//             } else {
//                 animatedContent
//             }
//         }
//     }
//
// Using the View Modifier:
//
//     Image(systemName: "star")
//         .arcMotionSensitive(
//             reduced: { $0.opacity(isActive ? 1 : 0.5) },
//             full: { $0.arcSymbolEffect(.success, value: count) }
//         )
//
// Note: The built-in `arcSymbolEffect` modifiers already respect
// "Reduce Motion" automatically. These helpers are for custom animations.

// MARK: - Environment Key

private struct ARCReduceMotionKey: EnvironmentKey {
    static let defaultValue = false
}

extension EnvironmentValues {
    /// Whether the user prefers reduced motion.
    ///
    /// This is a convenience wrapper around `accessibilityReduceMotion`
    /// with the `arc` prefix for consistency with other ARC tokens.
    ///
    /// ```swift
    /// @Environment(\.arcReduceMotion) var reduceMotion
    /// ```
    public var arcReduceMotion: Bool {
        accessibilityReduceMotion
    }
}

// MARK: - View Modifiers

extension View {
    /// Conditionally applies different modifiers based on motion preference.
    ///
    /// Use this modifier when you need to provide alternative styling
    /// for users who prefer reduced motion.
    ///
    /// - Parameters:
    ///   - reduced: A closure that modifies the view when motion is reduced.
    ///   - full: A closure that modifies the view when full motion is enabled.
    /// - Returns: A view modified according to motion preferences.
    ///
    /// ```swift
    /// Image(systemName: "heart.fill")
    ///     .arcMotionSensitive(
    ///         reduced: { $0.scaleEffect(isLiked ? 1.0 : 0.8) },
    ///         full: { $0.symbolEffect(.bounce, value: likeCount) }
    ///     )
    /// ```
    public func arcMotionSensitive(
        @ViewBuilder reduced: @escaping (Self) -> some View,
        @ViewBuilder full: @escaping (Self) -> some View
    ) -> some View {
        modifier(ARCMotionSensitiveModifier(
            originalContent: self,
            reducedContent: reduced,
            fullContent: full
        ))
    }

    /// Applies a modifier only when full motion is enabled.
    ///
    /// When "Reduce Motion" is enabled, the view is returned unmodified.
    ///
    /// - Parameter transform: A closure that modifies the view.
    /// - Returns: The modified view or the original view if motion is reduced.
    ///
    /// ```swift
    /// myView
    ///     .arcIfMotionAllowed { view in
    ///         view.animation(.spring(), value: isExpanded)
    ///     }
    /// ```
    public func arcIfMotionAllowed(
        @ViewBuilder _ transform: @escaping (Self) -> some View
    ) -> some View {
        arcMotionSensitive(
            reduced: { $0 },
            full: transform
        )
    }

    /// Applies an animation only when full motion is enabled.
    ///
    /// This is a convenience modifier that wraps the standard `animation`
    /// modifier with a reduce-motion check.
    ///
    /// - Parameters:
    ///   - animation: The animation to apply.
    ///   - value: The value to watch for changes.
    /// - Returns: A view with motion-aware animation applied.
    ///
    /// ```swift
    /// Rectangle()
    ///     .frame(width: isExpanded ? 200 : 100)
    ///     .arcAnimationIfAllowed(.spring(), value: isExpanded)
    /// ```
    public func arcAnimationIfAllowed(
        _ animation: Animation?,
        value: some Equatable
    ) -> some View {
        modifier(ARCAnimationIfAllowedModifier(animation: animation, value: value))
    }
}

// MARK: - Private Modifiers

private struct ARCMotionSensitiveModifier<OriginalContent: View, Reduced: View, Full: View>: ViewModifier {
    let originalContent: OriginalContent
    let reducedContent: (OriginalContent) -> Reduced
    let fullContent: (OriginalContent) -> Full

    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    @ViewBuilder
    func body(content _: Content) -> some View {
        if reduceMotion {
            reducedContent(originalContent)
        } else {
            fullContent(originalContent)
        }
    }
}

private struct ARCAnimationIfAllowedModifier<V: Equatable>: ViewModifier {
    let animation: Animation?
    let value: V

    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    @ViewBuilder
    func body(content: Content) -> some View {
        if reduceMotion {
            content
        } else {
            content.animation(animation, value: value)
        }
    }
}
