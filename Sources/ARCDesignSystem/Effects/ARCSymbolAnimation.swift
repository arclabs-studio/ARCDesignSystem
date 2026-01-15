//
//  ARCSymbolAnimation.swift
//  ARCDesignSystem
//
//  Created by ARC Labs on 12/18/25.
//

import SwiftUI

/// View extensions for applying ARC symbol effects.
///
/// These modifiers provide a type-safe, accessibility-aware API for animating
/// SF Symbols using the presets defined in ``ARCSymbolEffect``.
///
/// ## Accessibility
///
/// All modifiers automatically check `accessibilityReduceMotion` and disable
/// animations when the user prefers reduced motion. The symbol remains fully
/// functional; only the animation is removed.
///
/// ## Modifier Selection Guide
///
/// | Effect Type | Modifier | Trigger |
/// |-------------|----------|---------|
/// | Indefinite | `arcSymbolEffect(_:isActive:)` | Boolean state |
/// | Discrete | `arcSymbolEffect(_:value:)` | Equatable change |
/// | Content | `arcContentTransition(_:)` | Symbol change |
/// | Transition | `arcTransition(_:)` | View insertion/removal |
///
/// ## Example Usage
///
/// ```swift
/// // Continuous effect while recording
/// Image(systemName: "record.circle")
///     .arcSymbolEffect(.inProgress, isActive: isRecording)
///
/// // One-shot effect when cart count changes
/// Image(systemName: "cart.badge.plus")
///     .arcSymbolEffect(.addItem, value: cartCount)
///
/// // Smooth transition between symbol variants
/// Image(systemName: isMuted ? "speaker.slash" : "speaker.wave.3")
///     .arcContentTransition(.smooth)
/// ```
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension View {
    // MARK: - Indefinite Effects

    /// Applies an indefinite symbol effect that animates while active.
    ///
    /// Use for continuous states like loading, syncing, or recording.
    /// The animation runs while `isActive` is `true` and stops when `false`.
    ///
    /// ```swift
    /// Image(systemName: "arrow.triangle.2.circlepath")
    ///     .arcSymbolEffect(.syncing, isActive: viewModel.isSyncing)
    /// ```
    ///
    /// - Parameters:
    ///   - effect: The symbol effect preset from ``ARCSymbolEffect``.
    ///   - isActive: Whether the effect should be animating.
    /// - Returns: A view with the symbol effect applied.
    ///
    /// - Note: Respects "Reduce Motion" accessibility setting automatically.
    @ViewBuilder
    public func arcSymbolEffect(
        _ effect: ARCSymbolEffect,
        isActive: Bool
    ) -> some View {
        switch effect {
        case .inProgress:
            modifier(ARCPulsingEffectModifier(isActive: isActive))
        case .hover:
            modifier(ARCScaleUpEffectModifier(isActive: isActive))
        case .syncing:
            modifier(ARCVariableColorSyncEffectModifier(isActive: isActive))
        case .searching:
            modifier(ARCVariableColorEffectModifier(isActive: isActive))
        case .breathing:
            modifier(ARCBreathingEffectModifier(isActive: isActive))
        case .spinning:
            modifier(ARCRotateEffectModifier(isActive: isActive))
        default:
            self
        }
    }

    // MARK: - Discrete Effects

    /// Applies a discrete symbol effect triggered by value changes.
    ///
    /// Use for one-shot feedback like success confirmations, errors, or updates.
    /// The animation plays each time `value` changes.
    ///
    /// ```swift
    /// Image(systemName: "checkmark.circle.fill")
    ///     .arcSymbolEffect(.success, value: saveCount)
    /// ```
    ///
    /// - Parameters:
    ///   - effect: The symbol effect preset from ``ARCSymbolEffect``.
    ///   - value: A value that triggers the effect when it changes.
    /// - Returns: A view with the symbol effect applied.
    ///
    /// - Note: Respects "Reduce Motion" accessibility setting automatically.
    @ViewBuilder
    public func arcSymbolEffect(
        _ effect: ARCSymbolEffect,
        value: some Equatable
    ) -> some View {
        switch effect {
        case .success:
            modifier(ARCBounceEffectModifier(trigger: value))
        case .addItem:
            modifier(ARCBounceDownEffectModifier(trigger: value))
        case .error:
            modifier(ARCBounceEffectModifier(trigger: value))
        case .update:
            modifier(ARCPulseEffectModifier(trigger: value))
        default:
            self
        }
    }

    // MARK: - Content Transitions

    /// Applies a content transition effect for symbol changes.
    ///
    /// Use when transitioning between different symbols or symbol variants.
    /// The transition animates smoothly when the symbol image changes.
    ///
    /// ```swift
    /// Image(systemName: isDarkMode ? "moon.stars" : "sun.max")
    ///     .arcContentTransition(.upward)
    /// ```
    ///
    /// - Parameter effect: The transition effect preset from ``ARCSymbolEffect``.
    /// - Returns: A view with the content transition applied.
    ///
    /// - Note: Respects "Reduce Motion" accessibility setting automatically.
    @ViewBuilder
    public func arcContentTransition(_ effect: ARCSymbolEffect) -> some View {
        switch effect {
        case .smooth:
            modifier(ARCReplaceTransitionModifier())
        case .upward:
            modifier(ARCUpwardTransitionModifier())
        case .layered:
            modifier(ARCLayeredTransitionModifier())
        default:
            self
        }
    }

    // MARK: - Appear/Disappear Transitions

    /// Applies a transition effect for symbol insertion/removal.
    ///
    /// Use when a symbol appears or disappears from the view hierarchy.
    /// Combine with conditional rendering and `withAnimation`.
    ///
    /// ```swift
    /// if showBadge {
    ///     Image(systemName: "circle.fill")
    ///         .arcTransition(.appear)
    /// }
    /// ```
    ///
    /// - Parameter effect: The transition effect preset from ``ARCSymbolEffect``.
    /// - Returns: A view with the transition applied.
    ///
    /// - Note: Respects "Reduce Motion" accessibility setting automatically.
    @ViewBuilder
    public func arcTransition(_ effect: ARCSymbolEffect) -> some View {
        switch effect {
        case .appear:
            modifier(ARCAppearTransitionModifier())
        default:
            self
        }
    }
}

