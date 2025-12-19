# ARCDesignSystem

A modern, minimal SwiftUI design system for ARC Labs Studio applications. Built on Apple's native APIs with zero redundancy.

![Swift](https://img.shields.io/badge/Swift-6.0-orange.svg)
![Platforms](https://img.shields.io/badge/platforms-iOS%2017%20%7C%20macOS%2014%20%7C%20tvOS%2017%20%7C%20watchOS%2010-blue.svg)
![License](https://img.shields.io/badge/license-MIT-lightgrey.svg)

## Philosophy

ARCDesignSystem provides **only what SwiftUI doesn't offer natively**:

- **Spacing & Corner Radius Tokens** - Consistent base values for use with `@ScaledMetric`
- **Semantic Background Colors** - Cross-platform background colors (UIKit/AppKit unified)
- **Extended Text Colors** - Tertiary, quaternary, and disabled text colors not in SwiftUI
- **Symbol Effects** - Preset configurations for SF Symbols animations
- **Material & Vibrancy Helpers** - Convenient wrappers for iOS 15+ materials
- **Liquid Glass Helpers** - Ready for iOS 26+ (currently behind `#if swift(>=6.0)`)

**What we DON'T provide** (use SwiftUI directly):
- Typography → Use `.body`, `.title`, `.headline`, etc.
- Primary/Secondary text → Use `.primary`, `.secondary`
- Accent colors → Use `.tint` or `.accentColor`
- Animations → Use `.spring()`, `.smooth`, `.snappy`
- Accessibility → Use `@Environment(\.accessibilityReduceMotion)`, etc.

## Requirements

- iOS 17.0+ / macOS 14.0+ / tvOS 17.0+ / watchOS 10.0+
- Swift 6.0+
- Xcode 16.0+

## Installation

### Swift Package Manager

```swift
dependencies: [
    .package(url: "https://github.com/arclabs-studio/ARCDesignSystem", from: "2.0.0")
]
```

Or in Xcode: **File → Add Packages...** and enter the repository URL.

## Quick Start

```swift
import SwiftUI
import ARCDesignSystem

struct ContentCard: View {
    // Use @ScaledMetric for Dynamic Type scaling
    @ScaledMetric(relativeTo: .body) var cardPadding = CGFloat.arcSpacingLarge
    @ScaledMetric(relativeTo: .body) var spacing = CGFloat.arcSpacingMedium

    var body: some View {
        VStack(alignment: .leading, spacing: spacing) {
            Text("Account Balance")
                .font(.title3)                    // Native SwiftUI
                .foregroundStyle(.primary)        // Native SwiftUI

            Text("Available funds")
                .font(.footnote)
                .foregroundStyle(.secondary)      // Native SwiftUI

            Text("$1,245.30")
                .font(.largeTitle.bold())
        }
        .padding(cardPadding)
        .background(.arcBackgroundSecondary)      // ARC token
        .clipShape(RoundedRectangle(cornerRadius: .arcCornerRadiusMedium))
        .shadow(color: .arcShadowMedium, radius: 8, x: 0, y: 4)
    }
}
```

## Token Reference

### Spacing (Base Values)

Use with `@ScaledMetric` in your views for Dynamic Type support:

| Token | Value | Usage |
|-------|-------|-------|
| `.arcSpacingXSmall` | 4pt | Minimal gaps |
| `.arcSpacingSmall` | 8pt | Compact spacing |
| `.arcSpacingMedium` | 12pt | Standard spacing |
| `.arcSpacingLarge` | 16pt | Section spacing |
| `.arcSpacingXLarge` | 24pt | Large gaps |
| `.arcSpacingXXLarge` | 32pt | Major separators |

```swift
struct MyView: View {
    @ScaledMetric(relativeTo: .body) var spacing = CGFloat.arcSpacingMedium

    var body: some View {
        VStack(spacing: spacing) {
            // Content scales with Dynamic Type
        }
    }
}
```

### Corner Radius (Fixed Values)

Corner radii don't scale with Dynamic Type (Apple convention):

| Token | Value |
|-------|-------|
| `.arcCornerRadiusSmall` | 8pt |
| `.arcCornerRadiusMedium` | 16pt |
| `.arcCornerRadiusLarge` | 24pt |
| `.arcCornerRadiusXLarge` | 32pt |

### Padding Presets

| Token | Values |
|-------|--------|
| `.arcPaddingCard` | 16pt all sides |
| `.arcPaddingSection` | 24pt vertical, 16pt horizontal |
| `.arcPaddingCompact` | 8pt vertical, 12pt horizontal |
| `.arcPaddingHorizontal` | 16pt leading/trailing only |

### Colors

**Backgrounds** (cross-platform unified):
- `.arcBackgroundPrimary` - Main screen background
- `.arcBackgroundSecondary` - Cards, elevated surfaces
- `.arcBackgroundTertiary` - Grouped content, sidebars

**Extended Text** (not available natively):
- `.arcTextTertiary` - Less prominent content
- `.arcTextQuaternary` - Watermarks, minimal emphasis
- `.arcTextDisabled` - Unavailable content

**Interactive**:
- `.arcLink` - Hyperlink text
- `.arcPlaceholder` - Input placeholder text

**Separators**:
- `.arcSeparator` - Standard dividers
- `.arcSeparatorOpaque` - Opaque dividers

**Shadows**:
- `.arcShadowLight` - 8% opacity
- `.arcShadowMedium` - 15% opacity
- `.arcShadowStrong` - 25% opacity

### Symbol Effects

```swift
// Indefinite effects (continuous)
Image(systemName: "arrow.triangle.2.circlepath")
    .arcSymbolEffect(.syncing, isActive: isSyncing)

// Discrete effects (one-shot)
Image(systemName: "checkmark.circle")
    .arcSymbolEffect(.success, value: triggerCount)

// Content transitions
Image(systemName: isDark ? "moon" : "sun.max")
    .arcContentTransition(.smooth)

// Appear/disappear transitions
if showIcon {
    Image(systemName: "star")
        .arcTransition(.appear)
}
```

### Materials (iOS 15+)

```swift
// Material background with corner radius
Text("Floating Card")
    .padding()
    .arcMaterialBackground(.arcRegular, cornerRadius: .arcCornerRadiusMedium)

// Available materials:
// .arcUltraThin, .arcThin, .arcRegular, .arcThick, .arcUltraThick, .arcBar
```

### Vibrancy

```swift
// Apply vibrancy to text over materials
VStack {
    Text("Primary").arcVibrancyLabel()
    Text("Secondary").arcVibrancySecondary()
    Text("Tertiary").arcVibrancyTertiary()
    Text("Quaternary").arcVibrancyQuaternary()
}
.background(.regularMaterial)
```

### Liquid Glass (iOS 26+)

```swift
if #available(iOS 26.0, *) {
    Text("Glass Card")
        .padding()
        .arcGlass(cornerRadius: .arcCornerRadiusLarge, tint: .blue, interactive: true)

    Image("hero")
        .arcBackgroundExtension()
}
```

## Project Structure

```
Sources/ARCDesignSystem/
├── Tokens/
│   ├── CGFloat+Spacing.swift        # Base spacing values
│   ├── CGFloat+CornerRadius.swift   # Fixed corner radii
│   ├── EdgeInsets+Padding.swift     # Padding presets
│   ├── Color+Semantic.swift         # Semantic colors
│   └── Color+Shadows.swift          # Shadow colors
│
├── Effects/
│   ├── ARCSymbolEffect.swift        # Symbol effect presets
│   ├── ARCSymbolAnimation.swift     # Symbol animations
│   ├── Glass+Effects.swift          # Liquid Glass (iOS 26+)
│   ├── Material+Effects.swift       # Material helpers
│   └── Vibrancy+Effects.swift       # Vibrancy helpers
│
├── Helpers/
│   └── ScaledValue.swift            # @ScaledMetric documentation
│
└── Previews/
    ├── Views/
    │   ├── ARCDesignSystemPreview.swift
    │   └── ARCSymbolEffectsPreview.swift
    └── Helpers/
        └── ARCColor+Helpers.swift   # Cross-platform helpers
```

## Migration from v1.x

This is a **breaking change** release. Here's how to migrate:

### Typography
```swift
// Before
.font(.arcFontTitle1)
.font(.arcFontBody)

// After - Use SwiftUI native
.font(.title)
.font(.body)
```

### Text Colors
```swift
// Before
.foregroundStyle(.arcTextPrimary)
.foregroundStyle(.arcTextSecondary)

// After - Use SwiftUI native
.foregroundStyle(.primary)
.foregroundStyle(.secondary)
```

### Accent Colors
```swift
// Before
.foregroundStyle(.arcAccent)

// After - Use SwiftUI native
.foregroundStyle(.tint)
// or
.tint(.blue)
```

### Animations
```swift
// Before
withAnimation(.arcAnimationSmooth) { }

// After - Use SwiftUI native
withAnimation(.smooth) { }
withAnimation(.spring()) { }
withAnimation(.snappy) { }
```

### Accessibility
```swift
// Before
ARCAccessibility.prefersReducedMotion
ARCAccessibility.prefersHighContrast

// After - Use SwiftUI native
@Environment(\.accessibilityReduceMotion) var reduceMotion
@Environment(\.colorSchemeContrast) var contrast
@Environment(\.dynamicTypeSize) var typeSize
```

### Dynamic Type Scaling
```swift
// Before - Automatic scaling via ARCLayoutScale
VStack(spacing: .arcSpacingMedium) { }

// After - Explicit scaling via @ScaledMetric
@ScaledMetric var spacing = CGFloat.arcSpacingMedium
VStack(spacing: spacing) { }
```

## Development

### Setup

```bash
git clone https://github.com/arclabs-studio/ARCDesignSystem.git
cd ARCDesignSystem
git submodule update --init --recursive
./ARCDevTools/arcdevtools-setup
```

### Commands

```bash
swift build    # Build package
swift test     # Run tests
make lint      # Run SwiftLint
make format    # Preview formatting
make fix       # Apply SwiftFormat
```

## License

MIT License - see [LICENSE](LICENSE) for details.

## Author

**ARC Labs Studio**
