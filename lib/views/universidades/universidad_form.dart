import 'package:flutter/material.dart';
import '../../services/universidad_service.dart';
import '../../models/universidad.dart';
import 'package:go_router/go_router.dart';

class UniversidadForm extends StatefulWidget {
  const UniversidadForm({super.key});

  @override
  State<UniversidadForm> createState() => _UniversidadFormState();
}

class _UniversidadFormState extends State<UniversidadForm> {
  final _formKey = GlobalKey<FormState>();
  final _nitController = TextEditingController();
  final _nombreController = TextEditingController();
  final _direccionController = TextEditingController();
  final _telefonoController = TextEditingController();
  final _paginaWebController = TextEditingController();
  bool _loading = false;

  @override
  void dispose() {
    _nitController.dispose();
    _nombreController.dispose();
    _direccionController.dispose();
    _telefonoController.dispose();
    _paginaWebController.dispose();
    super.dispose();
  }

  // Se elimina la validación estricta de URL para permitir cualquier string.

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _loading = true);
    final universidad = Universidad(
      id: '',
      nit: _nitController.text.trim(),
      nombre: _nombreController.text.trim(),
      direccion: _direccionController.text.trim(),
      telefono: _telefonoController.text.trim(),
      paginaWeb: _paginaWebController.text.trim(),
    );
    await UniversidadService().addUniversidad(universidad);
    setState(() => _loading = false);
    if (context.mounted) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nueva Universidad'),
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            tooltip: 'Regresar al menú principal',
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            },
          ),
          IconButton(
            icon: const Icon(Icons.arrow_back),
            tooltip: 'Regresar a universidades',
            onPressed: () {
              context.go('/universidades');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nitController,
                decoration: const InputDecoration(labelText: 'NIT'),
                validator: (v) => v == null || v.isEmpty ? 'Campo obligatorio' : null,
              ),
              TextFormField(
                controller: _nombreController,
                decoration: const InputDecoration(labelText: 'Nombre'),
                validator: (v) => v == null || v.isEmpty ? 'Campo obligatorio' : null,
              ),
              TextFormField(
                controller: _direccionController,
                decoration: const InputDecoration(labelText: 'Dirección'),
                validator: (v) => v == null || v.isEmpty ? 'Campo obligatorio' : null,
              ),
              TextFormField(
                controller: _telefonoController,
                decoration: const InputDecoration(labelText: 'Teléfono'),
                validator: (v) => v == null || v.isEmpty ? 'Campo obligatorio' : null,
              ),
              TextFormField(
                controller: _paginaWebController,
                decoration: const InputDecoration(labelText: 'Página web'),
                validator: (v) => v == null || v.isEmpty ? 'Campo obligatorio' : null,
              ),
              const SizedBox(height: 24),
              _loading
                ? const Center(child: CircularProgressIndicator())
                : ElevatedButton(
                    onPressed: _submit,
                    child: const Text('Guardar'),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
