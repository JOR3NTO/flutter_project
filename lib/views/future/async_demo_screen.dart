import 'package:flutter/material.dart';
import '../../widgets/custom_drawer.dart';

class AsyncDemoScreen extends StatefulWidget {
  const AsyncDemoScreen({super.key});

  @override
  State<AsyncDemoScreen> createState() => _AsyncDemoScreenState();
}

class _AsyncDemoScreenState extends State<AsyncDemoScreen> {
  String _estado = 'Presiona el botón para consultar datos';
  bool _loading = false;

  Future<String> consultarDatosSimulado() async {
    print('Antes de la consulta (Future)');
    await Future.delayed(const Duration(seconds: 2));
    print('Durante la consulta (Future)');
    // Simula éxito o error aleatorio
    if (DateTime.now().second % 2 == 0) {
      return '¡Datos consultados con éxito!';
    } else {
      //throw Exception('Error al consultar los datos');
      return 'Error al consultar los datos';
    }
  }

  Future<void> ejecutarConsulta() async {
    setState(() {
      _estado = 'Cargando...';
      _loading = true;
    });
    try {
      final resultado = await consultarDatosSimulado();
      setState(() {
        _estado = resultado;
        _loading = false;
      });
      print('Después de la consulta (Future)');
    } catch (e) {
      setState(() {
        _estado = 'Ocurrió un error: $e';
        _loading = false;
      });
      // Mostrar un SnackBar en vez de detener la app
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Ocurrió un error al consultar los datos'),
            backgroundColor: Colors.red,
          ),
        );
      }
      print('Después de la consulta (Future) con error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Demo Asincronía (Future/async/await)')),
      drawer: const CustomDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_estado, style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _loading ? null : ejecutarConsulta,
              child: const Text('Consultar datos'),
            ),
          ],
        ),
      ),
    );
  }
}
