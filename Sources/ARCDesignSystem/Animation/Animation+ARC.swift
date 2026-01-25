//
//  Animation+ARC.swift
//  ARCDesignSystem
//
//  Created by ARC Labs on 1/24/26.
//

import SwiftUI

/// ARC Design System animation tokens.
///
/// These animations follow Apple HIG recommendations for timing and feel.
/// All tokens include automatic Reduce Motion fallbacks.
///
/// ## Usage Philosophy
///
/// For most animations, use SwiftUI's native animations directly:
/// ```swift
/// withAnimation(.spring()) { ... }
/// view.animation(.easeInOut, value: state)
/// ```
///
/// Use ARC tokens when you need:
/// - Consistent timing across the app
/// - Automatic Reduce Motion fallbacks
/// - Semantic animation names
///
/// ## Example
///
/// ```swift
/// // Standard approach with ARC animation
/// withAnimation(.arcStandard) {
///     isExpanded.toggle()
/// }
///
/// // Accessibility-aware approach
/// view.arcAnimation(.arcSpring, value: state)
/// ```
///
/// - Note: These animations complement SwiftUI's native offerings.
///   Use `.spring()`, `.easeInOut`, etc. when default behavior is sufficient.
extension Animation {
    // MARK: - Base Animations

    /// Standard animation for most UI transitions.
    ///
    /// Duration: 0.25s with ease-in-out curve.
    /// Use for state changes, view updates, and general transitions.
    public static let arcStandard: Animation = .easeInOut(duration: 0.25)

    /// Quick animation for small, frequent interactions.
    ///
    /// Duration: 0.15s with ease-out curve.
    /// Use for button presses, selections, and micro-interactions.
    public static let arcQuick: Animation = .easeOut(duration: 0.15)

    /// Smooth animation for larger transitions.
    ///
    /// Duration: 0.35s with ease-in-out curve.
    /// Use for page transitions, expanding content, and modals.
    public static let arcSmooth: Animation = .easeInOut(duration: 0.35)

    /// Slow animation for emphasis or dramatic effect.
    ///
    /// Duration: 0.5s with ease-in-out curve.
    /// Use for onboarding, first-launch experiences, or focus attention.
    public static let arcSlow: Animation = .easeInOut(duration: 0.5)

    // MARK: - Spring Animations

    /// Interactive spring animation.
    ///
    /// Response: 0.3s, Damping: 0.7
    /// Use for interactive elements like buttons, toggles, and swipes.
    public static let arcSpring: Animation = .spring(response: 0.3, dampingFraction: 0.7)

    /// Bouncy spring animation.
    ///
    /// Response: 0.4s, Damping: 0.6
    /// Use for playful interactions, notifications, or emphasis.
    public static let arcBouncy: Animation = .spring(response: 0.4, dampingFraction: 0.6)

    /// Gentle spring animation.
    ///
    /// Response: 0.5s, Damping: 0.8
    /// Use for smooth, gentle movements without bounce.
    public static let arcGentle: Animation = .spring(response: 0.5, dampingFraction: 0.8)

    /// Snappy spring animation.
    ///
    /// Response: 0.2s, Damping: 0.75
    /// Use for quick, responsive feedback.
    public static let arcSnappy: Animation = .spring(response: 0.2, dampingFraction: 0.75)

    // MARK: - Accessibility-Aware

    /// The recommended default animation.
    ///
    /// Returns `arcStandard` when motion is allowed, or a minimal
    /// animation when Reduce Motion is enabled.
    ///
    /// - Note: Check `ARCAccessibility.isReduceMotionEnabled` for the current setting.
    public static var arcDefault: Animation {
        ARCAccessibility.isReduceMotionEnabled
            ? .linear(duration: 0.1)
            : .arcStandard
    }

    /// The recommended interactive animation.
    ///
    /// Returns `arcSpring` when motion is allowed, or a minimal
    /// animation when Reduce Motion is enabled.
    public static var arcInteractive: Animation {
        ARCAccessibility.isReduceMotionEnabled
            ? .linear(duration: 0.05)
            : .arcSpring
    }
}

// MARK: - Animation Durations

/// Standard animation durations.
///
/// Use these with custom animations when you need specific timing.
public enum ARCAnimationDuration {
    /// Instant: 0.0s (no animation)
    public static let instant: Double = 0.0

    /// Minimal: 0.1s (for reduce motion)
    public static let minimal: Double = 0.1

    /// Quick: 0.15s (micro-interactions)
    public static let quick: Double = 0.15

    /// Standard: 0.25s (most transitions)
    public static let standard: Double = 0.25

    /// Smooth: 0.35s (larger transitions)
    public static let smooth: Double = 0.35

    /// Slow: 0.5s (emphasis)
    public static let slow: Double = 0.5

    /// Extended: 1.0s (dramatic)
    public static let extended: Double = 1.0
}

// MARK: - View Extension

extension View {
    /// Applies an animation that respects Reduce Motion settings.
    ///
    /// When Reduce Motion is enabled, uses a minimal animation instead.
    ///
    /// - Parameters:
    ///   - animation: The animation to use when motion is allowed.
    ///   - value: The value to monitor for changes.
    /// - Returns: A view with the appropriate animation applied.
    ///
    /// ## Example
    ///
    /// ```swift
    /// Rectangle()
    ///     .arcAnimation(.arcSpring, value: isExpanded)
    /// ```
    public func arcAnimation(
        _ animation: Animation?,
        value: some Equatable
    ) -> some View {
        modifier(ARCAnimationModifier(animation: animation, value: value))
    }
}

// MARK: - Animation Modifiers

private struct ARCAnimationModifier<V: Equatable>: ViewModifier {
    let animation: Animation?
    let value: V

    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    func body(content: Content) -> some View {
        content.animation(
            reduceMotion ? .linear(duration: 0.1) : animation,
            value: value
        )
    }
}

// MARK: - withAnimation Helpers

/// Performs an animation that respects Reduce Motion settings.
///
/// When Reduce Motion is enabled, the change happens instantly without animation.
///
/// - Parameters:
///   - animation: The animation to use when motion is allowed.
///   - body: The changes to animate.
///
/// ## Example
///
/// ```swift
/// arcWithAnimation(.arcSpring) {
///     isExpanded.toggle()
/// }
/// ```
public func arcWithAnimation<Result>(
    _ animation: Animation? = .arcDefault,
    _ body: () throws -> Result
) rethrows -> Result {
    let effectiveAnimation = ARCAccessibility.isReduceMotionEnabled
        ? nil
        : animation
    return try withAnimation(effectiveAnimation, body)
}
