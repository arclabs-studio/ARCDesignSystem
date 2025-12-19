//
//  ARCSymbolEffectsPreview.swift
//  ARCDesignSystem
//
//  Created by ARC Labs on 12/18/25.
//

import SwiftUI

/// Interactive gallery showcasing all ARC Symbol Effect presets.
///
/// `ARCSymbolEffectsPreview` provides a hands-on demonstration of every
/// symbol effect in the ARC Design System, organized by effect type.
/// Use this view to explore effects and understand their behavior.
///
/// ## Organization
///
/// The gallery is divided into four tabs matching the Symbols framework:
///
/// 1. **Indefinite**: Continuous effects (syncing, loading, hover)
/// 2. **Discrete**: One-shot effects (success, error, add item)
/// 3. **Content Transitions**: Symbol variant changes
/// 4. **Transitions**: Appear/disappear effects
///
/// ## Usage
///
/// View in Xcode Previews or integrate into your app's developer tools:
///
/// ```swift
/// #Preview {
///     ARCSymbolEffectsPreview()
/// }
///
/// // Or as a debug screen
/// NavigationLink("Symbol Effects") {
///     ARCSymbolEffectsPreview()
/// }
/// ```
///
/// - Note: Requires iOS 17+, macOS 14+, tvOS 17+, or watchOS 10+.
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
public struct ARCSymbolEffectsPreview: View {
    @State private var selectedTab = 0

    public init() {}

    public var body: some View {
        #if os(tvOS) || os(watchOS)
        // Simplified layout for tvOS and watchOS
        ScrollView {
            VStack(spacing: .arcSpacingXLarge) {
                ARCIndefiniteEffectsSection()
                ARCDiscreteEffectsSection()
                ARCContentTransitionSection()
                ARCTransitionEffectsSection()
            }
            .padding(.arcPaddingSection)
        }
        .background(ARCColorHelper.backgroundPrimary)
        #else
        TabView(selection: $selectedTab) {
            ARCIndefiniteEffectsSection()
                .tabItem {
                    Label("Indefinite", systemImage: "repeat.circle")
                }
                .tag(0)

            ARCDiscreteEffectsSection()
                .tabItem {
                    Label("Discrete", systemImage: "hand.tap")
                }
                .tag(1)

            ARCContentTransitionSection()
                .tabItem {
                    Label("Transitions", systemImage: "arrow.left.arrow.right")
                }
                .tag(2)

            ARCTransitionEffectsSection()
                .tabItem {
                    Label("Appear/Remove", systemImage: "plus.slash.minus")
                }
                .tag(3)
        }
        #endif
    }
}

// MARK: - Indefinite Effects Section

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
private struct ARCIndefiniteEffectsSection: View {
    @State private var isRecording = false
    @State private var isSyncing = false
    @State private var isSearching = false
    @State private var isHovering = false

    var body: some View {
        ScrollView {
            VStack(spacing: .arcSpacingXLarge) {
                ARCEffectSectionHeader(
                    title: "Indefinite Effects",
                    subtitle: "Continuous animations while active"
                )

                ARCEffectCard(
                    title: "In Progress",
                    description: "Recording, downloading, processing",
                    systemImage: "record.circle"
                ) {
                    Image(systemName: "record.circle.fill")
                        .font(.system(size: 56))
                        .foregroundStyle(.red)
                        .arcSymbolEffect(.inProgress, isActive: isRecording)

                    Toggle("Active", isOn: $isRecording)
                        .labelsHidden()
                        .toggleStyle(.switch)
                }

                ARCEffectCard(
                    title: "Syncing",
                    description: "Cloud sync, data refresh",
                    systemImage: "arrow.triangle.2.circlepath"
                ) {
                    Image(systemName: "arrow.triangle.2.circlepath")
                        .font(.system(size: 56))
                        .foregroundStyle(.blue)
                        .arcSymbolEffect(.syncing, isActive: isSyncing)

                    Toggle("Active", isOn: $isSyncing)
                        .labelsHidden()
                        .toggleStyle(.switch)
                }

                ARCEffectCard(
                    title: "Searching",
                    description: "Network scanning, discovery",
                    systemImage: "wifi"
                ) {
                    Image(systemName: "wifi")
                        .font(.system(size: 56))
                        .foregroundStyle(.green)
                        .arcSymbolEffect(.searching, isActive: isSearching)

                    Toggle("Active", isOn: $isSearching)
                        .labelsHidden()
                        .toggleStyle(.switch)
                }

                ARCEffectCard(
                    title: "Hover",
                    description: "Focus state, interactive elements",
                    systemImage: "star.fill"
                ) {
                    Image(systemName: "star.fill")
                        .font(.system(size: 56))
                        .foregroundStyle(.yellow)
                        .arcSymbolEffect(.hover, isActive: isHovering)

                    Toggle("Active", isOn: $isHovering)
                        .labelsHidden()
                        .toggleStyle(.switch)
                }
            }
            .padding(.arcPaddingSection)
        }
        .background(ARCColorHelper.backgroundPrimary)
    }
}

