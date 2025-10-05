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