// MARK: - Indefinite Effect Modifiers

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
private struct ARCPulsingEffectModifier: ViewModifier {
    let isActive: Bool
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    func body(content: Content) -> some View {
        if reduceMotion {
            content
        } else {
            content.symbolEffect(.pulse, isActive: isActive)
        }
    }
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
private struct ARCScaleUpEffectModifier: ViewModifier {
    let isActive: Bool
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    func body(content: Content) -> some View {
        if reduceMotion {
            content
        } else {
            content.symbolEffect(.scale.up, isActive: isActive)
        }
    }
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
private struct ARCVariableColorSyncEffectModifier: ViewModifier {
    let isActive: Bool
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    func body(content: Content) -> some View {
        if reduceMotion {
            content
        } else {
            content.symbolEffect(.variableColor.cumulative, isActive: isActive)
        }
    }
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
private struct ARCVariableColorEffectModifier: ViewModifier {
    let isActive: Bool
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    func body(content: Content) -> some View {
        if reduceMotion {
            content
        } else {
            content.symbolEffect(.variableColor.iterative.reversing, isActive: isActive)
        }
    }
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
private struct ARCBreathingEffectModifier: ViewModifier {
    let isActive: Bool
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    func body(content: Content) -> some View {
        if reduceMotion {
            content
        } else {
            if #available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, *) {
                content.symbolEffect(.breathe, isActive: isActive)
            } else {
                // Fallback to pulse effect on iOS 17
                content.symbolEffect(.pulse, isActive: isActive)
            }
        }
    }
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
private struct ARCRotateEffectModifier: ViewModifier {
    let isActive: Bool
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    func body(content: Content) -> some View {
        if reduceMotion {
            content
        } else {
            if #available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, *) {
                content.symbolEffect(.rotate, isActive: isActive)
            } else {
                // Fallback to variable color effect on iOS 17
                content.symbolEffect(.variableColor.cumulative, isActive: isActive)
            }
        }
    }
}

// MARK: - Discrete Effect Modifiers

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
private struct ARCBounceEffectModifier<T: Equatable>: ViewModifier {
    let trigger: T
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    func body(content: Content) -> some View {
        if reduceMotion {
            content
        } else {
            content.symbolEffect(.bounce, value: trigger)
        }
    }
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
private struct ARCBounceDownEffectModifier<T: Equatable>: ViewModifier {
    let trigger: T
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    func body(content: Content) -> some View {
        if reduceMotion {
            content
        } else {
            content.symbolEffect(.bounce.down, value: trigger)
        }
    }
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
private struct ARCPulseEffectModifier<T: Equatable>: ViewModifier {
    let trigger: T
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    func body(content: Content) -> some View {
        if reduceMotion {
            content
        } else {
            content.symbolEffect(.pulse, value: trigger)
        }
    }
}

// MARK: - Content Transition Modifiers

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
private struct ARCReplaceTransitionModifier: ViewModifier {
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    func body(content: Content) -> some View {
        if reduceMotion {
            content
        } else {
            content.contentTransition(.symbolEffect(.replace))
        }
    }
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
private struct ARCUpwardTransitionModifier: ViewModifier {
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    func body(content: Content) -> some View {
        if reduceMotion {
            content
        } else {
            content.contentTransition(.symbolEffect(.replace.upUp))
        }
    }
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
private struct ARCLayeredTransitionModifier: ViewModifier {
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    func body(content: Content) -> some View {
        if reduceMotion {
            content
        } else {
            content.contentTransition(.symbolEffect(.replace.byLayer))
        }
    }
}

// MARK: - Appear/Disappear Transition Modifiers

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
private struct ARCAppearTransitionModifier: ViewModifier {
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    func body(content: Content) -> some View {
        if reduceMotion {
            content
        } else {
            content.transition(.symbolEffect(.appear))
        }
    }
}

// MARK: - Symbol Effect Options Extensions

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension SymbolEffectOptions {
    // MARK: - ARC Speed Presets

    /// Very slow animation speed (0.5x).
    ///
    /// Use for calming, ambient effects or when you want to minimize distraction.
    public static var arcSpeedVerySlow: SymbolEffectOptions { .speed(0.5) }

    /// Slow animation speed (0.75x).
    ///
    /// Use for gentle transitions or extended processes.
    public static var arcSpeedSlow: SymbolEffectOptions { .speed(0.75) }

    /// Normal animation speed (1.0x).
    ///
    /// The default speed for most symbol effects.
    public static var arcSpeedNormal: SymbolEffectOptions { .speed(1.0) }

    /// Fast animation speed (1.5x).
    ///
    /// Use for snappy feedback that responds to user actions.
    public static var arcSpeedFast: SymbolEffectOptions { .speed(1.5) }

    /// Very fast animation speed (2.0x).
    ///
    /// Use for immediate, quick feedback moments.
    public static var arcSpeedVeryFast: SymbolEffectOptions { .speed(2.0) }
}
