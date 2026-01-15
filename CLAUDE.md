# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

ARCDesignSystem is a minimal, modern SwiftUI design system for ARC Labs Studio. It provides **only what SwiftUI doesn't offer natively** - no redundant wrappers for built-in APIs.

**Philosophy:** Use Apple's native APIs directly. ARC tokens complement, not replace, SwiftUI.

## Build & Development Commands

```bash
# Build
swift build

# Run all tests
swift test

# Run a single test suite
swift test --filter ARCDesignSystemTests.SpacingTokensTests

# Lint (requires: brew install swiftlint)
make lint

# Format check (requires: brew install swiftformat)
make format

# Apply formatting fixes
make fix

# Setup ARCDevTools (regenerates config files)
./ARCDevTools/arcdevtools-setup

# Clean build artifacts
make clean
```

## Architecture

### What We Provide

| Category | Why Not Native | ARC Tokens |
|----------|---------------|------------|
| **Branding** | ARC Labs Studio identity colors | `.arcBrandBurgundy`, `.arcBrandGold`, `.arcBrandBlack` |
| **Spacing** | SwiftUI has no spacing tokens | `.arcSpacingXSmall` through `.arcSpacingXXLarge` |
| **Corner Radius** | SwiftUI has no radius tokens | `.arcCornerRadiusSmall` through `.arcCornerRadiusXLarge` |
| **Backgrounds** | Need cross-platform (UIKit/AppKit) | `.arcBackgroundPrimary/Secondary/Tertiary` |
| **Extended Text** | SwiftUI only has primary/secondary | `.arcTextTertiary`, `.arcTextQuaternary`, `.arcTextDisabled` |
| **Symbol Effects** | Simplify SF Symbols API | `.arcSymbolEffect(.syncing)`, etc. |
| **Materials** | Convenience wrappers | `.arcMaterialBackground()` |
| **Liquid Glass** | iOS 26+ helpers | `.arcGlass()` (commented, awaiting SDK) |

### What We DON'T Provide (Use SwiftUI Directly)

| Instead of | Use Native SwiftUI |
|------------|-------------------|
| Typography tokens | `.body`, `.title`, `.headline`, etc. |
| Primary/Secondary text | `.primary`, `.secondary` |
| Accent colors | `.tint`, `.accentColor` |
| Animations | `.spring()`, `.smooth`, `.snappy` |
| Accessibility checks | `@Environment(\.accessibilityReduceMotion)` |
| Dynamic Type scaling | `@ScaledMetric` property wrapper |

### Project Structure

```
Sources/ARCDesignSystem/
├── Tokens/
│   ├── CGFloat+Spacing.swift        # Base spacing constants
│   ├── CGFloat+CornerRadius.swift   # Fixed corner radii
│   ├── EdgeInsets+Padding.swift     # Padding presets
│   ├── Color+Branding.swift         # ARC Labs Studio brand colors
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
        └── ARCColor+Helpers.swift   # Cross-platform color helpers
```

### Token Naming Convention

All public tokens use the `arc` prefix: `.arcSpacingMedium`, `.arcCornerRadiusLarge`, `.arcBackgroundSecondary`.

### Dynamic Type Support

Spacing tokens are **base values**. For Dynamic Type scaling, use `@ScaledMetric`:

```swift
struct MyView: View {
    @ScaledMetric(relativeTo: .body) var spacing = CGFloat.arcSpacingMedium

    var body: some View {
        VStack(spacing: spacing) {
            // Content scales with user's Dynamic Type setting
        }
    }
}
```

Corner radii do **not** scale (following Apple convention).

## Dependencies

- **ARCDevTools**: Development tooling (git submodule at `ARCDevTools/`)
  - Includes **ARCKnowledge** nested at `ARCDevTools/ARCKnowledge/` with ARC Labs Studio guidelines

## Code Style

This project follows ARC Labs Studio conventions from `ARCDevTools/ARCKnowledge/CLAUDE.md`:

- One type per file
- File header with filename, project, and creation date
- `// MARK:` sections for organization
- DocC documentation for all public APIs
- Swift 6.0 with strict concurrency

## Testing

Tests are in `Tests/ARCDesignSystemTests/`. Each token category has its own test file:

- `SpacingTokensTests.swift` - Spacing token values
- `CornerRadiusTokensTests.swift` - Corner radius values
- `PaddingTokensTests.swift` - Padding preset values
- `ColorTokensTests.swift` - Color accessibility
- `SymbolEffectTests.swift` - Symbol effect categorization

Tests verify exact token values and relationships. Target: 100% coverage.

## Key Design Decisions

1. **Minimal footprint**: Only provide what SwiftUI lacks natively. No 1:1 wrappers.

2. **Base values, not computed**: Spacing/padding are constants. Use `@ScaledMetric` in views for scaling.

3. **Platform-native colors**: Background colors use `UIColor`/`NSColor` system colors for automatic light/dark mode.

4. **No external dependencies**: Zero third-party dependencies for maximum compatibility.

5. **iOS 26+ ready**: Liquid Glass helpers prepared but commented out until SDK is available.

6. **Breaking changes**: v2.0 removed deprecated aliases. No legacy support - clean API.

## Limitations

- Liquid Glass (`arcGlass`) requires iOS 26 SDK (implementation commented until available)
- Symbol effects require iOS 17+
- No runtime color customization (use asset catalogs for theming)

## Common Patterns

### Card with Dynamic Type Support
```swift
struct Card: View {
    @ScaledMetric var padding = CGFloat.arcSpacingLarge
    @ScaledMetric var spacing = CGFloat.arcSpacingMedium

    var body: some View {
        VStack(spacing: spacing) {
            Text("Title").font(.headline)
            Text("Body").font(.body)
        }
        .padding(padding)
        .background(.arcBackgroundSecondary)
        .clipShape(RoundedRectangle(cornerRadius: .arcCornerRadiusMedium))
    }
}
```

### Symbol with Effect
```swift
Image(systemName: "arrow.triangle.2.circlepath")
    .arcSymbolEffect(.syncing, isActive: isSyncing)
```

### Material Background
```swift
Text("Overlay")
    .padding()
    .arcMaterialBackground(.arcRegular)
```

### Branding Colors
```swift
// Set app-wide accent color
ContentView()
    .tint(.arcBrandGold)

// Logo or brand accent
Image("logo")
    .foregroundStyle(.arcBrandBurgundy)

// Brand-styled button
Button("Get Started") { }
    .tint(.arcBrandGold)
```
