# Arquitectura del Proyecto y Contexto 🏗️📱

## Resumen del Proyecto 🌟
**Flow-chat** es una aplicación de mensajería en tiempo real de alto rendimiento construida con Flutter. El proyecto se enfoca en ofrecer una experiencia de usuario premium, aprovechando un sistema de diseño centralizado y una estructura de carpetas limpia y escalable. Actualmente, toda la capa de interfaz de usuario (UI) está finalizada, incluyendo flujos de autenticación, gestión de contactos y la interfaz principal de chat. 🚀

---

## Stack Tecnológico 🛠️
- **Frontend**: Flutter & Dart 💙
- **Gestión de Estado**: (Punto a decidir/implementar durante la integración con el backend) 🧠
- **Estilos**: Enfoque tipo CSS centralizado con un Sistema de Diseño propio (`AppColors`, `AppTextStyle`). 🎨
- **Iconos**: Material Icons & Cupertino Icons. 💎
- **Fuentes**: Google Fonts (Inter). ✍️

---

## Estructura de Directorios 📂
El proyecto sigue una estructura modular para garantizar la mantenibilidad y el orden:

```text
lib/
├── models/         # 🧩 Entidades de datos (ej. User, Message)
├── screens/        # 📱 Pantallas completas (Login, Register, Inbox, Chat)
├── services/       # ⚙️ Lógica para comunicación con el backend y APIs
├── theme/          # 🎨 Sistema de diseño (Colores, Estilos de texto, Rutas)
├── utils/          # 🛠️ Clases de utilidad y adornos para UI (Bordes, Inputs)
├── widgets/        # 🧱 Componentes de UI reutilizables (Avatares, Badges, Botones)
└── main.dart       # 🚀 Punto de entrada de la app y configuración global
```

---

## Sistema de Diseño (Design System) ❤️
- **Tokens Centralizados**: Todos los elementos de la interfaz hacen referencia a `AppColors` y `AppTextStyle` para asegurar consistencia visual total. ✨
- **Diseño Adaptable (Responsive)**: Diseñado para funcionar perfectamente en diferentes tamaños de pantalla. 📱💻
- **Adaptación por Plataformas**: Utiliza verificaciones de `Platform.isIOS` para ofrecer una experiencia nativa tanto en Android como en iOS (ej. `CupertinoButton` vs `IconButton`). 🍏🤖

---

## Contexto del Proyecto y Progreso Actual 📈
1. **Fase 1: Cimientos (Completado) ✅**
   - Configuración inicial del proyecto y enrutamiento (Routing).
   - Estructura básica de carpetas.
2. **Fase 2: UI/UX & Sistema de Diseño (Completado) ✅**
   - Implementación de todas las pantallas (Welcome, Login, Register, Inbox, Chat).
   - Creación de los sistemas de diseño en `AppColors` y `AppTextStyle`.
   - Refactorización de todos los componentes para usar tokens centralizados.
3. **Fase 3: Integración con el Backend (Siguiente Paso) ⏳**
   - Conexión con el backend en Node.js / MongoDB.
   - Actualizaciones en tiempo real mediante WebSockets (Socket.io). 💬
   - Implementación del manejo de estado global (State Management).
