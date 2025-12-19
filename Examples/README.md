# ARCDesignSystem Demo App

This Xcode project demonstrates all features of the ARCDesignSystem package in a runnable iOS application.

## Requirements

- Xcode 16.0+
- iOS 17.0+ Simulator or device

## Running the Demo

1. Open the project in Xcode:
   ```bash
   open ARCDesignSystemDemo.xcodeproj
   ```

2. Select an iOS Simulator (iPhone 15 Pro recommended)

3. Press `Cmd + R` to build and run

## Demo Screens

### Token Catalog
Browse all design tokens with visual examples:
- **Spacing**: Visual representations of XSmall through XXLarge spacing values
- **Corner Radius**: Interactive display of Small through XLarge radii
- **Colors**: Background, text, separator, and shadow color tokens
- **Padding Presets**: Card, section, compact, and horizontal padding
- **Materials**: Thin, regular, and thick material blur effects
- **Symbol Effects**: Link to full symbol effects demo

### Component Showcase
Real-world UI components built with ARC tokens:
- **Cards**: Sample cards with icons, titles, and descriptions
- **Buttons**: Primary, secondary, tertiary, and icon button styles
- **Forms**: Text fields, toggles, and segmented pickers
- **Lists**: Navigable list rows with icons and subtitles

### Interactive Playground
Hands-on testing for materials and vibrancy:
- **Material Picker**: Switch between ultra thin, thin, regular, and thick materials
- **Corner Radius Slider**: Adjust corner radius in real-time
- **Vibrancy Toggle**: Compare vibrancy labels vs standard text
- **Live Preview**: See all changes applied to a dynamic card

### Accessibility Testing
Verify Dynamic Type support:
- **Size Selector**: Test all Dynamic Type sizes from XS to A3
- **Typography Scale**: See how text scales with size changes
- **@ScaledMetric Demo**: Interactive example of spacing that scales
- **Interactive Elements**: Buttons that maintain tappability at all sizes

## Architecture

```
Examples/
└── ARCDesignSystemDemo/
    ├── ARCDesignSystemDemoApp.swift    # App entry point
    ├── ContentView.swift               # Navigation menu
    ├── Screens/
    │   ├── TokenCatalogScreen.swift         # Token browser
    │   ├── ComponentShowcaseScreen.swift    # UI components
    │   ├── InteractivePlaygroundScreen.swift # Material/vibrancy testing
    │   └── AccessibilityTestScreen.swift    # Dynamic Type testing
    └── Components/
        ├── SampleCard.swift            # Card component demo
        ├── SampleButtonRow.swift       # Button styles demo
        ├── SampleForm.swift            # Form elements demo
        └── SampleList.swift            # List row demo
```

## Key Patterns Demonstrated

### Using @ScaledMetric for Dynamic Type

```swift
struct MyView: View {
    @ScaledMetric(relativeTo: .body) var spacing = CGFloat.arcSpacingLarge
    
    var body: some View {
        VStack(spacing: spacing) {
            // Content scales with Dynamic Type
        }
    }
}
```

### Applying Materials

```swift
Text("Floating Card")
    .padding(.arcPaddingCard)
    .arcMaterialBackground(.arcRegular, cornerRadius: .arcCornerRadiusMedium)
```

### Using Vibrancy Labels

```swift
VStack {
    Text("Primary").arcVibrancyLabel()
    Text("Secondary").arcVibrancySecondary()
    Text("Tertiary").arcVibrancyTertiary()
}
.background(.regularMaterial)
```

### Semantic Colors

```swift
VStack {
    Color.arcBackgroundPrimary    // Main screen background
    Color.arcBackgroundSecondary  // Cards, elevated surfaces
    Color.arcBackgroundTertiary   // Grouped content
}
```

## Notes

- The demo app is for **iOS only** (not macOS/tvOS/watchOS)
- Uses SwiftUI's native fonts and colors where appropriate
- Demonstrates the philosophy: use SwiftUI natively, use ARC tokens for what's missing

## License

MIT License - see main package LICENSE for details.
