import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Intro Flutter',
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String title = 'Hola, Flutter';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'Estudiante: Jorge Eduardo Cobo Ocampo',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),

            // Row con imágenes
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/4/47/PNG_transparency_demonstration_1.png',
                  width: 100,
                  height: 100,
                ),
                Image.asset(
                  'assets/img/The-1975.jpg',
                  width: 100,
                  height: 100,
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Botón que cambia el título con setState
            ElevatedButton(
              onPressed: () {
                setState(() {
                  title = (title == 'Hola, Flutter')
                      ? 'Flutter flow'
                      : 'Hola, Flutter';
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Título actualizado')),
                );
              },
              child: const Text('Cambiar título'),
            ),
            const SizedBox(height: 24),

            // Expanded para que la ListView ocupe espacio disponible
            Expanded(
              child: ListView(
                children: const [
                  ListTile(
                    leading: Icon(Icons.star, color: Colors.blue),
                    title: Text("Elemento 1"),
                  ),
                  ListTile(
                    leading: Icon(Icons.favorite, color: Colors.red),
                    title: Text("Elemento 2"),
                  ),
                  ListTile(
                    leading: Icon(Icons.settings, color: Colors.green),
                    title: Text("Elemento 3"),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Stack con imagen y texto superpuesto
            SizedBox(
              height: 150,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: const DecorationImage(
                        image: NetworkImage(
                          'https://flutter.dev/assets/homepage/carousel/slide_1-layer_0-1a1112f63bf7b66b74fd9f5bff031f12.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.black54,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Texto sobre la imagen (Stack)",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
