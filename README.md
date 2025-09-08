# Taller 1 – Introducción a Flutter

**Estudiante:** Jorge Eduardo Cobo Ocampo  
**Código:** 230222019

---

## Descripción

Este proyecto corresponde al **Taller 1 de Flutter**. Se desarrolló una aplicación que cumple con los siguientes requisitos:

- Uso de `setState()` para cambiar dinámicamente el título en la AppBar.
- Botón que muestra un `SnackBar` al actualizar el estado.
- Inclusión de imágenes mediante `Image.network` e `Image.asset`.
- Uso de al menos **dos widgets adicionales**.

---

## Componentes principales

La aplicación utiliza los siguientes widgets de Flutter:

- **AppBar:** Título dinámico con `setState`.
- **Text:** Muestra el nombre del estudiante.
- **Row:** Disposición horizontal de imágenes.
- **Image.network:** Carga una imagen desde la web.
- **Image.asset:** Carga una imagen local.
- **ElevatedButton:** Botón principal que cambia el título.
- **SnackBar:** Mensaje de confirmación al cambiar el título.
- **Container:** Con márgenes, colores y bordes.
- **ListView:** Lista con íconos y texto.
- **Stack:** Superposición de texto sobre una imagen.
- **OutlinedButton.icon:** Botón adicional con ícono y acción secundaria.
- **Padding, SizedBox, Column, SingleChildScrollView:** Organización del diseño visual.

---

## Ejecución del proyecto

Sigue estos pasos para ejecutar la aplicación:

1. **Clona el repositorio:**
    ```bash
    git clone https://github.com/JOR3NTO/flutter_project.git
    cd flutter_project
    ```
2. **Instala las dependencias:**
    ```bash
    flutter pub get
    ```
3. **Ejecuta la aplicación:**
    ```bash
    flutter run
    ```
