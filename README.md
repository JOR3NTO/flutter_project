

# Taller JWT Flutter + Backend Oracle

## Backend desplegado (Oracle Cloud)

Base URL: `http://157.137.237.230:8080/auth`

### Endpoints disponibles:

- **Registro:**
    - `POST http://157.137.237.230:8080/auth/register`
    - Body: `{ "email": "test@email.com", "password": "123456" }`
    - Respuesta: 200 OK si éxito, 400 si error

- **Login:**
    - `POST http://157.137.237.230:8080/auth/login`
    - Body: `{ "email": "test@email.com", "password": "123456" }`
    - Respuesta: 200 OK (token JWT como string plano), 401 si error

- **Obtener usuario autenticado:**
    - `GET http://157.137.237.230:8080/auth/me`
    - Header: `Authorization: Bearer <token>`
    - Respuesta: datos del usuario (JSON)

No hay refresh token, solo access_token.

---

## Funcionalidad Flutter

- Login y registro usando JWT contra el backend Oracle
- Manejo de estados (cargando, éxito, error) y separación por servicios
- Almacenamiento local:
    - **shared_preferences:** email (no sensible)
    - **flutter_secure_storage:** access_token (sensible)
- Vista de evidencia:
    - Muestra email guardado
    - Indica si el token está presente o no
    - Botón para cerrar sesión (elimina datos locales)

### Rutas principales en la app

- `/login` — Pantalla de inicio de sesión
- `/register` — Pantalla de registro
- `/evidence` — Pantalla de evidencia de almacenamiento local
- `/` — Menú principal

### Menú lateral

- Acceso directo a login, registro y evidencia

---

## ¿Cómo probar?

1. Regístrate con un email y contraseña válidos
2. Inicia sesión con esos datos
3. Accede a la pantalla de evidencia desde el menú
4. Verifica el email y el estado del token
5. Usa el botón "Cerrar sesión" para borrar los datos

---

## QA Log
Archivo de seguimiento de pruebas rápidas y hallazgos en `docs/qa_log.md`.

### Cambios recientes
- 2025-10-20: Se cambió el icono de la app. Se generaron los assets con `flutter_launcher_icons` usando `assets/img/app_icon.png`.


