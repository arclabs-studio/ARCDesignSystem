//
//  Animation+Presets.swift
//  ARCDesignSystem
//
//  Created by ARC Labs on 4/11/25.
//

import SwiftUI
#if canImport(UIKit)
import UIKit
#endif

/// Animation presets for the ARC Design System.
///
/// Consistent animation timing creates a polished, cohesive user experience.
/// These presets cover common interaction patterns from quick feedback to
/// smooth transitions.
///
/// All animations automatically respect the "Reduce Motion" accessibility setting
/// by providing instant or simplified alternatives when enabled.
///
/// ## Available Animation Tokens
///
/// - ``arcAnimationBase``: Standard transitions (0.25s ease-in-out)
/// - ``arcAnimationSmooth``: Slower, elegant transitions (0.35s ease-in-out)
/// - ``arcAnimationQuick``: Snappy spring animation for immediate feedback
/// - ``arcAnimationNone``: Instant animation (no motion)
///
/// ## Accessibility
///
/// Use ``arcAnimationReduced(_:)`` to get an accessibility-aware animation:
///
/// ```swift
/// .animation(.arcAnimationReduced(.arcAnimationBase), value: isExpanded)
/// ```
///
/// This returns the original animation normally, or `.arcAnimationNone`
/// when the user has "Reduce Motion" enabled.
///
/// ## Example Usage
///
/// ```swift
/// @State private var isExpanded = false
///
/// Rectangle()
///     .frame(width: isExpanded ? 200 : 100, height: 100)
///     .animation(.arcAnimationReduced(.arcAnimationBase), value: isExpanded)
/// ```
///
/// - Note: Use animations consistently throughout your app to maintain
///   a unified feel. Prefer `.arcAnimationBase` for most interactions.
extension Animation {
    // MARK: - Standard Animations

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

    /// No animation (instant transition).
    ///
    /// Use for immediate state changes without any animation.
    /// This is automatically used when "Reduce Motion" is enabled.
    ///
    /// - Returns: A linear animation with zero duration.
    public static let arcAnimationNone = Animation.linear(duration: 0)

    // MARK: - Accessibility-Aware Animations

    /// Returns an accessibility-aware animation.
    ///
    /// When "Reduce Motion" is enabled in Accessibility settings, returns
    /// `.arcAnimationNone` for an instant transition. Otherwise returns
    /// the provided animation unchanged.
    ///
    /// ```swift
    /// .animation(.arcAnimationReduced(.arcAnimationSmooth), value: state)
    /// ```
    ///
    /// - Parameter animation: The animation to use when motion is allowed.
    /// - Returns: The original animation, or `.arcAnimationNone` if reduced motion is preferred.
    public static func arcAnimationReduced(_ animation: Animation) -> Animation {
        #if canImport(UIKit)
        if UIAccessibility.isReduceMotionEnabled {
            return .arcAnimationNone
        }
        #endif
        return animation
    }

    /// Base animation that respects "Reduce Motion" setting.
    ///
    /// - Returns: `.arcAnimationBase` normally, or `.arcAnimationNone` with reduced motion.
    public static var arcAnimationBaseReduced: Animation {
        arcAnimationReduced(.arcAnimationBase)
    }

    /// Smooth animation that respects "Reduce Motion" setting.
    ///
    /// - Returns: `.arcAnimationSmooth` normally, or `.arcAnimationNone` with reduced motion.
    public static var arcAnimationSmoothReduced: Animation {
        arcAnimationReduced(.arcAnimationSmooth)
    }

    /// Quick animation that respects "Reduce Motion" setting.
    ///
    /// - Returns: `.arcAnimationQuick` normally, or `.arcAnimationNone` with reduced motion.
    public static var arcAnimationQuickReduced: Animation {
        arcAnimationReduced(.arcAnimationQuick)
    }
}
