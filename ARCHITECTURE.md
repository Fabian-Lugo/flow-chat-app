# Arquitectura del proyecto

## Resumen

**Flow-chat** es una aplicación de mensajería en tiempo real construida con Flutter. El código se organiza por **funcionalidad (features)** para escalar la UI y, más adelante, la capa de datos sin mezclar responsabilidades. La interfaz actual cubre autenticación (bienvenida, login, registro), bandeja de entrada, chat y perfil, con un **sistema de diseño** centralizado (`AppColors`, `AppTextStyle`).

---

## Stack tecnológico

| Área | Tecnología |
|------|------------|
| Framework | Flutter / Dart |
| Navegación | [go_router](https://pub.dev/packages/go_router) (`MaterialApp.router`, configuración en `lib/router/`) |
| Estilos | Tokens en `theme/` (colores, tipografía) |
| Fuentes | Google Fonts (Inter) |
| Iconos | Material + Cupertino |

La **gestión de estado global** y la **integración con backend** están pendientes de definir en la fase de API/WebSockets.

---

## Estructura de `lib/`

El árbol refleja la organización por feature: cada módulo agrupa lo que es específico de ese dominio; lo compartido permanece en la raíz de `lib/`.

```text
lib/
├── main.dart                 # Punto de entrada; usa MaterialApp.router
├── router/                   # Rutas y GoRouter (app_routes.dart, router.dart)
├── features/
│   ├── auth/
│   │   ├── presentation/   # Pantallas: welcome, login, register
│   │   ├── widgets/        # Widgets solo de auth (logo, links, checkbox, etc.)
│   │   └── services/       # Futura lógica de API/auth (placeholder)
│   └── chat/
│       ├── presentation/   # Pantallas: inbox, chat, profile
│       ├── widgets/        # Widgets de chat (mensajes, badges, estilos de lista)
│       └── services/       # Futura lógica de mensajería (placeholder)
├── models/                   # Entidades compartidas (p. ej. User)
├── theme/                    # Design system (colores, textos; sin rutas)
├── utils/                    # Utilidades de UI y helpers
└── widgets/                  # Componentes reutilizables entre features (inputs, botones, avatar genérico)
```

**Criterios rápidos**

- **¿Va en `features/<x>/widgets/`?** Si solo lo usa ese feature (p. ej. términos en registro → auth).
- **¿Va en `lib/widgets/`?** Si varios features lo reutilizan (inputs, botones, avatar compartido).
- **Rutas y nombres de path** viven en `router/app_routes.dart`; la tabla de rutas en `router/router.dart`.

---

## Sistema de diseño

- Los estilos visuales deben basarse en `AppColors` y `AppTextStyle`.
- Donde aplique, la UI adapta detalles por plataforma (`Platform.isIOS`, etc.).

---

## Fases del proyecto

1. **Cimientos** — Proyecto inicial, estructura de carpetas y navegación declarativa con `go_router`.
2. **UI y design system** — Pantallas principales y tokens de tema; widgets repartidos por feature o compartidos.
3. **Backend (siguiente)** — API, persistencia (p. ej. MongoDB), tiempo real (p. ej. WebSockets) y estado global según el equipo elija.

---

## Documentación relacionada

- Visión de producto y capturas: [`README.md`](README.md).
