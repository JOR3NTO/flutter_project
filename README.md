
## Distribución y pruebas (Firebase App Distribution)

Pasos rápidos para el taller:

1. Generar APK de release:
    - Ejecutar: `flutter build apk` (genera `build/app/outputs/flutter-apk/app-release.apk`).
2. Configurar Firebase:
    - Crear o abrir su proyecto en Firebase Console.
    - Registrar la app Android usando `applicationId` en `android/app/build.gradle.kts`.
    - Subir `google-services.json` al folder `android/app/`.
3. App Distribution:
    - Ir a App Distribution → Testers & Groups y crear un grupo `QA_Clase`.
    - Agregar `dduran@uceva.edu.co` como tester.
    - Subir el APK (`app-release.apk`) en Releases y asignarlo al grupo `QA_Clase`.
    - Incluir notas de la versión (Release Notes): cambios, fecha, credenciales si aplica.
    - Distribuir y copiar el enlace de instalación para evidencias.

Checklist de evidencias:
 - Captura del panel de Releases con la versión visible.
 - Captura del grupo de testers mostrando a `dduran@uceva.edu.co` agregado.
 - Captura del correo de invitación o del enlace de instalación.
 - Foto/captura de la app instalada en un dispositivo Android.
 - Evidencia de actualización (por ejemplo, versión `1.0.0` → `1.0.1`).
 - Bitácora corta de QA (versión, fecha, cambios, incidencias, estado).

Template de Release Notes (ejemplo):
```
Versión: 1.0.1
Fecha: 2025-10-20
Cambios:
- Corrección de error de compilación en Gradle (moved dependencies block)
- Integración de Firebase App Distribution
Responsables: JOR3NTO
Credenciales de prueba: Usuario: demo / Pass: demo 
```

---

## QA Log
Archivo de seguimiento de pruebas rápidas y hallazgos en `docs/qa_log.md`.

### Cambios recientes
- 2025-10-20: Se cambió el icono de la app. Se generaron los assets con `flutter_launcher_icons` usando `assets/img/app_icon.png`.


