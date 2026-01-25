# ``ARCDesignSystem``

A modern, minimal SwiftUI design system for ARC Labs Studio applications.

## Overview

ARCDesignSystem provides **only what SwiftUI doesn't offer natively** — spacing tokens, semantic colors, typography helpers, accessibility utilities, and symbol effects. It follows Apple's design philosophy: use native APIs directly, and extend only where gaps exist.

### Design Philosophy

- **Minimal footprint**: No redundant wrappers for built-in SwiftUI APIs
- **Platform-native colors**: Uses Asset Catalogs with Light/Dark/High Contrast variants
- **WCAG 2.1 AA compliant**: All brand colors validated for accessibility
- **Dynamic Type ready**: Base values designed for use with `@ScaledMetric`
- **Reduce Motion aware**: Animations respect user accessibility settings

### What ARC Provides

| Category | Why Not Native | ARC Tokens |
|----------|---------------|------------|
| Branding | ARC Labs identity | `.arcBrandBurgundy`, `.arcBrandGold`, `.arcBrandBlack` |
| Typography | Brand font (Radley Sans) | `.arcBrandFont(.title)`, `.arcLargeTitle`, etc. |
| Spacing | SwiftUI has no spacing tokens | `.arcSpacingXSmall` through `.arcSpacingXXLarge` |
| Touch Targets | Platform-specific minimums | `.arcTouchTargetMinimum`, `.arcTouchTargetVisionOS` |
| Corner Radius | SwiftUI has no radius tokens | `.arcCornerRadiusSmall` through `.arcCornerRadiusXLarge` |
| Backgrounds | Cross-platform (UIKit/AppKit) | `.arcBackgroundPrimary/Secondary/Tertiary` |
| Extended Text | SwiftUI only has primary/secondary | `.arcTextTertiary`, `.arcTextQuaternary`, `.arcTextDisabled` |
| Accessibility | Contrast validation | ``ARCContrastCalculator``, ``ARCAccessibility`` |
| Animations | Reduce Motion aware | `.arcStandard`, `.arcSpring`, `.arcDefault` |
| Symbol Effects | Simplify SF Symbols API | `.arcSymbolEffect(.syncing)`, etc. |
| Materials | Convenience wrappers | `.arcMaterialBackground()` |

### What to Use Natively

| Instead of | Use Native SwiftUI |
|------------|-------------------|
| System fonts | `.body`, `.title`, `.headline`, etc. |
| Primary/Secondary text | `.primary`, `.secondary` |
| Accent colors | `.tint`, `.accentColor` |
| Basic animations | `.spring()`, `.smooth`, `.snappy` |
| Environment values | `@Environment(\.accessibilityReduceMotion)` |

## Topics

### Essentials

- <doc:GettingStarted>

### Branding

- ``SwiftUICore/Color/arcBrandBurgundy``
- ``SwiftUICore/Color/arcBrandGold``
- ``SwiftUICore/Color/arcBrandBlack``
- ``ARCBrandFont``

### Typography

- ``SwiftUICore/Font/arcLargeTitle``
- ``SwiftUICore/Font/arcTitle``
- ``SwiftUICore/Font/arcBody``
- ``SwiftUICore/Font/arcBrandFont(size:)``
- ``SwiftUICore/Font/arcBrandFont(_:)``
- ``ARCScaledFont``

### Spacing & Layout

- ``Swift/CGFloat/arcSpacingXSmall``
- ``Swift/CGFloat/arcSpacingSmall``
- ``Swift/CGFloat/arcSpacingMedium``
- ``Swift/CGFloat/arcSpacingLarge``
- ``Swift/CGFloat/arcSpacingXLarge``
- ``Swift/CGFloat/arcSpacingXXLarge``

### Touch Targets

- ``Swift/CGFloat/arcTouchTargetMinimum``
- ``Swift/CGFloat/arcTouchTargetRecommended``
- ``Swift/CGFloat/arcTouchTargetWatchOS``
- ``Swift/CGFloat/arcTouchTargetVisionOS``

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

### Accessibility

- ``ARCContrastCalculator``
- ``ARCAccessibility``

### Animations

- ``SwiftUICore/Animation/arcStandard``
- ``SwiftUICore/Animation/arcQuick``
- ``SwiftUICore/Animation/arcSmooth``
- ``SwiftUICore/Animation/arcSpring``
- ``SwiftUICore/Animation/arcDefault``
- ``ARCAnimationDuration``

### Symbol Effects

- ``ARCSymbolEffect``

### Materials

- ``SwiftUICore/Material/arcRegular``
- ``SwiftUICore/Material/arcThin``
- ``SwiftUICore/Material/arcThick``
