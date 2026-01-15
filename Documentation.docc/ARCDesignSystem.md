# ``ARCDesignSystem``

A modern, minimal SwiftUI design system for ARC Labs Studio applications.

## Overview

ARCDesignSystem provides **only what SwiftUI doesn't offer natively** — spacing tokens, semantic colors, symbol effects, and material helpers. It follows Apple's design philosophy: use native APIs directly, and extend only where gaps exist.

### Design Philosophy

- **Minimal footprint**: No redundant wrappers for built-in SwiftUI APIs
- **Platform-native colors**: Uses UIColor/NSColor system colors for automatic light/dark mode
- **Dynamic Type ready**: Base spacing values designed for use with `@ScaledMetric`
- **iOS 26+ prepared**: Liquid Glass helpers ready when SDK is available

### What ARC Provides

| Category | Why Not Native | ARC Tokens |
|----------|---------------|------------|
| Spacing | SwiftUI has no spacing tokens | `.arcSpacingXSmall` through `.arcSpacingXXLarge` |
| Corner Radius | SwiftUI has no radius tokens | `.arcCornerRadiusSmall` through `.arcCornerRadiusXLarge` |
| Backgrounds | Need cross-platform (UIKit/AppKit) | `.arcBackgroundPrimary/Secondary/Tertiary` |
| Extended Text | SwiftUI only has primary/secondary | `.arcTextTertiary`, `.arcTextQuaternary`, `.arcTextDisabled` |
| Symbol Effects | Simplify SF Symbols API | `.arcSymbolEffect(.syncing)`, etc. |
| Materials | Convenience wrappers | `.arcMaterialBackground()` |

### What to Use Natively

| Instead of | Use Native SwiftUI |
|------------|-------------------|
| Typography | `.body`, `.title`, `.headline`, etc. |
| Primary/Secondary text | `.primary`, `.secondary` |
| Accent colors | `.tint`, `.accentColor` |
| Animations | `.spring()`, `.smooth`, `.snappy` |
| Accessibility | `@Environment(\.accessibilityReduceMotion)` |

## Topics

### Essentials

- <doc:GettingStarted>

### Spacing & Layout

- ``Swift/CGFloat/arcSpacingXSmall``
- ``Swift/CGFloat/arcSpacingSmall``
- ``Swift/CGFloat/arcSpacingMedium``
- ``Swift/CGFloat/arcSpacingLarge``
- ``Swift/CGFloat/arcSpacingXLarge``
- ``Swift/CGFloat/arcSpacingXXLarge``

### Corner Radius

- ``Swift/CGFloat/arcCornerRadiusSmall``
- ``Swift/CGFloat/arcCornerRadiusMedium``
- ``Swift/CGFloat/arcCornerRadiusLarge``
- ``Swift/CGFloat/arcCornerRadiusXLarge``

### Colors

- ``SwiftUICore/Color/arcBackgroundPrimary``
- ``SwiftUICore/Color/arcBackgroundSecondary``
- ``SwiftUICore/Color/arcBackgroundTertiary``
- ``SwiftUICore/Color/arcTextTertiary``
- ``SwiftUICore/Color/arcTextQuaternary``
- ``SwiftUICore/Color/arcTextDisabled``

### Symbol Effects

- ``ARCSymbolEffect``

### Materials

- ``SwiftUICore/Material/arcRegular``
- ``SwiftUICore/Material/arcThin``
- ``SwiftUICore/Material/arcThick``
