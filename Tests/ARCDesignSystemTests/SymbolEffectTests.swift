//
//  SymbolEffectTests.swift
//  ARCDesignSystem
//
//  Created by ARC Labs on 12/18/25.
//

import SwiftUI
import Testing
@testable import ARCDesignSystem

// Note: ARCSymbolEffect requires iOS 17.0+, macOS 14.0+, tvOS 17.0+, watchOS 10.0+
// Tests use runtime availability checks to ensure compatibility.

@Suite("Symbol Effect Tests")
struct SymbolEffectTests {
    // MARK: - Indefinite Effects

    @Test("InProgress effect is indefinite")
    func inProgressEffectIsIndefinite() {
        guard #available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *) else {
            return
        }
        let effect = ARCSymbolEffect.inProgress
        #expect(effect.isIndefinite == true, "inProgress should be an indefinite effect")
        #expect(effect.isDiscrete == false, "inProgress should not be discrete")
    }

    @Test("Hover effect is indefinite")
    func hoverEffectIsIndefinite() {
        guard #available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *) else {
            return
        }
        let effect = ARCSymbolEffect.hover
        #expect(effect.isIndefinite == true, "hover should be an indefinite effect")
        #expect(effect.isDiscrete == false, "hover should not be discrete")
    }

    @Test("Syncing effect is indefinite")
    func syncingEffectIsIndefinite() {
        guard #available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *) else {
            return
        }
        let effect = ARCSymbolEffect.syncing
        #expect(effect.isIndefinite == true, "syncing should be an indefinite effect")
        #expect(effect.isDiscrete == false, "syncing should not be discrete")
    }

    @Test("Searching effect is indefinite")
    func searchingEffectIsIndefinite() {
        guard #available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *) else {
            return
        }
        let effect = ARCSymbolEffect.searching
        #expect(effect.isIndefinite == true, "searching should be an indefinite effect")
        #expect(effect.isDiscrete == false, "searching should not be discrete")
    }

    @Test("Breathing effect is indefinite")
    func breathingEffectIsIndefinite() {
        guard #available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *) else {
            return
        }
        let effect = ARCSymbolEffect.breathing
        #expect(effect.isIndefinite == true, "breathing should be an indefinite effect")
        #expect(effect.isDiscrete == false, "breathing should not be discrete")
    }

    @Test("Spinning effect is indefinite")
    func spinningEffectIsIndefinite() {
        guard #available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *) else {
            return
        }
        let effect = ARCSymbolEffect.spinning
        #expect(effect.isIndefinite == true, "spinning should be an indefinite effect")
        #expect(effect.isDiscrete == false, "spinning should not be discrete")
    }

    // MARK: - Discrete Effects

    @Test("Success effect is discrete")
    func successEffectIsDiscrete() {
        guard #available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *) else {
            return
        }
        let effect = ARCSymbolEffect.success
        #expect(effect.isDiscrete == true, "success should be a discrete effect")
        #expect(effect.isIndefinite == false, "success should not be indefinite")
    }

    @Test("AddItem effect is discrete")
    func addItemEffectIsDiscrete() {
        guard #available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *) else {
            return
        }
        let effect = ARCSymbolEffect.addItem
        #expect(effect.isDiscrete == true, "addItem should be a discrete effect")
        #expect(effect.isIndefinite == false, "addItem should not be indefinite")
    }

    @Test("Error effect is discrete")
    func errorEffectIsDiscrete() {
        guard #available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *) else {
            return
        }
        let effect = ARCSymbolEffect.error
        #expect(effect.isDiscrete == true, "error should be a discrete effect")
        #expect(effect.isIndefinite == false, "error should not be indefinite")
    }

    @Test("Update effect is discrete")
    func updateEffectIsDiscrete() {
        guard #available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *) else {
            return
        }
        let effect = ARCSymbolEffect.update
        #expect(effect.isDiscrete == true, "update should be a discrete effect")
        #expect(effect.isIndefinite == false, "update should not be indefinite")
    }

    // MARK: - Content Transitions

    @Test("Smooth effect is content transition")
    func smoothEffectIsContentTransition() {
        guard #available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *) else {
            return
        }
        let effect = ARCSymbolEffect.smooth
        #expect(effect.isContentTransition == true, "smooth should be a content transition")
        #expect(effect.isIndefinite == false, "smooth should not be indefinite")
        #expect(effect.isDiscrete == false, "smooth should not be discrete")
    }

    @Test("Upward effect is content transition")
    func upwardEffectIsContentTransition() {
        guard #available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *) else {
            return
        }
        let effect = ARCSymbolEffect.upward
        #expect(effect.isContentTransition == true, "upward should be a content transition")
        #expect(effect.isIndefinite == false, "upward should not be indefinite")
    }

    @Test("Layered effect is content transition")
    func layeredEffectIsContentTransition() {
        guard #available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *) else {
            return
        }
        let effect = ARCSymbolEffect.layered
        #expect(effect.isContentTransition == true, "layered should be a content transition")
        #expect(effect.isIndefinite == false, "layered should not be indefinite")
    }

    // MARK: - Transition Effects

    @Test("Appear effect is transition")
    func appearEffectIsTransition() {
        guard #available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *) else {
            return
        }
        let effect = ARCSymbolEffect.appear
        #expect(effect.isTransition == true, "appear should be a transition effect")
        #expect(effect.isIndefinite == false, "appear should not be indefinite")
        #expect(effect.isDiscrete == false, "appear should not be discrete")
    }

    // MARK: - Effect Classification

    @Test("All effects are accessible via CaseIterable")
    func allEffectsAccessible() {
        guard #available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *) else {
            return
        }
        let allEffects = ARCSymbolEffect.allCases
        #expect(allEffects.count == 14, "Should have 14 symbol effect presets")
    }

    @Test("Effects are correctly categorized as indefinite")
    func effectsCorrectlyCategorizedAsIndefinite() {
        guard #available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *) else {
            return
        }
        let indefiniteEffects: [ARCSymbolEffect] = [.inProgress, .hover, .syncing, .searching, .breathing, .spinning]
        let nonIndefiniteEffects: [ARCSymbolEffect] = [
            .success, .addItem, .error, .update,
            .smooth, .upward, .layered, .appear
        ]

        for effect in indefiniteEffects {
            #expect(effect.isIndefinite == true, "\(effect) should be indefinite")
        }

        for effect in nonIndefiniteEffects {
            #expect(effect.isIndefinite == false, "\(effect) should not be indefinite")
        }
    }

    @Test("Effects are correctly categorized as discrete")
    func effectsCorrectlyCategorizedAsDiscrete() {
        guard #available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *) else {
            return
        }
        let discreteEffects: [ARCSymbolEffect] = [.success, .addItem, .error, .update]
        let nonDiscreteEffects: [ARCSymbolEffect] = [
            .inProgress, .hover, .syncing, .searching, .breathing, .spinning,
            .smooth, .upward, .layered, .appear
        ]

        for effect in discreteEffects {
            #expect(effect.isDiscrete == true, "\(effect) should be discrete")
        }

        for effect in nonDiscreteEffects {
            #expect(effect.isDiscrete == false, "\(effect) should not be discrete")
        }
    }

    @Test("Effects are correctly categorized as content transitions")
    func effectsCorrectlyCategorizedAsContentTransition() {
        guard #available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *) else {
            return
        }
        let contentTransitionEffects: [ARCSymbolEffect] = [.smooth, .upward, .layered]
        let nonContentTransitionEffects: [ARCSymbolEffect] = [
            .inProgress, .hover, .syncing, .searching, .breathing, .spinning,
            .success, .addItem, .error, .update, .appear
        ]

        for effect in contentTransitionEffects {
            #expect(effect.isContentTransition == true, "\(effect) should be content transition")
        }

        for effect in nonContentTransitionEffects {
            #expect(effect.isContentTransition == false, "\(effect) should not be content transition")
        }
    }

    @Test("Effects are mutually exclusive categories")
    func effectsAreMutuallyExclusive() {
        guard #available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *) else {
            return
        }
        for effect in ARCSymbolEffect.allCases {
            var categoryCount = 0
            if effect.isIndefinite { categoryCount += 1 }
            if effect.isDiscrete { categoryCount += 1 }
            if effect.isContentTransition { categoryCount += 1 }
            if effect.isTransition { categoryCount += 1 }

            #expect(categoryCount == 1, "\(effect) should belong to exactly one category")
        }
    }
}

// MARK: - Symbol Effect Options Tests

@Suite("Symbol Effect Options Tests")
struct SymbolEffectOptionsTests {
    @Test("Speed presets are accessible")
    func speedPresetsAreAccessible() {
        guard #available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *) else {
            return
        }
        // Verify all speed presets can be accessed without crashing
        _ = SymbolEffectOptions.arcSpeedVerySlow
        _ = SymbolEffectOptions.arcSpeedSlow
        _ = SymbolEffectOptions.arcSpeedNormal
        _ = SymbolEffectOptions.arcSpeedFast
        _ = SymbolEffectOptions.arcSpeedVeryFast

        // If we got here, all presets are accessible
        #expect(Bool(true), "All speed presets should be accessible")
    }
}
