# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

ARCDesignSystem is a modular SwiftUI design system for ARC Labs Studio. It provides design tokens (spacing, typography, colors, corner radii, animations, padding) that scale adaptively with Dynamic Type across all Apple platforms (iOS 17+, macOS 14+, tvOS 17+, watchOS 10+).

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

### Token System

All design tokens use a consistent pattern: static properties on Swift type extensions that scale with `ARCLayoutScale.arcScaleFactor` (which responds to Dynamic Type on UIKit platforms, returns 1.0 on macOS).

```
Sources/ARCDesignSystem/
├── Core/
│   └── ARCLayoutScale.swift       # Dynamic Type scale factor (0.9-1.7)
├── Tokens/
│   ├── Animation+Presets.swift    # .arcAnimationBase, .arcAnimationSmooth, .arcAnimationQuick
│   ├── CGFloat+CornerRadius.swift # .arcCornerRadiusSmall through .arcCornerRadiusXLarge
│   ├── CGFloat+Spacing.swift      # .arcSpacingXSmall through .arcSpacingXXLarge
│   ├── Color+Backgrounds.swift    # .arcBackgroundPrimary, .arcTextPrimary, etc.
│   ├── Color+Shadows.swift        # .arcShadowLight, .arcShadowMedium, .arcShadowStrong
│   ├── EdgeInsets+Padding.swift   # .arcPaddingCard, .arcPaddingSection, etc.
│   └── Font+Typography.swift      # .arcFontTitleLarge, .arcFontBody, etc.
├── Accessibility/
│   └── ARCAccessibility.swift     # Accessibility utilities and environment keys
└── Previews/
    ├── Helpers/                   # Cross-platform color helpers
    └── Views/                     # Documentation and interactive previews
```

### Token Naming Convention

All public tokens use the `arc` prefix: `.arcSpacingMedium`, `.arcCornerRadiusLarge`, `.arcFontBody`.

### Cross-Platform Support

Uses `#if canImport(UIKit)` and `#if canImport(AppKit)` conditionals to abstract platform differences. `ARCColorHelper` in `Previews/Helpers/` provides unified color access across UIKit and AppKit.

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

- `ARCLayoutScaleTests.swift` - Scale factor validation
- `SpacingTokensTests.swift` - All spacing token validation
- `CornerRadiusTokensTests.swift` - Corner radius token validation
- `PaddingTokensTests.swift` - Padding preset validation
- `ColorTokensTests.swift` - Color token and shadow validation
- `AnimationPresetsTests.swift` - Animation preset validation
- `TypographyTokensTests.swift` - Typography token validation
- `AccessibilityTests.swift` - Accessibility utilities validation

Tests verify exact token values and scaling relationships. Target: 100% coverage.

## Key Design Decisions

1. **Extension-based API**: Tokens are static properties on SwiftUI types (CGFloat, Color, Font, Animation, EdgeInsets) for ergonomic usage.

2. **Dynamic Type scaling**: All spacing and corner radii scale with the user's preferred text size for accessibility.

3. **Platform-native colors**: Background and text colors use `UIColor`/`NSColor` system colors for automatic light/dark mode and accessibility support.

4. **No external dependencies**: Zero third-party dependencies for maximum compatibility and minimal footprint.

5. **Deprecated aliases**: Legacy token names (e.g., `arcFontTitleSmall`) are maintained with `@available(*, deprecated)` for backwards compatibility.

## Limitations

- Font tokens do not scale with ARCLayoutScale (they use SwiftUI's built-in Dynamic Type)
- Animation tokens are not parameterizable (fixed durations)
- Color tokens cannot be customized at runtime (use SwiftUI asset catalogs for theming)
