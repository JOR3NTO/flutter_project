# Taller 1 – Introducción a Flutter

**Estudiante:** Jorge Eduardo Cobo Ocampo  
**Código:** 230222019

---


## Descripción

Este proyecto corresponde al **Taller 1 de Flutter**. La aplicación implementa navegación avanzada, paso de parámetros, ciclo de vida de widgets y el uso de varios widgets complejos.

---

## Arquitectura y Navegación

La navegación se implementa usando [`go_router`](https://pub.dev/packages/go_router), permitiendo rutas nombradas, paso de parámetros y diferentes métodos de navegación:

- **go:** Reemplaza toda la navegación anterior (no permite volver atrás).
- **push:** Agrega una nueva pantalla encima de la actual (permite volver atrás).
- **replace:** Reemplaza la pantalla actual en la pila (no elimina el historial anterior).

### Rutas principales

- `/` : Pantalla principal (HomeScreen)
- `/paso_parametros` : Demostración de paso de parámetros y navegación (go, push, replace)
- `/detalle/:parametro/:metodo` : Muestra el valor del parámetro recibido y el método de navegación
- `/ciclo_vida` : Evidencia del ciclo de vida de un StatefulWidget
- `/widgets_demo` : Demostración de GridView, TabBar y ListView

### Paso de parámetros
Desde `/paso_parametros` se puede navegar a `/detalle/:parametro/:metodo` enviando valores por la URL. En la pantalla de detalle se muestra el valor recibido y el método de navegación utilizado.

---

## Widgets usados y razón de su elección

- **GridView:** Para mostrar una cuadrícula de elementos de forma eficiente y responsiva.
- **TabBar + TabBarView:** Para manejar diferentes secciones dentro de una pantalla, permitiendo navegación horizontal entre vistas.
- **ListView:** Para mostrar listas verticales de elementos.
- **Drawer personalizado:** Para navegación lateral y acceso rápido a las diferentes rutas.
- **Ciclo de vida (initState, didChangeDependencies, build, setState, dispose):** Evidenciado en las pantallas `HomeScreen` y `CicloVidaScreen` con prints y comentarios.
- **Otros widgets:** AppBar, Text, ElevatedButton, Icon, Card, etc.

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
