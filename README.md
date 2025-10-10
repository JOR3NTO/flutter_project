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
2. **Listado de razas de perro:**
     - Captura de la pantalla con la lista y las imágenes cargadas.
3. **Detalle de raza con parámetros recibidos:**
     - Captura de la pantalla de detalle resaltando el nombre y la URL de la imagen recibidos como parámetros.
4. **Manejo de estados y errores:**
     - Capturas de consola mostrando prints de:
         - Estado de carga (`[DogService] Estado: Cargando razas de perro...`)
         - Éxito (`[DogService] Estado: Éxito al obtener razas (status 200)`)
         - Error (`[DogService] Error: ...`)

---
