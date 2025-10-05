import 'dart:isolate';
import 'package:flutter/material.dart';
import '../../widgets/base_view.dart';

class IsolateDemoScreen extends StatefulWidget {
  const IsolateDemoScreen({super.key});

  @override
  State<IsolateDemoScreen> createState() => _IsolateDemoScreenState();
}

class _IsolateDemoScreenState extends State<IsolateDemoScreen> {
  String _estado = 'Presiona el botón para iniciar tarea pesada';
  bool _loading = false;
  int? _resultado;

  static void sumaGrande(SendPort sendPort) {
    int suma = 0;
    for (int i = 0; i < 100000000; i++) {
      suma += i;
    }
    sendPort.send(suma);
  }

  Future<void> ejecutarIsolate() async {
    setState(() {
      _estado = 'Procesando en Isolate...';
      _loading = true;
      _resultado = null;
    });
    print('Antes de Isolate.spawn');
    final receivePort = ReceivePort();
    await Isolate.spawn(sumaGrande, receivePort.sendPort);
    print('Durante Isolate.spawn');
    receivePort.listen((data) {
      setState(() {
        _estado = '¡Tarea pesada completada!';
        _resultado = data as int;
        _loading = false;
      });
      print('Después de recibir el resultado del Isolate');
      receivePort.close();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: 'Demo Isolate (Tarea pesada)',
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_estado, style: const TextStyle(fontSize: 20)),
            if (_resultado != null)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('Resultado: $_resultado', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _loading ? null : ejecutarIsolate,
              child: const Text('Iniciar tarea pesada'),
            ),
          ],
        ),
      ),
    );
  }
}
