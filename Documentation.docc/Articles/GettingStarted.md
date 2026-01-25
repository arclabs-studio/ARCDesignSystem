# Getting Started

Learn how to integrate ARCDesignSystem into your SwiftUI application.

## Overview

ARCDesignSystem is designed to complement SwiftUI, not replace it. Use native SwiftUI APIs for typography, primary colors, and animations. Use ARC tokens for spacing, extended colors, brand identity, and accessibility.

## Installation

Add ARCDesignSystem to your Swift package dependencies:

```swift
dependencies: [
    .package(url: "https://github.com/arclabs-studio/ARCDesignSystem", from: "2.0.0")
]
```

Or in Xcode: **File → Add Packages...** and enter the repository URL.

### Register Brand Font

Register the Radley Sans brand font early in your app lifecycle:

```swift
import ARCDesignSystem

@main
struct MyApp: App {
    init() {
        ARCBrandFont.registerFonts()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```

## Basic Usage

### Brand Colors

Use ARC Labs Studio brand colors with automatic Light/Dark mode support:

```swift
// Brand accent for primary elements
Button("Get Started") { }
    .tint(.arcBrandGold)

// Logo or brand elements
Image("logo")
    .foregroundStyle(.arcBrandBurgundy)

// App-wide accent color
ContentView()
    .tint(.arcBrandGold)
```

### Brand Typography

Use the Radley Sans font for brand elements:

```swift
// Dynamic Type support (recommended)
Text("Welcome to ARC Labs")
    .font(.arcBrandFont(.title))
    .foregroundStyle(.arcBrandBurgundy)

// Fixed size
Text("Studio")
    .font(.arcBrandFont(size: 48))
```

### Creating a Card with Dynamic Type Support

Use `@ScaledMetric` to ensure spacing scales with Dynamic Type:

```swift
import SwiftUI
import ARCDesignSystem

struct ContentCard: View {
    @ScaledMetric(relativeTo: .body) var padding = CGFloat.arcSpacingLarge
    @ScaledMetric(relativeTo: .body) var spacing = CGFloat.arcSpacingMedium

    var body: some View {
        VStack(alignment: .leading, spacing: spacing) {
            Text("Title")
                .font(.headline)          // Native SwiftUI
                .foregroundStyle(.primary) // Native SwiftUI

            Text("Description")
                .font(.body)
                .foregroundStyle(.secondary) // Native SwiftUI

            Text("Fine print")
                .font(.caption)
                .foregroundStyle(.arcTextTertiary) // ARC token
        }
        .padding(padding)
        .background(.arcBackgroundSecondary)
        .clipShape(RoundedRectangle(cornerRadius: .arcCornerRadiusMedium))
    }
}
```

### Symbol Effects

Apply semantic animations to SF Symbols:

```swift
// Indefinite effect (continuous while active)
Image(systemName: "arrow.triangle.2.circlepath")
    .arcSymbolEffect(.syncing, isActive: isSyncing)

// Discrete effect (triggered by value change)
Image(systemName: "checkmark.circle")
    .arcSymbolEffect(.success, value: completionCount)

// Content transition (symbol variant change)
Image(systemName: isMuted ? "speaker.slash" : "speaker.wave.3")
    .arcContentTransition(.smooth)
```

### Material Backgrounds

Add blur effects with convenience modifiers:

```swift
Text("Floating Card")
    .padding()
    .arcMaterialBackground(.arcRegular, cornerRadius: .arcCornerRadiusMedium)
```

### Accessibility-Aware Animations

Use ARC animation tokens that automatically respect Reduce Motion settings:

```swift
// Animation that respects Reduce Motion
withAnimation(.arcDefault) {
    isExpanded.toggle()
}

// View modifier approach
Rectangle()
    .arcAnimation(.arcSpring, value: isExpanded)

// Manual check
let animation = ARCAccessibility.animation(.arcSpring)
```

### Contrast Validation

Validate color combinations meet WCAG 2.1 accessibility standards:

```swift
// Check contrast ratio
let ratio = ARCContrastCalculator.contrastRatio(
    foreground: .arcBrandBurgundy,
    background: .white
)

// Validate against WCAG AA
let passesAA = ARCContrastCalculator.meetsWCAG(
    foreground: .arcBrandBurgundy,
    background: .white,
    level: .AA,
    isLargeText: false
)

// Get full validation result
let result = ARCContrastCalculator.validate(
    foreground: .arcBrandGold,
    background: .black
)
print(result.ratioDescription)  // "8.92:1"
print(result.meetsAA)           // true
```

### Touch Targets

Ensure interactive elements meet platform-specific minimum sizes:

```swift
Button("Tap Me") { }
    .frame(
        minWidth: .arcTouchTargetMinimum,
        minHeight: .arcTouchTargetMinimum
    )

// Platform-specific targets
#if os(visionOS)
let targetSize = CGFloat.arcTouchTargetVisionOS  // 60pt
#elseif os(watchOS)
let targetSize = CGFloat.arcTouchTargetWatchOS   // 38pt
#else
let targetSize = CGFloat.arcTouchTargetMinimum   // 44pt
#endif
```

## Best Practices

### Do Use Native SwiftUI For

- **System fonts**: `.font(.body)`, `.font(.title)`, etc.
- **Primary/Secondary colors**: `.foregroundStyle(.primary)`, `.secondary`
- **Accent colors**: `.tint(.blue)`, `.accentColor`
- **Basic animations**: `.withAnimation(.spring())`, `.smooth`, `.snappy`
- **Environment values**: `@Environment(\.accessibilityReduceMotion)`

### Do Use ARC Tokens For

- **Brand identity**: `.arcBrandBurgundy`, `.arcBrandGold`, `.arcBrandFont()`
- **Spacing**: `.arcSpacingMedium`, `.arcSpacingLarge` (with `@ScaledMetric`)
- **Touch targets**: `.arcTouchTargetMinimum`, `.arcTouchTargetVisionOS`
- **Corner radius**: `.arcCornerRadiusMedium`, `.arcCornerRadiusLarge`
- **Extended text colors**: `.arcTextTertiary`, `.arcTextDisabled`
- **Background colors**: `.arcBackgroundSecondary`, `.arcBackgroundTertiary`
- **Accessibility-aware animations**: `.arcDefault`, `.arcSpring`
- **Contrast validation**: `ARCContrastCalculator`
- **Symbol effects**: `.arcSymbolEffect(.success, value:)`

## Next Steps

- Explore the full token reference in the documentation
- Check out the preview views: `ARCColorsPreview`, `ARCTypographyPreview`, `ARCAnimationsPreview`
- Review symbol effects in `ARCSymbolEffectsPreview`
- Run the demo app to see all tokens in action
