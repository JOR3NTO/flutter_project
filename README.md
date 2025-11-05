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
      <img width="1559" height="657" alt="Captura de pantalla 2025-11-04 224635" src="https://github.com/user-attachments/assets/d7b9838f-5a67-42f0-ae2a-299ce0b75b1d" />
    - Capturas de la colección `universidades` en Firestore mostrando los documentos y campos.
      <img width="1550" height="574" alt="Captura de pantalla 2025-11-04 225611" src="https://github.com/user-attachments/assets/23f78b76-f337-4b26-9ece-11ad53dc1b18" />    - 
    - Capturas de la app móvil mostrando el listado y la creación de universidades.
      <img width="385" height="826" alt="Captura de pantalla 2025-11-04 225528" src="https://github.com/user-attachments/assets/317aa0d0-6ac9-4911-a602-31ea6360351a" />

---


