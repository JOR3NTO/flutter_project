# Taller: Flutter – Segundo Plano y Asincronía

**Estudiante:** Jorge Eduardo Cobo Ocampo  
**Código:** 230222019

---

## Descripción

Este proyecto demuestra el uso de técnicas de segundo plano y asincronía en Flutter:

- Future/async/await para operaciones no bloqueantes
- Timer para cronómetros y tareas periódicas
- Isolate para procesamiento pesado en paralelo

---

## Diagrama de pantallas y flujos

```
HomeScreen
 ├─ Paso de Parámetros (go_router, parámetros)
 ├─ Ciclo de Vida (StatefulWidget)
 ├─ Demo Widgets (GridView, TabBar, ListView)
 ├─ Future/async/await (consulta simulada, estados)
 ├─ Cronómetro (Timer, control de tiempo)
 └─ Isolate (tarea pesada, comunicación por mensajes)
```

---

## ¿Cuándo usar cada técnica?

- **Future, async/await:** Cuando necesitas esperar el resultado de una operación (API, base de datos, archivo) sin bloquear la interfaz. Permite mostrar estados como "Cargando...", "Éxito" o "Error" y mantener la app responsiva.
- **Timer:** Para ejecutar acciones periódicas, como cronómetros, animaciones, recordatorios o tareas repetitivas. Es importante cancelar el Timer al pausar o salir de la vista para evitar fugas de memoria.
- **Isolate:** Cuando tienes tareas muy pesadas (cálculos, procesamiento de datos) que podrían bloquear la UI si se ejecutan en el hilo principal. Los Isolates permiten ejecutar código en paralelo y comunicar resultados por mensajes.

---

## Pantallas principales

- `/` : Pantalla principal (HomeScreen)
- `/async_demo` : Demostración de Future/async/await y estados de carga
- `/timer` : Cronómetro con Timer (iniciar, pausar, reanudar, reiniciar)
- `/isolate_demo` : Ejemplo de tarea pesada usando Isolate

---

## Flujos de funcionamiento

**Future/async/await:**
1. Presionar botón → Se inicia la consulta simulada (Future.delayed)
2. UI muestra "Cargando..."
3. Al terminar, muestra "Éxito" o "Error" según el resultado
4. Se imprime en consola el orden de ejecución

**Cronómetro (Timer):**
1. Iniciar → Timer comienza a contar cada segundo
2. Pausar → Timer se cancela, tiempo se mantiene
3. Reanudar → Timer vuelve a contar desde el tiempo actual
4. Reiniciar → Timer se cancela y tiempo vuelve a cero
5. Al salir de la vista, el Timer se cancela para liberar recursos

**Tarea pesada (Isolate):**
1. Presionar botón → Se crea un Isolate para ejecutar la suma grande
2. Isolate calcula y envía el resultado por mensaje
3. UI muestra el resultado y libera el Isolate

---

## Ejecución del proyecto

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

---
## Evidencias
**Menú global (CustomDrawer)**

Evidencia: Captura de pantalla mostrando el menú lateral abierto con las opciones principales.
Descripción: Se implementó un Drawer global accesible desde todas las vistas principales, permitiendo navegación rápida entre demos y funcionalidades.
<img width="408" height="847" alt="Captura de pantalla 2025-10-05 170556" src="https://github.com/user-attachments/assets/3455a208-80c4-4c35-b2da-228d59f3ce1a" />


**Demo Future/async/await**

Evidencia: Captura de la pantalla "Demo Asincronía (Future/async/await)" mostrando el resultado exitoso o el mensaje de error.
Descripción: Se desarrolló una vista que simula la consulta de datos usando Future y async/await, mostrando el estado y manejando errores con SnackBar.

<img width="320" alt="Demo Async Await 1" src="https://github.com/user-attachments/assets/454c2414-6f06-4199-ac40-f7c450bca8c5" />
<img width="320" alt="Demo Async Await 2" src="https://github.com/user-attachments/assets/4fafa8a4-5d4e-489f-89fb-97deaa9782ef" />



**Cronómetro (Timer)**

Evidencia: Captura de la pantalla del cronómetro mostrando el tiempo y los botones de control.
Descripción: Se implementó un cronómetro usando Timer, con controles para iniciar, pausar, reanudar y reiniciar el conteo.

<img width="375" height="822" alt="Captura de pantalla 2025-10-05 175525" src="https://github.com/user-attachments/assets/01c302b7-7eb2-4ebd-a8a8-77807699eb84" />

**Isolate (Tarea pesada)**

Evidencia: Captura de la pantalla de Isolate mostrando el estado antes y después de la tarea pesada.
Descripción: Se creó una demo que ejecuta una tarea pesada en un Isolate, mostrando el resultado sin bloquear la interfaz.

<img width="382" height="817" alt="Captura de pantalla 2025-10-05 175535" src="https://github.com/user-attachments/assets/7f70a8fc-9e8e-4619-bb4d-7fb96adf41d2" />
<img width="716" height="133" alt="image" src="https://github.com/user-attachments/assets/2cc7de4c-08ad-4567-9cdc-17aa2eaeb2d1" />















