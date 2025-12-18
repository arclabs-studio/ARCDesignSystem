# ARCDesignSystem

A modular SwiftUI design system for ARC Labs Studio applications, providing adaptive design tokens that scale with Dynamic Type across all Apple platforms.

![Swift](https://img.shields.io/badge/Swift-6.0-orange.svg)
![Platforms](https://img.shields.io/badge/platforms-iOS%2017%20%7C%20macOS%2014%20%7C%20tvOS%2017%20%7C%20watchOS%2010-blue.svg)
![License](https://img.shields.io/badge/license-MIT-lightgrey.svg)

## Features

- ✅ **Adaptive Spacing** - Tokens that scale with Dynamic Type preferences
- ✅ **Typography System** - HIG-compliant fonts with automatic scaling
- ✅ **Semantic Colors** - Platform-adaptive background, text, and accent colors
- ✅ **Corner Radii** - Consistent, scalable corner radius tokens
- ✅ **Animation Presets** - Smooth, accessible animation configurations
- ✅ **Accessibility Support** - Built-in helpers for high contrast, reduced motion, and more
- ✅ **Cross-Platform** - iOS, macOS, tvOS, and watchOS support
- ✅ **SwiftUI Previews** - Interactive documentation and visual catalogs

## Requirements

- iOS 17.0+ / macOS 14.0+ / tvOS 17.0+ / watchOS 10.0+
- Swift 6.0+
- Xcode 16.0+

## Installation

### Swift Package Manager

Add the package to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/arclabs-studio/ARCDesignSystem", from: "1.0.0")
]
```

Or in Xcode: **File → Add Packages...** and enter the repository URL.

## Quick Start

```swift
import SwiftUI
import ARCDesignSystem

struct ContentCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: .arcSpacingMedium) {
            Text("Account Balance")
                .font(.arcFontTitle3)
                .foregroundStyle(.arcTextPrimary)

            Text("Available funds")
                .font(.arcFontFootnote)
                .foregroundStyle(.arcTextSecondary)

            Text("$1,245.30")
                .font(.arcFontTitleLarge)
                .foregroundStyle(.arcTextPrimary)
        }
        .padding(.arcPaddingCard)
        .background(.arcBackgroundSecondary)
        .clipShape(RoundedRectangle(cornerRadius: .arcCornerRadiusMedium))
        .shadow(color: .arcShadowMedium, radius: 8, x: 0, y: 4)
    }
}
```

## Token Reference

### Spacing

| Token | Base Value | Description |
|-------|-----------|-------------|
| `.arcSpacingXSmall` | 4pt | Minimal gaps, tight layouts |
| `.arcSpacingSmall` | 8pt | Compact spacing, list items |
| `.arcSpacingMedium` | 12pt | Standard element spacing |
| `.arcSpacingLarge` | 16pt | Section spacing, card padding |
| `.arcSpacingXLarge` | 24pt | Large gaps between sections |
| `.arcSpacingXXLarge` | 32pt | Maximum spacing, major separators |

### Typography

| Token | Style | Weight |
|-------|-------|--------|
| `.arcFontTitleLarge` | Large Title | Bold |
| `.arcFontTitle1` | Title | Regular |
| `.arcFontTitle2` | Title 2 | Regular |
| `.arcFontTitle3` | Title 3 | Regular |
| `.arcFontHeadline` | Headline | Semibold |
| `.arcFontSubheadline` | Subheadline | Regular |
| `.arcFontBody` | Body | Regular |
| `.arcFontCallout` | Callout | Regular |
| `.arcFontFootnote` | Footnote | Regular |
| `.arcFontCaption1` | Caption | Regular |
| `.arcFontCaption2` | Caption 2 | Regular |

### Colors

**Backgrounds**
- `.arcBackgroundPrimary` - Main screen background
- `.arcBackgroundSecondary` - Cards, elevated surfaces
- `.arcBackgroundTertiary` - Grouped content, sidebars

**Text**
- `.arcTextPrimary` - Primary content
- `.arcTextSecondary` - Supporting text
- `.arcTextTertiary` - Less prominent content
- `.arcTextDisabled` - Unavailable content

**Interactive**
- `.arcAccent` - System accent color
- `.arcLink` - Hyperlink text
- `.arcPlaceholder` - Input placeholder text

**Separators**
- `.arcSeparator` - Standard dividers
- `.arcSeparatorOpaque` - Opaque dividers

**Shadows**
- `.arcShadowLight` - Subtle elevation (8% opacity)
- `.arcShadowMedium` - Standard elevation (15% opacity)
- `.arcShadowStrong` - Prominent elevation (25% opacity)

### Corner Radius

| Token | Base Value |
|-------|-----------|
| `.arcCornerRadiusSmall` | 6.4pt |
| `.arcCornerRadiusMedium` | 12.8pt |
| `.arcCornerRadiusLarge` | 19.2pt |
| `.arcCornerRadiusXLarge` | 25.6pt |

### Animations

| Token | Description |
|-------|-------------|
| `.arcAnimationBase` | Standard ease-in-out (0.25s) |
| `.arcAnimationSmooth` | Longer ease-in-out (0.35s) |
| `.arcAnimationQuick` | Spring animation (0.25s response) |

### Padding Presets

| Token | Description |
|-------|-------------|
| `.arcPaddingCard` | Standard card padding |
| `.arcPaddingSection` | Section container padding |
| `.arcPaddingCompact` | Compact element padding |
| `.arcPaddingHorizontal` | Horizontal-only padding |

## Accessibility

ARCDesignSystem includes `ARCAccessibility` utilities:

```swift
// Check system accessibility settings
if ARCAccessibility.prefersReducedMotion {
    // Use simpler animations
}

