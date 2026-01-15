//
//  ARCSymbolEffect.swift
//  ARCDesignSystem
//
//  Created by ARC Labs on 12/18/25.
//

import SwiftUI

/// Symbol effect presets for the ARC Design System.
///
/// ARCSymbolEffect provides semantic, intention-based symbol animations
/// that integrate with Apple's SF Symbols animation framework (iOS 17+).
/// Effects are organized by behavior type for intuitive selection.
///
/// ## Effect Categories
///
/// Effects are grouped into four categories matching Apple's Symbols framework:
///
/// - **Indefinite Effects**: Continuous animations while active (loading, syncing)
/// - **Discrete Effects**: One-shot animations triggered by value changes (success, error)
/// - **Content Transition Effects**: Smooth transitions between symbol variants
/// - **Transition Effects**: Animations when symbols appear/disappear
///
/// ## Semantic Naming
///
/// Effect names describe **intent**, not implementation:
/// - `.inProgress` not `.breathe`
/// - `.success` not `.bounce`
/// - `.error` not `.wiggle`
///
/// This allows implementation details to change without breaking API contracts.
///
/// ## Accessibility
///
/// All effects automatically respect the user's "Reduce Motion" preference.
/// When enabled, animations are disabled while maintaining symbol functionality.
///
/// ## Example Usage
///
/// ```swift
/// // Indefinite effect (continuous while active)
/// Image(systemName: "arrow.triangle.2.circlepath")
///     .arcSymbolEffect(.syncing, isActive: isSyncing)
///
/// // Discrete effect (triggered by value change)
/// Image(systemName: "checkmark.circle")
///     .arcSymbolEffect(.success, value: completionCount)
///
/// // Content transition (symbol variant change)
/// Image(systemName: isMuted ? "speaker.slash" : "speaker.wave.3")
///     .arcContentTransition(.smooth)
/// ```
///
/// - Note: Requires iOS 17+, macOS 14+, tvOS 17+, or watchOS 10+.
///   Earlier platforms will display static symbols without animation.
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
public enum ARCSymbolEffect: CaseIterable, Sendable {
    // MARK: - Indefinite Effects

    /// Indicates an ongoing process like recording or downloading.
    ///
    /// A gentle, rhythmic pulse that draws attention without being distracting.
    /// Best for states that require user awareness but not immediate action.
    ///
    /// - Example: Recording indicator, file upload progress
    case inProgress

    /// Indicates hover or focus state.
    ///
    /// A subtle scale-up effect that provides visual feedback for interactive elements.
    /// Ideal for macOS hover states or focus indicators on tvOS.
    ///
    /// - Example: Button hover, focus ring enhancement
    case hover

    /// Indicates active synchronization or data loading.
    ///
    /// A continuous rotation that clearly communicates background activity.
    /// Use sparingly as rotation can be visually demanding.
    ///
    /// - Example: Cloud sync, data refresh
    case syncing

    /// Indicates active searching or scanning.
    ///
    /// An iterative variable color effect that shows ongoing discovery.
    /// Works especially well with multi-layer symbols like wifi or signal bars.
    ///
    /// - Example: Network scanning, Bluetooth discovery
    case searching

    /// Indicates a live or active session.
    ///
    /// A smooth breathing animation that conveys ongoing activity with a living quality.
    /// Use for recording sessions, live broadcasts, or meditation/mindfulness features.
    ///
    /// - Note: Requires iOS 18+, macOS 15+, tvOS 18+, or watchOS 11+.
    /// - Example: Live recording indicator, active meditation session
    case breathing

    /// Indicates continuous rotation or spinning.
    ///
    /// A rotation animation that imitates real-world spinning objects.
    /// Ideal for fan controls, loading spinners, or refresh indicators.
    ///
    /// - Note: Requires iOS 18+, macOS 15+, tvOS 18+, or watchOS 11+.
    /// - Example: Fan speed control, processing indicator
    case spinning

    // MARK: - Discrete Effects

    /// Confirms a successful action.
    ///
    /// A single, satisfying bounce that provides positive feedback.
    /// Use for completed actions, successful validations, or confirmations.
    ///
    /// - Example: Form submission success, item saved
    case success

    /// Confirms an item was added to a collection.
    ///
    /// A double bounce effect that emphasizes addition.
    /// Use for add-to-cart, favorite, bookmark, or similar collection actions.
    ///
    /// - Example: Add to cart, add to favorites
    case addItem

    /// Indicates an error or validation failure.
    ///
    /// A shake/wiggle effect that draws attention to problems.
    /// Use sparingly and always provide additional context (text, color).
    ///
    /// - Example: Form validation error, action failed
    case error

    /// Indicates content has been updated.
    ///
    /// A subtle pulse that acknowledges change without demanding attention.
    /// Use for background updates or minor state changes.
    ///
    /// - Example: Notification badge update, data refresh complete
    case update

    // MARK: - Content Transitions

    /// Smart automatic transition between symbols.
    ///
    /// Lets the system choose the optimal transition based on symbol similarity.
    /// The best default choice for most symbol changes.
    ///
    /// - Example: play/pause toggle, bell/bell.slash
    case smooth

    /// Upward directional transition.
    ///
    /// Both outgoing and incoming symbols animate upward.
    /// Use for "progress" or "improvement" semantics.
    ///
    /// - Example: Dark/light mode toggle, volume increase
    case upward

    /// Layered transition effect.
    ///
    /// Animates symbol layers individually for a more dramatic effect.
    /// Best for multi-layer symbols where layer-by-layer animation adds meaning.
    ///
    /// - Example: Network status changes, complex state indicators
    case layered

    // MARK: - Appear/Disappear Transitions

    /// Standard appear/disappear transition.
    ///
    /// A clean animation for symbols entering or leaving the view hierarchy.
    /// Use with SwiftUI's `.transition()` modifier.
    ///
    /// - Example: Notification badge appearing, status indicator
    case appear
}

// MARK: - Effect Classification

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension ARCSymbolEffect {
    /// Whether this effect is indefinite (continuous) or discrete (one-shot).
    public var isIndefinite: Bool {
        switch self {
        case .inProgress, .hover, .syncing, .searching, .breathing, .spinning:
            true
        default:
            false
        }
    }

    /// Whether this effect is discrete (one-shot triggered by value changes).
    public var isDiscrete: Bool {
        switch self {
        case .success, .addItem, .error, .update:
            true
        default:
            false
        }
    }

    /// Whether this effect is a content transition.
    public var isContentTransition: Bool {
        switch self {
        case .smooth, .upward, .layered:
            true
        default:
            false
        }
    }

    /// Whether this effect is an appear/disappear transition.
    public var isTransition: Bool {
        switch self {
        case .appear:
            true
        default:
            false
        }
    }
}
