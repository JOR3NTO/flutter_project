# QA Log

Versión: 1.0.1
Fecha: 2025-10-20
Responsable: JOR3NTO

## Resumen
- Se generó APK de release y se subió a Firebase App Distribution.
- Se creó el grupo `QA_Clase` y se invitó a `dduran@uceva.edu.co`.

## Hallazgos
- 2025-10-20: Error de Gradle por mal posicionamiento del bloque `dependencies` en `android/app/build.gradle.kts`. Solución: mover el bloque al nivel correcto y agregar plugin `com.google.gms.google-services`.

## Estado
- Pruebas iniciales: Pendiente confirmación de instalación por parte del tester.

## Notas
- Asegurarse de incluir capturas de pantalla del panel de releases y del correo de invitación.
