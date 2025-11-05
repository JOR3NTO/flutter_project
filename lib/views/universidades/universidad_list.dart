import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../widgets/custom_drawer.dart';
import '../../services/universidad_service.dart';
import '../../models/universidad.dart';

class UniversidadList extends StatelessWidget {
  const UniversidadList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listado de Universidades'),
      ),
      drawer: const CustomDrawer(),
      body: StreamBuilder<List<Universidad>>(
        stream: UniversidadService().getUniversidadesStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final universidades = snapshot.data ?? [];
          if (universidades.isEmpty) {
            return const Center(child: Text('No hay universidades registradas.'));
          }
          return ListView.builder(
            itemCount: universidades.length,
            itemBuilder: (context, i) {
              final u = universidades[i];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  title: Text(u.nombre),
                  subtitle: Text(u.direccion),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.open_in_browser),
                        onPressed: () {
                          // Abrir página web
                          if (u.paginaWeb.isNotEmpty) {
                            // Puedes usar url_launcher aquí si lo deseas
                          }
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        tooltip: 'Eliminar',
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              title: const Text('Confirmar eliminación'),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Card(
                                    color: Colors.grey[100],
                                    child: ListTile(
                                      title: Text(u.nombre),
                                      subtitle: Text(u.direccion),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  const Text('Esta acción no se puede deshacer.', style: TextStyle(color: Colors.red)),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('Cancelar'),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                                  onPressed: () async {
                                    await UniversidadService().deleteUniversidad(u.id);
                                    if (context.mounted) Navigator.pop(context);
                                  },
                                  child: const Text('Eliminar'),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text(u.nombre),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('NIT: ${u.nit}'),
                            Text('Dirección: ${u.direccion}'),
                            Text('Teléfono: ${u.telefono}'),
                            Text('Página web: ${u.paginaWeb}'),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Cerrar'),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push('/universidad_form');
        },
        child: const Icon(Icons.add),
        tooltip: 'Agregar universidad',
      ),
    );
  }
}