if ARCAccessibility.prefersHighContrast {
    // Use stronger borders and colors
}

// SwiftUI environment integration
WindowGroup {
    ContentView()
        .arcAccessibility()
}
```

## Previews

The package includes interactive previews for documentation:

```swift
#Preview {
    ARCDesignSystemPreview()           // Visual token catalog
}

#Preview {
    ARCDesignSystemInteractivePreview() // Interactive testing
}

#Preview {
    ARCDesignSystemDocumentation()     // Full documentation
}
```

## Project Structure

```
Sources/ARCDesignSystem/
├── ARCLayoutScale.swift         # Dynamic Type scale factor
├── ARCAccessibility.swift       # Accessibility utilities
├── CGFloat+Spacing.swift        # Spacing tokens
├── CGFloat+CornerRadius.swift   # Corner radius tokens
├── EdgeInsets+Padding.swift     # Padding presets
├── Color+Backgrounds.swift      # Semantic colors
├── Color+Shadows.swift          # Shadow colors
├── Font+Typography.swift        # Typography tokens
├── Animation+Presets.swift      # Animation presets
└── Previews/                    # Documentation views
    ├── ARCDesignSystemPreview.swift
    ├── ARCDesignSystemInteractivePreview.swift
    ├── ARCDesignSystemDocumentation.swift
    └── Helpers/ARCColor+Helpers.swift
```

## Development

### Setup

```bash
# Clone the repository
git clone https://github.com/arclabs-studio/ARCDesignSystem.git
cd ARCDesignSystem

# Initialize submodules
git submodule update --init --recursive

# Run setup
./ARCDevTools/arcdevtools-setup
```

### Commands

```bash
make lint      # Run SwiftLint
make format    # Preview formatting changes
make fix       # Apply SwiftFormat
make clean     # Clean build artifacts
```

### Testing

```bash
swift test
```

## Documentation

- See inline DocC documentation for all public APIs
- Run previews in Xcode for visual documentation
- See [CHANGELOG.md](CHANGELOG.md) for version history

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/new-token`)
3. Run `make fix` and `make lint` before committing
4. Run `swift test` to ensure all tests pass
5. Create a Pull Request

## License

MIT License - see [LICENSE](LICENSE) for details.

## Author

**ARC Labs Studio**
