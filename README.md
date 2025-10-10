# ---

## Módulo: Consumo de API HTTP – Dog CEO

### Explicación de la API utilizada

Se utiliza la API pública [Dog CEO](https://dog.ceo/dog-api/) para obtener un listado de razas de perro y una imagen aleatoria por raza. Es una API gratuita, sin autenticación, ideal para pruebas y aprendizaje de consumo HTTP en Flutter.

**Endpoints principales:**
- Listado de razas: `https://dog.ceo/api/breeds/list/all`
- Imagen de raza: `https://dog.ceo/api/breed/{breed}/images/random`

**Ejemplo de respuesta (razas):**
```json
{
    "message": {
        "affenpinscher": [],
        "african": [],
        "airedale": [],
        ...
    },
    "status": "success"
}
```

**Ejemplo de respuesta (imagen):**
```json
{
    "message": "https://images.dog.ceo/breeds/hound-afghan/n02088094_1003.jpg",
    "status": "success"
}
```

---

### Rutas y navegación (go_router)

- `/dogs` : Listado de razas de perro (`DogListView`)
- `/dogs/detail/:name?imageUrl=...` : Detalle de raza (`DogDetailView`)

La navegación se realiza usando go_router, pasando el nombre de la raza y la URL de la imagen como parámetros. El botón “atrás” funciona correctamente y regresa al listado.

---

### Decisiones técnicas

- **Separación de lógica:**
    - Modelos en `lib/models/`
    - Servicios HTTP en `lib/services/`
    - Vistas en `lib/views/dogs/`
    - Rutas en `lib/routes/app_router.dart`
- **No se hacen peticiones en el build:** Solo en `initState`.
- **Manejo de estados:** Loading, éxito y error con `FutureBuilder` y mensajes claros en consola y UI.
- **Manejo de errores:** try/catch, validación de statusCode, mensajes amigables y logs.
- **Imágenes:** Se obtiene una imagen real por raza usando el endpoint de imagen random. Si falla, se muestra sin imagen.
- **UI:** Drawer global con acceso directo al módulo Dog CEO.

---

### Evidencias y capturas

1. **Menú con acceso a Dog CEO (HTTP):**
     - Captura mostrando la opción en el Drawer lateral.
     - <img width="275" height="785" alt="Captura de pantalla 2025-10-09 201214" src="https://github.com/user-attachments/assets/3a7a3939-8c76-4880-8ed7-2867fcc0ad62" />
2. **Listado de razas de perro:**
     - Captura de la pantalla con la lista y las imágenes cargadas.
     - <img width="394" height="838" alt="Captura de pantalla 2025-10-09 194122" src="https://github.com/user-attachments/assets/bb4d5690-b3ac-4645-8c58-e6b9605c8b8c" />
3. **Detalle de raza con parámetros recibidos:**
     - Captura de la pantalla de detalle resaltando el nombre y la URL de la imagen recibidos como parámetros.
     - <img width="381" height="827" alt="Captura de pantalla 2025-10-09 194318" src="https://github.com/user-attachments/assets/98782e9a-004f-4b37-9a39-6e99e509fae4" />
     - <img width="377" height="832" alt="Captura de pantalla 2025-10-09 194327" src="https://github.com/user-attachments/assets/de99885d-ac4c-40c7-ac0c-f14b224ce91f" />       
4. **Manejo de estados y errores:**
     - Capturas de consola mostrando prints de:
         - Estado de carga (`[DogService] Estado: Cargando razas de perro...`)
         - <img width="748" height="101" alt="Captura de pantalla 2025-10-09 200130" src="https://github.com/user-attachments/assets/485b971a-bd89-4cf1-9dbc-71c0943caf91" />
         - Éxito (`[DogService] Estado: Éxito al obtener razas (status 200)`)
         - <img width="903" height="305" alt="Captura de pantalla 2025-10-09 194836" src="https://github.com/user-attachments/assets/c879874f-5cb3-4ad2-8c9d-b99ede2ab46b" />
         - Error (`[DogService] Error: ...`)

---