// MARK: - Discrete Effects Section

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
private struct ARCDiscreteEffectsSection: View {
    @State private var successTrigger = 0
    @State private var errorTrigger = 0
    @State private var cartCount = 0
    @State private var updateTrigger = 0

    var body: some View {
        ScrollView {
            VStack(spacing: .arcSpacingXLarge) {
                ARCEffectSectionHeader(
                    title: "Discrete Effects",
                    subtitle: "One-shot animations triggered by events"
                )

                ARCEffectCard(
                    title: "Success",
                    description: "Action completed, form submitted",
                    systemImage: "checkmark.circle.fill"
                ) {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.system(size: 56))
                        .foregroundStyle(.green)
                        .arcSymbolEffect(.success, value: successTrigger)

                    Button("Trigger") {
                        successTrigger += 1
                    }
                    .buttonStyle(.borderedProminent)
                }

                ARCEffectCard(
                    title: "Error",
                    description: "Validation failed, action blocked",
                    systemImage: "xmark.circle.fill"
                ) {
                    Image(systemName: "xmark.circle.fill")
                        .font(.system(size: 56))
                        .foregroundStyle(.red)
                        .arcSymbolEffect(.error, value: errorTrigger)

                    Button("Trigger") {
                        errorTrigger += 1
                    }
                    .buttonStyle(.borderedProminent)
                }

                ARCEffectCard(
                    title: "Add Item",
                    description: "Add to cart, favorite, bookmark",
                    systemImage: "cart.badge.plus"
                ) {
                    HStack(spacing: .arcSpacingMedium) {
                        Image(systemName: "cart.badge.plus")
                            .font(.system(size: 56))
                            .foregroundStyle(.blue)
                            .arcSymbolEffect(.addItem, value: cartCount)

                        if cartCount > 0 {
                            Text("\(cartCount)")
                                .font(.title)
                                .foregroundStyle(.secondary)
                        }
                    }

                    Button("Add to Cart") {
                        cartCount += 1
                    }
                    .buttonStyle(.borderedProminent)
                }

                ARCEffectCard(
                    title: "Update",
                    description: "Content refreshed, data changed",
                    systemImage: "arrow.clockwise.circle.fill"
                ) {
                    Image(systemName: "arrow.clockwise.circle.fill")
                        .font(.system(size: 56))
                        .foregroundStyle(.purple)
                        .arcSymbolEffect(.update, value: updateTrigger)

                    Button("Trigger") {
                        updateTrigger += 1
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
            .padding(.arcPaddingSection)
        }
        .background(ARCColorHelper.backgroundPrimary)
    }
}

// MARK: - Content Transition Section

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
private struct ARCContentTransitionSection: View {
    @State private var isMuted = false
    @State private var isDarkMode = false
    @State private var networkStatus: NetworkStatus = .connected

    enum NetworkStatus: CaseIterable {
        case offline
        case connecting
        case connected

        var symbolName: String {
            switch self {
            case .offline: "wifi.slash"
            case .connecting: "wifi.exclamationmark"
            case .connected: "wifi"
            }
        }

        var displayName: String {
            switch self {
            case .offline: "Offline"
            case .connecting: "Connecting"
            case .connected: "Connected"
            }
        }

        var color: Color {
            switch self {
            case .offline: .red
            case .connecting: .orange
            case .connected: .green
            }
        }

        mutating func next() {
            switch self {
            case .offline: self = .connecting
            case .connecting: self = .connected
            case .connected: self = .offline
            }
        }
    }

    var body: some View {
        ScrollView {
            VStack(spacing: .arcSpacingXLarge) {
                ARCEffectSectionHeader(
                    title: "Content Transitions",
                    subtitle: "Smooth changes between symbols"
                )

                ARCEffectCard(
                    title: "Smooth (Auto)",
                    description: "System chooses optimal transition",
                    systemImage: "bell"
                ) {
                    Image(systemName: "bell")
                        .font(.system(size: 56))
                        .foregroundStyle(isMuted ? .gray : .blue)
                        .symbolVariant(isMuted ? .slash : .none)
                        .arcContentTransition(.smooth)

                    Button(isMuted ? "Unmute" : "Mute") {
                        withAnimation {
                            isMuted.toggle()
                        }
                    }
                    .buttonStyle(.borderedProminent)
                }

                ARCEffectCard(
                    title: "Upward",
                    description: "Both symbols animate upward",
                    systemImage: "sun.max"
                ) {
                    Image(systemName: isDarkMode ? "moon.stars.fill" : "sun.max.fill")
                        .font(.system(size: 56))
                        .foregroundStyle(isDarkMode ? .indigo : .orange)
                        .arcContentTransition(.upward)

                    Button(isDarkMode ? "Light Mode" : "Dark Mode") {
                        withAnimation {
                            isDarkMode.toggle()
                        }
                    }
                    .buttonStyle(.borderedProminent)
                }

                ARCEffectCard(
                    title: "Layered",
                    description: "Layer-by-layer animation",
                    systemImage: "wifi"
                ) {
                    VStack(spacing: .arcSpacingSmall) {
                        Image(systemName: networkStatus.symbolName)
                            .font(.system(size: 56))
                            .foregroundStyle(networkStatus.color)
                            .arcContentTransition(.layered)

                        Text(networkStatus.displayName)
                            .font(.callout)
                            .foregroundStyle(.secondary)
                    }

                    Button("Change Status") {
                        withAnimation {
                            networkStatus.next()
                        }
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
            .padding(.arcPaddingSection)
        }
        .background(ARCColorHelper.backgroundPrimary)
    }
}

// MARK: - Transition Effects Section

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
private struct ARCTransitionEffectsSection: View {
    @State private var showWelcome = false
    @State private var showNotification = false
    @State private var showSuccess = false

    var body: some View {
        ScrollView {
            VStack(spacing: .arcSpacingXLarge) {
                ARCEffectSectionHeader(
                    title: "Transition Effects",
                    subtitle: "Animations for appear/disappear"
                )

                ARCEffectCard(
                    title: "Appear",
                    description: "Symbol enters view hierarchy",
                    systemImage: "hand.wave"
                ) {
                    ZStack {
                        if showWelcome {
                            Image(systemName: "hand.wave.fill")
                                .font(.system(size: 56))
                                .foregroundStyle(.yellow)
                                .arcTransition(.appear)
                        }
                    }
                    .frame(height: 70)

                    Button(showWelcome ? "Hide" : "Show") {
                        withAnimation(.smooth) {
                            showWelcome.toggle()
                        }
                    }
                    .buttonStyle(.borderedProminent)
                }

                ARCEffectCard(
                    title: "Notification Badge",
                    description: "Common pattern for badges",
                    systemImage: "bell.badge"
                ) {
                    ZStack(alignment: .topTrailing) {
                        Image(systemName: "bell.fill")
                            .font(.system(size: 56))
                            .foregroundStyle(.blue)

                        if showNotification {
                            Image(systemName: "circle.fill")
                                .font(.system(size: 18))
                                .foregroundStyle(.red)
                                .offset(x: 8, y: -8)
                                .arcTransition(.appear)
                        }
                    }
                    .frame(height: 70)

                    Button(showNotification ? "Read" : "New Alert") {
                        withAnimation(.snappy) {
                            showNotification.toggle()
                        }
                    }
                    .buttonStyle(.borderedProminent)
                }

                ARCEffectCard(
                    title: "Success Confirmation",
                    description: "Temporary success indicator",
                    systemImage: "checkmark.circle"
                ) {
                    ZStack {
                        if showSuccess {
                            Image(systemName: "checkmark.circle.fill")
                                .font(.system(size: 56))
                                .foregroundStyle(.green)
                                .arcTransition(.appear)
                                .onAppear {
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                        withAnimation(.smooth) {
                                            showSuccess = false
                                        }
                                    }
                                }
                        } else {
                            Button("Save") {
                                withAnimation(.smooth) {
                                    showSuccess = true
                                }
                            }
                            .buttonStyle(.borderedProminent)
                        }
                    }
                    .frame(height: 70)
                }
            }
            .padding(.arcPaddingSection)
        }
        .background(ARCColorHelper.backgroundPrimary)
    }
}

// MARK: - Supporting Views

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
private struct ARCEffectSectionHeader: View {
    let title: String
    let subtitle: String

    var body: some View {
        VStack(spacing: .arcSpacingSmall) {
            Text(title)
                .font(.title)
                .foregroundStyle(.primary)

            Text(subtitle)
                .font(.callout)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, .arcSpacingMedium)
    }
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
private struct ARCEffectCard<Content: View>: View {
    let title: String
    let description: String
    let systemImage: String
    @ViewBuilder let content: () -> Content

    var body: some View {
        VStack(spacing: .arcSpacingMedium) {
            // Header
            HStack {
                Image(systemName: systemImage)
                    .foregroundStyle(ARCColorHelper.accent)

                VStack(alignment: .leading, spacing: 2) {
                    Text(title)
                        .font(.headline)
                        .foregroundStyle(.primary)

                    Text(description)
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }

                Spacer()
            }

            // Demo area
            VStack(spacing: .arcSpacingMedium) {
                content()
            }
            .frame(maxWidth: .infinity)
            .padding(.arcPaddingCard)
            .background(ARCColorHelper.backgroundSecondary)
            .clipShape(RoundedRectangle(cornerRadius: .arcCornerRadiusSmall))
        }
        .padding(.arcPaddingCard)
        .background(ARCColorHelper.backgroundTertiary)
        .clipShape(RoundedRectangle(cornerRadius: .arcCornerRadiusMedium))
    }
}

// MARK: - Previews

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
#Preview("Symbol Effects Gallery") {
    ARCSymbolEffectsPreview()
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
#Preview("Symbol Effects (Dark)") {
    ARCSymbolEffectsPreview()
        .preferredColorScheme(.dark)
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
#Preview("Symbol Effects (Light)") {
    ARCSymbolEffectsPreview()
        .preferredColorScheme(.light)
}
