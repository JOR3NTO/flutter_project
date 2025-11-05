## Módulo Firebase: Universidades

### Descripción técnica

- **Arquitectura:**
    - Flutter + Provider para gestión de estado.
    - Firebase Firestore como backend para la colección `universidades`.
    - Separación en modelos (`lib/models/universidad.dart`), servicios (`lib/services/universidad_service.dart`), vistas y rutas.
    - Navegación con `go_router` y menú lateral persistente.

- **Estado y flujo:**
    - Listado en tiempo real usando `StreamBuilder` y Firestore.
    - Formulario para crear nuevas universidades (campos: nit, nombre, dirección, teléfono, página web).
    - Botón para eliminar con confirmación (diálogo modal).
    - Validación básica: todos los campos obligatorios, página web acepta cualquier string.

- **Validaciones:**
    - Todos los campos son requeridos.
    - El campo página web no exige formato URL, solo no vacío.
    - Eliminación requiere confirmación explícita.

- **Evidencias:**
    - Capturas de configuración de Firebase en el proyecto.
    - Capturas de la colección `universidades` en Firestore mostrando los documentos y campos.
    - Capturas de la app móvil mostrando el listado y la creación de universidades.

---


