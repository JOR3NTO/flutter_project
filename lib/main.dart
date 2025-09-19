import 'package:flutter/material.dart';
import 'routes/app_router.dart';
import 'themes/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // go_router para navegación
    return MaterialApp.router(
      theme: AppTheme.lightTheme, // Tema personalizado global
      title: 'Flutter - UCEVA',
      routerConfig: appRouter, // Configuración de rutas con go_router
    );
  }
}
