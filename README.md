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

## Evidencias

### Evidencia 1 – Estado inicial de la app (Hola, Flutter)  
En esta captura se muestra la aplicación al iniciar, con el **AppBar** que contiene el título por defecto *“Hola, Flutter”*, junto con el nombre del estudiante y las imágenes cargadas en el **Row**.  

<img width="466" height="824" alt="Estado inicial" src="https://github.com/user-attachments/assets/79173306-776f-410f-a4da-ce4881631c2b" />

---

### Evidencia 2 – Estado tras presionar el botón (¡Título cambiado! + SnackBar)  
Aquí se evidencia el uso de **setState()**, que alterna el título del **AppBar** a *“¡Título cambiado!”* y despliega un **SnackBar** con el mensaje *“Título actualizado”*.  

<img width="451" height="318" alt="Cambio de título" src="https://github.com/user-attachments/assets/239e8da8-dca2-4613-89ec-5efc53506aa0" />  
<img width="425" height="298" alt="SnackBar" src="https://github.com/user-attachments/assets/2189fbf5-b500-4719-a3e1-771a0e99f1e4" />

---

### Evidencia 3 – Funcionamiento de los widgets adicionales  
Se muestran en ejecución los siguientes **widgets adicionales**:  

- **Container** con márgenes, bordes y color.  
- **ListView** con varios elementos y sus íconos.  
- **Stack** con una imagen y texto superpuesto.  
- **OutlinedButton.icon** con una acción secundaria que despliega un **SnackBar**.  

<img width="440" height="588" alt="Widgets adicionales" src="https://github.com/user-attachments/assets/df9c6e6b-b194-40bf-930b-4593f6c9b6c6" />

---

### Evidencia 4 – Pull Request feature/taller1 → dev  
Captura del **Pull Request** creado desde la rama `feature/taller1` hacia `dev`, donde se integran los cambios desarrollados para el taller.  

<img width="921" height="748" alt="PR feature/taller1 a dev" src="https://github.com/user-attachments/assets/b97f790c-eea6-401b-bc4b-2f57db026bf0" />

---

### Evidencia 5 – Pull Request dev → main  
Captura del **Pull Request** creado desde la rama `dev` hacia `main`, donde se integran las funcionalidades finales en la rama principal.  

<img width="944" height="775" alt="image" src="https://github.com/user-attachments/assets/85bf16c2-89b2-4547-bc24-3c7c9f5e7620" />












