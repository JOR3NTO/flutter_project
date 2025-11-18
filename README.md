
# Flutter To-Do App (Offline-First + Autenticación)

Este proyecto es una aplicación Flutter que implementa:
- **Gestión de tareas (To-Do List) offline-first** con SQLite
- **Sincronización futura con API REST (estructura lista)**
- **Autenticación de usuario** (login, registro, JWT, almacenamiento seguro)
- **Gestión de estado con Provider**
- **Almacenamiento seguro** con `shared_preferences` y `flutter_secure_storage`
- **Arquitectura limpia**: separación en models, services, providers, views, widgets

## Estructura de carpetas

```
lib/
  models/           # Modelos de datos (Task, User)
  data/
    local/          # Acceso a SQLite
    remote/         # Acceso a API REST (mock/futuro)
  repositories/     # Lógica de acceso a datos
  providers/        # Providers de estado (Auth, Task)
  services/         # Servicios de autenticación y almacenamiento
  views/            # Pantallas (login, registro, tasks, evidencia, etc)
  widgets/          # Widgets reutilizables
  routes/           # Configuración de rutas (GoRouter)
  themes/           # Temas de la app
main.dart           # Punto de entrada
```

## Funcionalidades

- **Login y registro de usuario** (pantallas y flujo completo)
- **Almacenamiento seguro** de email y token JWT
- **Vista de evidencia**: muestra email, estado de sesión y permite cerrar sesión
- **To-Do List offline**: CRUD de tareas usando SQLite
- **Gestión de estado** con Provider
- **Preparado para sincronización remota** (estructura de TaskRemoteDataSource y repositorio)

## Instalación y ejecución

1. Clona el repositorio y entra a la carpeta:
   ```sh
   git clone <repo-url>
   cd flutter_project
   ```
2. Instala dependencias:
   ```sh
   flutter pub get
   ```
3. Configura Firebase si usas autenticación con Google (opcional):
   - Coloca tu `google-services.json` en `android/app/`
   - Coloca tu `GoogleService-Info.plist` en `ios/Runner/`
4. Corre la app:
   ```sh
   flutter run
   ```

## Dependencias principales
- provider
- sqflite
- path_provider
- shared_preferences
- flutter_secure_storage
- http
- go_router
- firebase_core (opcional)

## Uso
- Regístrate o inicia sesión
- Accede a la vista de evidencia para ver tu email y token
- Usa el menú para ir a la lista de tareas
- Agrega, marca y elimina tareas (persisten offline)

## Notas
- La sincronización con API REST está preparada pero deshabilitada por defecto (solo SQLite local)
- El almacenamiento seguro usa `shared_preferences` para email y `flutter_secure_storage` para el token
- El código está modularizado y listo para ampliaciones

---

**Autor:** JOR3NTO

**Licencia:** MIT
