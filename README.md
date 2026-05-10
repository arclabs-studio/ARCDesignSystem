# 🎨 ARCDesignSystem

![Swift](https://img.shields.io/badge/Swift-6.0-orange.svg)
![Platforms](https://img.shields.io/badge/platforms-iOS%2017%20%7C%20macOS%2014%20%7C%20tvOS%2017%20%7C%20watchOS%2010-blue.svg)
![License](https://img.shields.io/badge/license-PolyForm%20Noncommercial%201.0.0-orange.svg)
![Version](https://img.shields.io/badge/version-2.0.0-blue.svg)

**A modern, minimal SwiftUI design system for ARC Labs Studio applications.**

Spacing Tokens • Semantic Colors • Symbol Effects • Material Helpers • Dynamic Type Ready

---

## 🎯 Overview

ARCDesignSystem provides **only what SwiftUI doesn't offer natively**. It follows Apple's design philosophy: use native APIs directly, and extend only where gaps exist.

### Key Features

- ✅ **Brand Identity** - ARC Labs Studio colors (Burgundy, Gold, Black) with Light/Dark/High Contrast
- ✅ **Brand Typography** - Radley Sans custom font with Dynamic Type support
- ✅ **WCAG 2.1 AA Compliant** - Contrast validation via `ARCContrastCalculator`
- ✅ **Spacing & Corner Radius Tokens** - Consistent base values for use with `@ScaledMetric`
- ✅ **Touch Target Tokens** - Platform-specific minimum sizes (iOS 44pt, visionOS 60pt)
- ✅ **Accessibility-Aware Animations** - Animations that respect Reduce Motion settings
- ✅ **Semantic Background Colors** - Cross-platform background colors (UIKit/AppKit unified)
- ✅ **Extended Text Colors** - Tertiary, quaternary, and disabled text colors
- ✅ **Symbol Effects** - Preset configurations for SF Symbols animations
- ✅ **Material & Vibrancy Helpers** - Convenient wrappers for iOS 15+ materials

### What We DON'T Provide (Use SwiftUI Directly)

| Instead of | Use Native SwiftUI |
|------------|-------------------|
| System fonts | `.body`, `.title`, `.headline`, etc. |
| Primary/Secondary text | `.primary`, `.secondary` |
| Accent colors | `.tint` or `.accentColor` |
| Basic animations | `.spring()`, `.smooth`, `.snappy` |
| Environment values | `@Environment(\.accessibilityReduceMotion)` |

---

## 📋 Requirements

- **Swift:** 6.0+
- **Platforms:** iOS 17.0+ / macOS 14.0+ / tvOS 17.0+ / watchOS 10.0+
- **Xcode:** 16.0+

---

## 🚀 Installation

### Swift Package Manager

#### For Swift Packages

```swift
// Package.swift
dependencies: [
    .package(url: "https://github.com/arclabs-studio/ARCDesignSystem", from: "2.0.0")
]
```

#### For Xcode Projects

1. **File → Add Package Dependencies**
2. Enter: `https://github.com/arclabs-studio/ARCDesignSystem`
3. Select version: `2.0.0` or later

---

## 📖 Usage

### Quick Start

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

### Brand Colors & Typography

```swift
import ARCDesignSystem

// Register brand font (call once at app launch)
@main
struct MyApp: App {
    init() {
        ARCBrandFont.registerFonts()
    }
    var body: some Scene {
        WindowGroup { ContentView() }
    }
}

// Use brand colors
Text("Welcome")
    .foregroundStyle(.arcBrandBurgundy)

Button("Get Started") { }
    .tint(.arcBrandGold)

// Use brand font with Dynamic Type
Text("ARC Labs Studio")
    .font(.arcBrandFont(.title))

// Validate contrast (WCAG 2.1)
let result = ARCContrastCalculator.validate(
    foreground: .arcBrandBurgundy,
    background: .white
)
print(result.meetsAA) // true
```

### Spacing Tokens

Use with `@ScaledMetric` in your views for Dynamic Type support:

| Token | Value | Usage |
|-------|-------|-------|
| `.arcSpacingXSmall` | 4pt | Minimal gaps |
| `.arcSpacingSmall` | 8pt | Compact spacing |
| `.arcSpacingMedium` | 12pt | Standard spacing |
| `.arcSpacingLarge` | 16pt | Section spacing |
| `.arcSpacingXLarge` | 24pt | Large gaps |
| `.arcSpacingXXLarge` | 32pt | Major separators |

### Corner Radius Tokens

Corner radii don't scale with Dynamic Type (Apple convention):

| Token | Value |
|-------|-------|
| `.arcCornerRadiusSmall` | 8pt |
| `.arcCornerRadiusMedium` | 16pt |
| `.arcCornerRadiusLarge` | 24pt |
| `.arcCornerRadiusXLarge` | 32pt |

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
```

### Materials

```swift
// Material background with corner radius
Text("Floating Card")
    .padding()
    .arcMaterialBackground(.arcRegular, cornerRadius: .arcCornerRadiusMedium)

// Available materials:
// .arcUltraThin, .arcThin, .arcRegular, .arcThick, .arcUltraThick, .arcBar
```

---

## 🏗️ Project Structure

```
Sources/ARCDesignSystem/
├── Tokens/
│   ├── CGFloat+Spacing.swift        # Spacing and touch targets
│   ├── CGFloat+CornerRadius.swift   # Fixed corner radii
│   ├── EdgeInsets+Padding.swift     # Padding presets
│   ├── Color+Branding.swift         # ARC Labs Studio brand colors
│   ├── Color+Semantic.swift         # Semantic colors
│   ├── Color+Shadows.swift          # Shadow colors
│   ├── ARCBrandFont.swift           # Radley Sans font registration
│   └── ARCBrandAsset.swift          # Brand asset references
│
├── Typography/
│   ├── Font+ARC.swift               # Typography tokens
│   └── ARCScaledFont.swift          # Dynamic Type scaling
│
├── Animation/
│   └── Animation+ARC.swift          # Accessibility-aware animations
│
├── Accessibility/
│   ├── ARCAccessibility.swift       # Reduce Motion, Contrast helpers
│   ├── ContrastCalculator.swift     # WCAG contrast validation
│   └── ReduceMotion+Helpers.swift   # Motion-aware modifiers
│
├── Effects/
│   ├── ARCSymbolEffect.swift        # Symbol effect presets
│   ├── ARCSymbolAnimation.swift     # Symbol animations
│   ├── Glass+Effects.swift          # Liquid Glass (iOS 26+)
│   ├── Material+Effects.swift       # Material helpers
│   └── Vibrancy+Effects.swift       # Vibrancy helpers
│
├── Resources/
│   ├── Colors.xcassets/             # Brand colors (Light/Dark/High Contrast)
│   └── Fonts/                       # Radley Sans font
│
├── Documentation.docc/              # DocC documentation
│
└── Previews/Views/
    ├── ARCColorsPreview.swift       # Color token showcase
    ├── ARCTypographyPreview.swift   # Typography showcase
    ├── ARCAnimationsPreview.swift   # Animation showcase
    └── ARCSymbolEffectsPreview.swift
```

---

## 🧪 Testing

```bash
# Run all tests
swift test

# Run specific test suite
swift test --filter ARCDesignSystemTests.SpacingTokensTests
```

### Coverage

- **Target:** 100% for all token values and relationships
- **Current:** 77 tests covering spacing, corner radius, padding, colors, contrast validation, and symbol effects

---

## 🛠️ Development

### Prerequisites

```bash
# Install required tools
brew install swiftlint swiftformat
```

### Setup

```bash
# Clone the repository
git clone https://github.com/arclabs-studio/ARCDesignSystem.git
cd ARCDesignSystem

# Initialize submodules
git submodule update --init --recursive

# Setup ARCDevTools
./ARCDevTools/arcdevtools-setup

# Build the project
swift build
```

### Available Commands

```bash
make help          # Show all available commands
make lint          # Run SwiftLint
make format        # Preview formatting changes
make fix           # Apply SwiftFormat
swift test         # Run tests
make clean         # Remove build artifacts
```

---

## 🤝 Contributing

We welcome contributions! Please follow these guidelines:

1. Fork the repository
2. Create a feature branch: `feature/your-feature`
3. Follow [ARCKnowledge](https://github.com/arclabs-studio/ARCKnowledge) standards
4. Ensure tests pass: `swift test`
5. Run quality checks: `make lint && make format`
6. Create a pull request to `develop`

### Commit Messages

Follow [Conventional Commits](https://www.conventionalcommits.org/):

```
feat: add new spacing token
fix: correct corner radius value
docs: update installation instructions
```

---

## 📦 Versioning

This project follows [Semantic Versioning](https://semver.org/):

- **MAJOR** - Breaking changes
- **MINOR** - New features (backwards compatible)
- **PATCH** - Bug fixes (backwards compatible)

See [CHANGELOG.md](CHANGELOG.md) for version history.

---

## 📄 License

**PolyForm Noncommercial License 1.0.0** © 2025–2026 ARC Labs Studio.

Source-available. Free for non-commercial use (research, study, hobby, evaluation). **Commercial use requires a separate license** — contact `arclabs.studio@gmail.com`.

ARC Labs Studio's own commercial products are covered by an internal use grant — see [INTERNAL-USE.md](INTERNAL-USE.md).

See [LICENSE](LICENSE) for the full license text.

---

## 🔗 Related Resources

- **[ARCKnowledge](https://github.com/arclabs-studio/ARCKnowledge)** - Development standards and guidelines
- **[ARCDevTools](https://github.com/arclabs-studio/ARCDevTools)** - Quality tooling and automation

---

<div align="center">

Made with 💛 by ARC Labs Studio

[**GitHub**](https://github.com/arclabs-studio) • [**Issues**](https://github.com/arclabs-studio/ARCDesignSystem/issues)

</div>
