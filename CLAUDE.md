# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

ARCDesignSystem is a modular SwiftUI design system for ARC Labs Studio. It provides design tokens (spacing, typography, colors, corner radii, animations, padding) that scale adaptively with Dynamic Type across all Apple platforms (iOS 17+, macOS 12+, tvOS 14+, watchOS 7+).

## Build & Development Commands

```bash
# Build
swift build

# Run all tests
swift test

# Run a single test
swift test --filter ARCDesignSystemTests.SpacingTokensTests

# Lint (requires: brew install swiftlint)
make lint

# Format check (requires: brew install swiftformat)
make format

# Apply formatting fixes
make fix

# Setup ARCDevTools (regenerates config files)
./ARCDevTools/arc-setup

# Clean build artifacts
make clean
```

## Architecture

### Token System
All design tokens use a consistent pattern: static properties on Swift type extensions that scale with `ARCLayoutScale.arcScaleFactor` (which responds to Dynamic Type on UIKit platforms, returns 1.0 on macOS).

```
Sources/ARCDesignSystem/
├── ARCLayoutScale.swift      # Dynamic Type scale factor (0.9-1.7)
├── CGFloat+Spacing.swift     # .arcSpacingXSmall through .arcSpacingXXLarge
├── CGFloat+CornerRadius.swift # .arcCornerRadiusSmall through .arcCornerRadiusXLarge
├── EdgeInsets+Padding.swift  # .arcPaddingCard, .arcPaddingSection, etc.
├── Color+Backgrounds.swift   # .arcBackgroundPrimary, .arcTextPrimary, etc.
├── Color+Shadows.swift       # .arcShadowLight, .arcShadowMedium, .arcShadowStrong
├── Font+Typography.swift     # .arcFontTitleLarge, .arcFontBodyMedium, etc.
├── Animation+Presets.swift   # .arcAnimationBase, .arcAnimationSmooth, .arcAnimationQuick
└── Previews/                 # Documentation and interactive previews
```

### Token Naming Convention
All public tokens use the `arc` prefix: `.arcSpacingMedium`, `.arcCornerRadiusLarge`, `.arcFontBodySmall`.

### Cross-Platform Support
Uses `#if canImport(UIKit)` conditionals to abstract platform differences. `ARCColorHelper` in `Previews/Helpers/` provides unified color access across UIKit and AppKit.

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

Tests are in `Tests/ARCDesignSystemTests/`. Each token category has its own test file (e.g., `SpacingTokensTests.swift`). Tests verify exact token values and scaling relationships.
