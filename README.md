# 🧩 ARCDesignSystem

Un **design system modular** para SwiftUI, pensado para escalar productos de ARC Labs manteniendo consistencia visual en todo el ecosistema Apple.

![Swift](https://img.shields.io/badge/Swift-5.9-orange.svg)
![Platform](https://img.shields.io/badge/platforms-iOS%20%7C%20macOS%20%7C%20tvOS%20%7C%20watchOS-blue.svg)
![License](https://img.shields.io/badge/license-MIT-lightgrey.svg)
![Xcode](https://img.shields.io/badge/Xcode-15%2B-blue.svg)

---

## ¿Qué es ARCDesignSystem?

`ARCDesignSystem` concentra los **tokens de diseño compartidos** (espaciados, tipografías, colores, radios de esquina, animaciones y padding) y ofrece utilidades multiplataforma para integrarlos en proyectos SwiftUI. Todo el contenido respeta las guías de interfaz humana de Apple y se adapta automáticamente a Dynamic Type cuando está disponible.

---

## Características clave

- Tokens adaptativos que escalan según la preferencia tipográfica del usuario (`DynamicTypeSize`).
- Integración multiplataforma (iOS, macOS, tvOS, watchOS) con helpers que abstraen UIKit/AppKit.
- Previews listas para usar: documentación viva, galería visual e iteración interactiva.
- Arquitectura simple pensada para extender colores, fuentes o componentes propios.
- Código documentado que acelera el onboarding del equipo de diseño y desarrollo.

---

## Estructura del paquete

```
Sources/
  ARCDesignSystem/
    ARCDesignSystem.swift                 // Tokens centrales: spacing, fonts, colors, radius, animations
    Previews/
      ARCDesignSystemPreview.swift        // Catálogo visual de tokens
      ARCDesignSystemInteractivePreview.swift
      ARCDesignSystemDocumentation.swift
      Helpers/ARCColor+Helpers.swift      // Helper multiplataforma de colores
```

- `ARCLayoutScale` calcula el factor de escala según Dynamic Type (UIKit) o usa un valor neutro en macOS.
- Las extensiones sobre `CGFloat`, `EdgeInsets`, `Color`, `Font` y `Animation` publican los tokens.
- `ARCColorHelper` devuelve `Color` seguros en cualquiera de las plataformas soportadas.

---

## Instalación con Swift Package Manager

1. En Xcode, ve a **File › Add Packages...** y pega la URL del repositorio.
2. Selecciona la versión mínima deseada (`0.1.0` o superior) y añade el paquete al target correspondiente.

O bien, agrega la dependencia directamente en `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/carlosrasensio/ARCDesignSystem.git", from: "0.1.0")
]
```

---

## Uso rápido

Importa el módulo y utiliza los tokens para construir vistas consistentes:

```swift
import SwiftUI
import ARCDesignSystem

struct ARCExampleCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: .arcSpacingMedium) {
            Text("Estado de cuenta")
                .font(.arcFontTitleSmall)
                .foregroundStyle(.arcTextPrimary)

            Text("Saldo disponible")
                .font(.arcFontBodySmall)
                .foregroundStyle(.arcTextSecondary)

            Text("$1,245.30")
                .font(.arcFontTitleLarge)
                .foregroundStyle(.arcTextPrimary)
        }
        .padding(.arcPaddingCard)
        .background(.arcBackgroundSecondary)
        .clipShape(RoundedRectangle(cornerRadius: .arcCornerRadiusMedium))
        .shadow(color: .arcShadowMedium, radius: 8, x: 0, y: 4)
        .animation(.arcAnimationBase, value: UUID())
    }
}
```

- Los espaciados (`.arcSpacing*`) y paddings (`.arcPadding*`) ya consideran Dynamic Type.
- Las tipografías usan `Font.system` con diseño `rounded` y pesos predefinidos para títulos y contenidos.
- Las paletas `.arcBackground*` y `.arcText*` se adaptan a esquemas claro/oscuro.

---

## Catálogo y previews incluidos

El paquete expone tres vistas pensadas para documentación y validación visual (requieren iOS 15+ o macOS 12+):

```swift
import ARCDesignSystem

#Preview {
    ARCDesignSystemPreview()
}
```

- `ARCDesignSystemPreview`: muestra los tokens principales en una galería navegable.
- `ARCDesignSystemInteractivePreview`: permite probar cambios de esquema de color y Dynamic Type en tiempo real.
- `ARCDesignSystemDocumentation`: catálogo tipo handoff con secciones de colores, tipografías, espaciados, radios y animaciones.

Puedes añadir estas vistas como previews en Xcode, integrarlas en un target de demo o incorporarlas a tus herramientas internas de diseño.

---

## Tokens disponibles

**Espaciado** (`CGFloat`)

| Token | Valor base |
| --- | --- |
| `arcSpacingXSmall` | 4 pt |
| `arcSpacingSmall` | 8 pt |
| `arcSpacingMedium` | 12 pt |
| `arcSpacingLarge` | 16 pt |
| `arcSpacingXLarge` | 24 pt |
| `arcSpacingXXLarge` | 32 pt |

**Corner radius** (`CGFloat`)

| Token | Valor base |
| --- | --- |
| `arcCornerRadiusSmall` | 6.4 pt |
| `arcCornerRadiusMedium` | 12.8 pt |
| `arcCornerRadiusLarge` | 19.2 pt |
| `arcCornerRadiusXLarge` | 25.6 pt |

**Tipografías** (`Font`)

| Token | Base | Peso |
| --- | --- | --- |
| `arcFontTitleLarge` | Large Title (`rounded`) | Bold |
| `arcFontTitleMedium` | Title2 (`rounded`) | Semibold |
| `arcFontTitleSmall` | Title3 (`rounded`) | Semibold |
| `arcFontBodyLarge` | Body (`rounded`) | Regular |
| `arcFontBodyMedium` | Callout (`rounded`) | Regular |
| `arcFontBodySmall` | Footnote (`rounded`) | Regular |
| `arcFontLabelSmall` | Caption (`rounded`) | Regular |

**Colores** (`Color`)

| Token | Descripción |
| --- | --- |
| `arcBackgroundPrimary` | Fondo base dinámico |
| `arcBackgroundSecondary` | Fondo para tarjetas/contenedores |
| `arcBackgroundTertiary` | Fondo sutil de secciones |
| `arcTextPrimary` | Texto principal |
| `arcTextSecondary` | Texto secundario/captions |
| `arcHighlight` | Color de acento |
| `arcShadowLight` / `arcShadowMedium` / `arcShadowStrong` | Niveles de sombra |

**Animaciones** (`Animation`)

| Token | Descripción |
| --- | --- |
| `arcAnimationBase` | `easeInOut` de 0.25 s |
| `arcAnimationSmooth` | `easeInOut` de 0.35 s |
| `arcAnimationQuick` | `spring` con respuesta 0.25 s y amortiguación 0.8 |

Los valores se escalan con `ARCLayoutScale.arcScaleFactor` de acuerdo con la preferencia de tamaño de texto del usuario cuando la plataforma lo soporta (UIKit).

---

## Extender o personalizar

1. **Nuevos tokens**: crea extensiones propias en tu proyecto o contribuye al paquete.

   ```swift
   public extension Font {
       static let arcFontDisplay = Font.system(.largeTitle, design: .serif).weight(.bold)
   }
   ```

2. **Soporte de marca**: agrega colores adicionales en `Color` o dentro de `ARCColorHelper` para garantizar compatibilidad multiplataforma.
3. **Componentes**: utiliza los tokens como base para botones, tarjetas o listados y mantén las dependencias en `SwiftUI`.
4. **Documentación interna**: crea vistas similares a las previews existentes para tus componentes custom y compártelas con el equipo.

---

## Compatibilidad y requisitos

- Swift 5.9 o superior
- Xcode 15 o superior
- iOS 15, macOS 12, tvOS 15 y watchOS 9 (o versiones posteriores con disponibilidad equivalente)
- SwiftUI como framework principal

---

## Contribuciones

Las contribuciones son bienvenidas. Abre un issue o pull request describiendo el caso de uso, los tokens necesarios y captura de previews si aplica.

---

## Licencia

Este proyecto se distribuye bajo la licencia [MIT](LICENSE).

