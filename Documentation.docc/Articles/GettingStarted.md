# Getting Started

Learn how to integrate ARCDesignSystem into your SwiftUI application.

## Overview

ARCDesignSystem is designed to complement SwiftUI, not replace it. Use native SwiftUI APIs for typography, primary colors, and animations. Use ARC tokens for spacing, extended colors, and symbol effects.

## Installation

Add ARCDesignSystem to your Swift package dependencies:

```swift
dependencies: [
    .package(url: "https://github.com/arclabs-studio/ARCDesignSystem", from: "2.0.0")
]
```

Or in Xcode: **File → Add Packages...** and enter the repository URL.

## Basic Usage

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

## Best Practices

### Do Use Native SwiftUI For

- **Typography**: `.font(.body)`, `.font(.title)`, etc.
- **Primary/Secondary colors**: `.foregroundStyle(.primary)`, `.secondary`
- **Accent colors**: `.tint(.blue)`, `.accentColor`
- **Animations**: `.withAnimation(.spring())`, `.smooth`, `.snappy`

### Do Use ARC Tokens For

- **Spacing**: `.arcSpacingMedium`, `.arcSpacingLarge` (with `@ScaledMetric`)
- **Corner radius**: `.arcCornerRadiusMedium`, `.arcCornerRadiusLarge`
- **Extended text colors**: `.arcTextTertiary`, `.arcTextDisabled`
- **Background colors**: `.arcBackgroundSecondary`, `.arcBackgroundTertiary`
- **Symbol effects**: `.arcSymbolEffect(.success, value:)`

## Next Steps

- Explore the full token reference in the documentation
- Check out the preview views in `ARCDesignSystemPreview.swift`
- Review symbol effects in `ARCSymbolEffectsPreview.swift`
