import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Taller01',
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String title = 'The 1975';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
                    title = (title == 'The 1975')
                        ? '¡Título cambiado!'
                        : 'The 1975';
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Título actualizado')),
                  );
                },
                child: const Text('Cambiar título'),
              ),

              const SizedBox(height: 24),

              // Container adicional
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.pink[50],
                  border: Border.all(color: Colors.pinkAccent),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  "The 1975.",
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(height: 16),

              // ListView dentro de un SizedBox
              const Text(
                "Top canciones (ListView):",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 150,
                child: ListView(
                  children: const [
                    ListTile(
                      leading: Icon(Icons.music_note_outlined, color: Colors.pink),
                      title: Text("Love It If We Made It"),
                    ),
                    ListTile(
                      leading: Icon(Icons.music_note, color: Colors.pink),
                      title: Text("Somebody Else"),
                    ),
                    ListTile(
                      leading: Icon(Icons.music_note_rounded, color: Colors.pink),
                      title: Text("If You’re Too Shy (Let Me Know)"),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Stack con imagen y texto superpuesto
              const Text(
                "Ejemplo con Stack (Concierto):",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    "assets/img/the-1975-concert.jpg",
                    height: 180,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    color: Colors.black54,
                    padding: const EdgeInsets.all(8),
                    child: const Text(
                      "The 1975 - At Their Best",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  )
                ],
              ),

              const SizedBox(height: 16),

              // Botón adicional
              OutlinedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text("Escuchando The 1975 en tu mente...")),
                  );
                },
                icon: const Icon(Icons.play_circle_outline),
                label: const Text("Escuchar The 1975"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
