//
//  AnimationPresetsTests.swift
//  ARCDesignSystem
//
//  Created by ARC Labs on 4/11/25.
//

import SwiftUI
import Testing
@testable import ARCDesignSystem

@Suite("Animation Presets Tests")
struct AnimationPresetsTests {
    @Test("Base animation is accessible")
    func baseAnimationIsAccessible() {
        let animation = Animation.arcAnimationBase
        let expected = Animation.easeInOut(duration: 0.25)

        #expect(animation == expected, "Base animation should be easeInOut with 0.25s duration")
    }

    @Test("Smooth animation is accessible")
    func smoothAnimationIsAccessible() {
        let animation = Animation.arcAnimationSmooth
        let expected = Animation.easeInOut(duration: 0.35)

        #expect(animation == expected, "Smooth animation should be easeInOut with 0.35s duration")
    }

    @Test("Quick animation is accessible")
    func quickAnimationIsAccessible() {
        let animation = Animation.arcAnimationQuick
        let expected = Animation.spring(response: 0.25, dampingFraction: 0.8)

        #expect(animation == expected, "Quick animation should be spring with 0.25s response")
    }

    @Test("All animation presets are accessible")
    func allAnimationPresetsAreAccessible() {
        // Test that all animations can be accessed without issues
        let animations = [
            Animation.arcAnimationBase,
            Animation.arcAnimationSmooth,
            Animation.arcAnimationQuick,
        ]

        #expect(animations.count == 3, "Should have 3 animation presets")
    }
}
