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












