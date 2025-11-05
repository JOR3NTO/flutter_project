import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../../providers/auth_provider.dart';

class EvidenceScreen extends StatelessWidget {
  const EvidenceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final email = authProvider.user?.email ?? 'No guardado';
    final token = authProvider.token;
    return Scaffold(
      appBar: AppBar(title: const Text('Evidencia de almacenamiento local')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Datos almacenados en shared_preferences:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('Email: $email'),
            // Si quieres agregar nombre, tema o idioma, aquí puedes mostrarlo
            const SizedBox(height: 24),
            const Text('Datos almacenados en flutter_secure_storage:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('Token: ${token != null && token.isNotEmpty ? 'Presente' : 'Sin token'}'),
            const SizedBox(height: 32),
            Center(
              child: ElevatedButton.icon(
                icon: const Icon(Icons.logout),
                label: const Text('Cerrar sesión y borrar datos'),
                onPressed: () async {
                  await authProvider.logout();
                  if (context.mounted) context.go('/login');
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
